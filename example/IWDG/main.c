/** Example for Independent Watchdog Timer
 *		Shows how to initialize and use STM8L's independent watchdog timer
 *		Testing by keeping on the LED at PB7 and not resetting the timer. 
 *
 *
 *	Name: Sihyung
 *  Created: 7/26/2019
 *	Last Updated: 7/26/2019
 *
 */



#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_clk.h"
#include "stm8l15x_iwdg.h"




/**	Simple Delay Function
 *		Decrementing delay, no timers used
 */
void Delay(__IO uint32_t nCount);


/** LED Heartbeat Function
 *		On custom mader development board, PB6 is connected to the LED
 */
void Heartbeat(void);




int main() {
	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);

	Delay(50000);			// To make seeing the reset easier on the board LED 

	// Independent watchdog timer initialization
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_SetPrescaler(IWDG_Prescaler_256);		// Timeout period is approximately 1.72463s
	IWDG_SetReload(0xFF);						// (Check reference manual for more infor)
	IWDG_Enable();
	
	GPIOB->ODR = 0x40;		// Leave PB6 on
	
	while(1) {
	//	IWDG_ReloadCounter();
	}

}




/**	Simple Delay Function
 *		Decrementing delay, no timers used
 */
void Delay(__IO uint32_t nCount){
  // Decrement nCount value
  while(nCount != 0){ 
    nCount--; 
  } 
} 



/** LED Heartbeat Function
 *		On custom mader development board, PB6 is connected to the LED
 */
void Heartbeat(void) {
	// Heartbeat
	GPIO_Write(GPIOC, 0x00);
	Delay(50000);
	GPIO_Write(GPIOB, GPIO_Pin_6);
	GPIOB->ODR = 0x40;	
	
}
