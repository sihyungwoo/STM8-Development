/*	PWM Test
 *	Testing PWM2 using TIM3 on the STM8L-DISCOVERY
 *
 * 	Name: Sihyung
 *	Created: 6/21/2019
 *  Last Updated: 6/21/2019
 *
 */
 
 
 
#include "stm8l15x.h"
#include "stm8l15x_gpio.h"
#include "stm8l15x_tim3.h"
#include "stm8l15x_clk.h"
 
 
 
void GPIO_Initialization_TIM3(void);
void PWM_Initialization_TIM3(uint16_t period, uint16_t pulse);
void CLK_Initialization_TIM3(void);
 
 
 
void Delay(__IO uint32_t nCount) {
  /* Decrement nCount value */ 
  while (nCount != 0) { 
    nCount--; 
  } 
} 
 
 
 
 int main(void) {
	CLK_Initialization_TIM3();
	GPIO_Initialization_TIM3();
	PWM_Initialization_TIM3(999, 500);		// Period 1000 (1ms) and pulse (50% duty cycle)
	
	TIM3_CtrlPWMOutputs(ENABLE);

	while(1) {
		TIM3_SetCompare2(500);		// Function to change the duty cycle of the PWM
	}
	
 }
 
 
 
 
/*	GPIO Initialization Function
 *		Initalizes GPIO pins PD0 for PWM output
 *	Pins:	PD0 - Output PP low-fast (TIM3 - PWM2)
 *
 */
void GPIO_Initialization_TIM3(void) {
	GPIO_DeInit(GPIOD);
	
	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast);
	 
	 
	 
 }
 
 
 
 
 
 
/*	PWM Initialization Function
 *		Initializes TIM3 - PWM2 for STM8L050J3
 *	Pins:			PD0 (Pin 5)
 *	@param period of PWM wave (i.e. 999 - 2KHz frequency)
 *  @note   If you want to set your own period, then subtract 1 from your period when calling the function.
 *          i.e. Wanted Period: 4096, then you want to pass 
 *				'4096 - 1' = 4095 for the first
 *          	the first input parameter
 *			('Wanted Period - 1' = period)
 *	@param pulse length for Duty Cycle based on your given period.
 *  @note   If you want a period of 4096 and want a 25% duty cycle. Then you want to
 *				do 4096 * (1 - 0.25) = 3072 into pulse
 *			Counter-Intuitive. Pulse length is the time that the wave is logic level low
 *
 */
void PWM_Initialization_TIM3(uint16_t period, uint16_t pulse) {
	TIM3_DeInit();
	
	TIM3_TimeBaseInit(TIM3_Prescaler_1, TIM3_CounterMode_Up, period);		//Period of 1ms
	
	TIM3_OC2Init(TIM3_OCMode_PWM2, TIM3_OutputState_Enable, pulse, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
	TIM3_OC2PreloadConfig(ENABLE);
	
	TIM3_ARRPreloadConfig(ENABLE);
	TIM3_Cmd(ENABLE);
	
	
}






/*	Clock Initialization Function
 *		No external clocks attach. Uses internal low-speed clock (LSI) for TIM3 PWM2
 *
 */
void CLK_Initialization_TIM3(void) {
	CLK_DeInit();

	CLK_LSICmd(DISABLE);	// Use internal clock.
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
	
	
}
	