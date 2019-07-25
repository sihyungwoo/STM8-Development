/*	I2C Master Read
 *		STM8L050J3 is the master
 *		Using the MCP9808 I2C Temperature Sensor (modules available from Adafruit or Seeed)
 * 			as the slave. 
 *	
 *
 *	Name: Sihyung
 *  Created: 6/21/2019
 *  Last Updated: 6/21/2019 - 8:51 am
 *		
 */


#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_i2c.h"
#include "stm8l15x_clk.h"


#define MASTER_ADDR 8
#define SLAVE_ADDR 0x18
#define TEMP_REGISTER 0x05


void CLK_Initialization_I2C(void);
void GPIO_Initialization(void);
void I2C_Initialization(uint32_t frequency);
void I2C_Read(uint8_t address, uint8_t *Rx, uint8_t numBytesToRead);
void I2C_Write(uint8_t address, uint8_t *Tx, uint8_t numBytesToRead);
void Grab_Temperature(uint8_t address, uint8_t regPointer, uint8_t *Rx);



//	I2C pins on STM8L050J3
//		PC0 - I2C1_SDA
//		PC1 - I2C1_SCL
//
int main(void) {
	// Declarations
	uint8_t TxResolution[3];
	uint8_t TemperatureGrab[2];
	uint8_t Rx[2];		// Rx[1] is Upper Byte, Rx[0] is Lower Byte
	int16_t Temperature = 0;
	
	// Initializations
	CLK_Initialization_I2C();
	GPIO_Initialization();
	I2C_Initialization(100000);	// Hz

	// Debugging LED
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);

	while(1) {
		Grab_Temperature(SLAVE_ADDR, TEMP_REGISTER, Rx);
		
		Rx[1] &= 0x1F;				// Clear flags
		
		// Ambient Temperature Calculation in Degrees
		if((Rx[1] & 0x10) == 0x10) {		// Temp < 0C
			Rx[1] &= 0x0F;			// Clear SIGN bit
			Temperature = 256 - (Rx[1] * 16 + Rx[0] / 16);
			
		} else {						// Temp >= 0C
			Temperature = Rx[1] * 16 + Rx[0] / 16;
			
		}
		
	}
	
}




/*	GPIO Initialization Function
 *		Initalizes GPIO pins PC0 and PC1 as output, open-drain, High Impedence, 10MHz
 *	Pins:					PC0 - Output
 *								PC1 - Output
 *
 */
void GPIO_Initialization(void) {
	GPIO_DeInit(GPIOC);
	
	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);	// Set PC0 and PC1 output
	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
	
}






/*	I2C Initialization Function
 *		Initializes I2C1 for STM8L050J3
 *		Sets as 7 bit addressing mode and sets master addr (unneeded for Temp Sensor) to 0x08
 *		Just needed to set it a random unused value
 *
 *	Pins:			PC0 - I2C1_SDA
 *					PC1 - I2C1_SCL
 *	@param frequency in units of Hz (i.e. 100000Hz)
 *
 */
void I2C_Initialization(uint32_t frequency) {
	I2C_DeInit(I2C1);
	
	I2C_Init(I2C1, frequency, MASTER_ADDR, I2C_Mode_I2C,I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
	
	I2C_Cmd(I2C1, ENABLE);

}






/*	I2C Clock Initialization Function
 *		No external clocks attach. Uses internal high-speed clock (HSI) for I2C
 *
 */
void CLK_Initialization_I2C(void) {
	CLK_DeInit();

	CLK_LSICmd(DISABLE);	// Use internal clock.
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
	
}



/*	I2C Read Function
 *		A simple Master-Transmit/Slave-Receive function (using 7 bit addressing for I2C)
 *
 *	@param Slave Address
 *  @note   Unshifted slave addr. This function will shift the address to the left by 1 for you
 *			and place the READ/WRITE command at bit 0 for you
 *	@param Pointer to a filled array (unsigned 8 bits data type or char)
 *  @note   ASCII or Hex data types.
 *	@note  'Passing by reference version for C'. All messages to be transmitted will be placed inside pointer
 *  @param number of bytes to send. Size of pointer (array) - Number of elements in array
 *
 */
void I2C_Read(uint8_t address, uint8_t *Rx, uint8_t numBytesToRead) {
	uint8_t i = 0;
	
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
	
	I2C_GenerateSTART(I2C1, ENABLE);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	GPIO_Write(GPIOB, 0x00);
	I2C_Send7bitAddress(I2C1, address, I2C_Direction_Receiver);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
	
	while(numBytesToRead != 0) {
		for(i = 0; I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED);) {
			I2C_AcknowledgeConfig(I2C1, ENABLE);
			Rx[i] = I2C_ReceiveData(I2C1);
			numBytesToRead--;
		}
	}
	
	I2C_GenerateSTOP(I2C1, ENABLE);
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish
	
	
}





/*	I2C Read Function
 *		A simple Master-Receive/Slave-Transmit function (using 7 bit addressing for I2C)
 *		Can be used as a reference
 *
 *	@param Slave Address
 *	@note   Unshifted slave addr. This function will shift the address to the left by 1 for you
 *			and place the READ/WRITE command at bit 0 for you
 *	@param Pointer to an empty array (unsigned 8 bits data type or char)
 *  @note   ASCII or Hex data types.
 *	@note   'Passing by reference version for C'. All messages received will be placed inside pointer
 *  @param number of bytes to read. Size of pointer (array) - Number of elements in array
 *
 */
void I2C_Write(uint8_t address, uint8_t *Tx, uint8_t numBytesToSend) {
	uint8_t i = numBytesToSend;				// STVD doesn't like declarations in for loops :(
	
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
	
	I2C_GenerateSTART(I2C1, ENABLE);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Transmitter);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
		GPIO_Write(GPIOB, 0x00);
	for(i = numBytesToSend; i > 0; i--) {
		I2C_SendData(I2C1, Tx[i]);
		while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
		
	}
	
	I2C_GenerateSTOP(I2C1, ENABLE);
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish
	
}





/*	Grab Temperature Function
 *		Retrieves the temperature from the MCP9809 Temp Module.
 *
 *	@param Slave Address (MCP9808 default is 0x18 - unshifted)
 *  @note   Unshifted slave addr. This function will shift the address to the left by 1 and
 *			add in the READ/WRITE command at bit 0 for you
 *	@param Pointer to specified register in MCP9808 (i.e. Ambient Temperature Register)
 *	@note   Look for pointer of temperature register in datasheet, but by default, it will be 0x05
 *	@param Pointer to an empty 2-element array (unsigned 8 bits data type or char)
 *  @note   'Passing by reference version for C'. Received upper byte and lower byte
 *		    messages are placed inside pointer
 *
 */
void Grab_Temperature(uint8_t address, uint8_t regPointer, uint8_t *Rx) {
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
	
	I2C_GenerateSTART(I2C1, ENABLE);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Transmitter);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	I2C_SendData(I2C1, regPointer);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
	
	I2C_GenerateSTART(I2C1, ENABLE);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
	
	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Receiver);
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
	
	I2C_AcknowledgeConfig(I2C1, ENABLE);
	Rx[1] = I2C_ReceiveData(I2C1);
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BTF));

	I2C_AcknowledgeConfig(I2C1, ENABLE);
	Rx[0] = I2C_ReceiveData(I2C1);
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BTF));
	
	I2C_GenerateSTOP(I2C1, ENABLE);
	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish

}
