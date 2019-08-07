/** ADC Example
 *		Using SPL and STM8L050J3
 *		Pin 6 - ADC1IN12
 *
 **	Note:	When in the debugger, ADCval doesn't get updated but if you follow the registers
 *		and the watch window for tmpreg, the correct ADC values will show  up.
 *
 *	Name: Sihyung
 *	Created: 8/7/2019 - 10:05
 *	Last Updated: 8/7/2019
 */


#include "stm8l15x.h"
#include "stm8l15x_adc.h"
#include "stm8l15x_clk.h"



int main(){
	uint16_t ADCval = 0;
	
	
	CLK_DeInit();
	ADC_DeInit(ADC1);
	
	CLK_LSICmd(DISABLE);	// Use internal clock.
	CLK_HSICmd(ENABLE);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_In_FL_No_IT);
	
	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_10Bit, ADC_Prescaler_1);
	ADC_ChannelCmd(ADC1, ADC_Channel_12, ENABLE);
	
	ADC_Cmd(ADC1, ENABLE);

	while (1){
		ADC_SoftwareStartConv(ADC1);
		if((ADC1->SR & 0x01) == 0x01) {					// Check end of conversion flag (EOC)
			ADCval = ADC_GetConversionValue(ADC1);
			ADC1->SR &= (~0x01);						// Clear EOC flag
		}
	}
}