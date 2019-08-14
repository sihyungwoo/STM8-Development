/**	SPI Example Code
 *	
 *		Example on setting up SPI
 *
 *			**** UNTESTED ****		
 *	
 *			Please read the reference manual (RM0031 on ST)
 *		to learn the configuration registers. No project 
 *		utilized the SPI protocol so the initialization  
 *		was never tested.
 *
 *	Name: Sihyung
 *	Created: 7/30/2019
 *	Last Updated: 8/14/2019
 *	Device: STM8L050J3
 */



#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_spi.h"


int main(){
	// Clock Initialization
	CLK_DeInit();
	CLK_HSICmd(ENABLE);
	CLK_LSICmd(DISABLE);
	
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
	
	// GPIO & Pull-Up Resistor Initialization (PB5, PB6, PB7)
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7, GPIO_Mode_Out_PP_High_Fast);
	GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7, ENABLE);
	// Initialize another GPIO output pin for the slave select.
	//****	Remember, one Slave Select pin (on the MCU) for each slave
	// for indiviual communication. After Initializing the pin,
	// set it to Logic Level HIGH or '1'.
	
	// SPI Initialization
	SPI_DeInit(SPI1);
	SPI1->CR1 = 0x96;			// Baud rate: 2MHz, MSB transmitted first, Master config, HIGH when idle
												// First clock transition is first data capture
	SPI1->CR2 &= ~0x02;		// Master mode and hardware slave management
	SPI1->CR2 |= 0x01;		//	(meaning use GPIO HIGH/LOW level to select slaves)
	SPI1->CR1 |= 0x40;		// Enable SPI peripheral
	
	while(1){
		// SPI1->SR & SPI1->DR :: Status & Data Register
		//			Read Data Register for receiving and Write to
		//		the Data Register for transmitting		
		//			Depending on your application, you will have to
		//		implement some sort of syncrhonization with your
		//		connected slave or master device. I recommend using
		//		interrupts and FIFOs or Mailboxes for robustness, but
		//		it is more complicated and require extra steps to
		//		initialize
		//			If you don't want to use interrupts, you can just
		//		poll the status register flags and do busy-wait
		//		synchronization.
		//
		//										*** Reminder ***
		//		Before writing or reading the Data Register, you must
		//		reset the GPIO pin (SS) to whichever slave you want to talk
		//		to, to logic level LOW or '0'. After you're done
		//		reading or writing the Data Register, set the GPIO pin (SS)
		//		back to HIGH or '1'.
	}
}