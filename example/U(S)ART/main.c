/**	UART / USART Example
 *		Shows two ways to initialize USART and UART.
 *		USART is a synchronous version of UART (meaning
 *		there's a clock)
 *	
 *		As a reminder, you can use UART with the USART
 *		peripheral, but	you can't use USART if your 
 *		MCU/STM8 only has the UART peripheral.
 *
 *		**** UNTESTED ****
 *		Please refer to the reference manual (RM0031 on ST) 
 *		for all information about the registers. You may use
 *		the SPL, but you gain more freedom when you set the
 *		register bits yourself. 
 *
 *		
 *
 *
 * 	Pins on STM8L050J3:
 *	USART:
 *	  Pin 8 - PC4: USART_CK
 *		Pin 2 - PA3: USART_RX (Alternate)
 *		Pin 1 - PA2: USART_TX (Alternate) 
 *				Check Datasheet for Pin functions. It'll make sense
 *	UART:
 *		Pin 1 - PC6: USART_RX
 *		Pin 8 - PC5: USART_TX
 *
 * Name: Sihyung
 * Created: 8/13/2019
 * Last Updated: 8/13/2019 - 10:27
 * Device: STM8L050J3
 *
 */
 
 
#include "stm8l15x.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_usart.h"
#include "stm8l15x_syscfg.h"




/*	Delay Function
 *		Just a simple loop delay
 *
 *	@param number to count down from
 */
void Delay(__IO uint32_t nCount) 
{ /* Decrement nCount value */ 
  while (nCount != 0) 
  { 
    nCount--; 
  } 
} 





//**********************************************************
// You can select which you want to test: USART or UART
//**********************************************************
// If you want to test either USART or UART individually,
// change the NAME in '#define NAME' to what you want to
// use. The two options are:
//		#define USART		 -		for testing USART
//		#define UART		 -		for testing UART
//
#define UART			// <- Change here



#ifdef USART


//	USART:
//		Pin 8 - PC4: USART_CK
//		Pin 2 - PA3: USART_RX (Alternate)
//		Pin 1 - PA2: USART_TX (Alternate) 
int main() {
	// Pin 1 on the STM8L050J3 is primarily used for the SWIM function.
	//	 You may notice that one of the USART pins require pin 1, so
	//	 if you still want to program the board, this delay is set
	//	 to give you time to program the board after power-up.
	Delay(150000);			
	
	// Initialize Clock
	CLK_DeInit();

	CLK_LSICmd(DISABLE);	// Use internal high speed clock (16MHz).
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	
	// GPIO Initialization
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOA);
	SYSCFG_REMAPDeInit():			// For USART_TX and USART_RX pin remapping
	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortA, ENABLE);		// Remap alternate pins PA2 and PA3
	
	GPIOC->DDR |= 0x10;			// Input Ouput
	GPIOA->DDR |= 0x04;
	GPIOA->DDR &= ~0x08;	
	
	GPIOC->CR1 &= ~0x10;		// Open drain output
	GPIOA->CR1 &= ~0x0C;		// Floating input, open drain output
	
	GPIOC->CR2 |= 0x10;			// Output speed 10MHz
	GPIOA->CR2 |= 0x04;			// Output speed 10MHz
	GPIOA->CR2 &= ~0x08;		// disable interrupts
	
	// USART Initialization
	USART1->BRR2 = 0x03;		// 10 MHz sys Clk, Baud rate 9600: 10MHz / 9600 = 1042d = 0x0412
	USART1->BRR1 = 0x68;		// BRR2 should be written before BBR1. BBR2 = 1st and 4th nibble
													// BRR1 = 2nd and 3rd nibble
	USART1->CR1 = 0x00;			// 8 bit data frames, no parity bit
	USART1->CR2 = 0x00;			// Don't enable transmitter
	USART1->CR3 = 0x0C;			// Idle 1, enable clock, clock phase and pulse configuration 
	USART1->CR2 = 0x08;			// Enable Transmitter and receiver. (Enable REN if not generating clock)
	
	
	while(1) {
		// USART1->DR
		//	Data register, write to transmit, read for receiving.
		//	Depends on your application and the number of messages
		//		you plan on sending or receiving, you might need to
		//		add some sort of synchronization (i.e. Interrupts).
		//		Or Poll the 'USART1->SR' Status register flags

	}
	
}


#endif




#ifdef UART


//	UART:
//		Pin 1 - PC6: USART_RX
//		Pin 8 - PC5: USART_TX
int main() {
	// Pin 1 on the STM8L050J3 is primarily used for the SWIM function.
	//	 You may notice that one of the USART pins require pin 1, so
	//	 if you still want to program the board, this delay is set
	//	 to give you time to program the board after power-up.	
	Delay(150000);				// Pin 1 gets used. Add delay for SWIM programming	
	
	// Initialize Clock
	CLK_DeInit();

	CLK_LSICmd(DISABLE);	// Use internal high speed clock (16MHz).
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	
	// GPIO Initialization
	GPIO_DeInit(GPIOC);
	GPIOC->DDR |= 0x20;			// Input outputs
	GPIOC->DDR &= ~0x40;
	
	GPIOC->CR1 &= ~0x60;		// Floating input and open drain output
	GPIOC->CR2 |= 0x20;			// Output fast mode (10MHz)
	GPIOC->CR2 &= ~0x40;		// no interrupts (input)
	
	// UART Initialization
	USART1->BRR2 = 0x02;		// 10 MHz sys Clk, Baud rate 9600: 10MHz / 9600 = 1042d = 0x0412
	USART1->BRR1 = 0x41;		// BRR2 should be written before BBR1. BBR2 = 1st and 4th nibble
													// BRR1 = 2nd and 3rd nibble
	USART1->CR1 = 0x00;			// 8 bits per frame, parity disabled
	USART1->CR2 = 0x08;			// Enable transmitter and receiver. No breaks. (Transmitter for Clock generator)
	USART1->CR3 = 0x00;			// Disable USART_Clock for just UART
	
	while(1) {
		// USART1->DR
		//	Data register, write to transmit, read for receiving.
		//	Depends on your application and the number of messages
		//		you plan on sending or receiving, you might need to
		//		add some sort of synchronization (i.e. Interrupts).
		//		Or Poll the 'USART1->SR' Status register flags
		
	}
	
}

#endif