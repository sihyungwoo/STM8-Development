   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  67                     ; 17 int main(){
  69                     	switch	.text
  70  0000               _main:
  72  0000 89            	pushw	x
  73       00000002      OFST:	set	2
  76                     ; 18 	uint16_t ADCval = 0;
  78                     ; 21 	CLK_DeInit();
  80  0001 cd0000        	call	_CLK_DeInit
  82                     ; 22 	ADC_DeInit(ADC1);
  84  0004 ae5340        	ldw	x,#21312
  85  0007 cd0000        	call	_ADC_DeInit
  87                     ; 24 	CLK_LSICmd(DISABLE);	// Use internal clock.
  89  000a 4f            	clr	a
  90  000b cd0000        	call	_CLK_LSICmd
  92                     ; 25 	CLK_HSICmd(ENABLE);
  94  000e a601          	ld	a,#1
  95  0010 cd0000        	call	_CLK_HSICmd
  98  0013               L13:
  99                     ; 26 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
 101  0013 a611          	ld	a,#17
 102  0015 cd0000        	call	_CLK_GetFlagStatus
 104  0018 4d            	tnz	a
 105  0019 27f8          	jreq	L13
 106                     ; 28 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 108  001b a601          	ld	a,#1
 109  001d cd0000        	call	_CLK_SYSCLKSourceConfig
 111                     ; 30 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 113  0020 ae1001        	ldw	x,#4097
 114  0023 cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 31 ADCval = 1;
 118                     ; 32 	GPIO_DeInit(GPIOB);
 120  0026 ae5005        	ldw	x,#20485
 121  0029 cd0000        	call	_GPIO_DeInit
 123                     ; 33 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_In_FL_No_IT);
 125  002c 4b00          	push	#0
 126  002e 4b40          	push	#64
 127  0030 ae5005        	ldw	x,#20485
 128  0033 cd0000        	call	_GPIO_Init
 130  0036 85            	popw	x
 131                     ; 35 	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_10Bit, ADC_Prescaler_1);
 133  0037 4b00          	push	#0
 134  0039 4b20          	push	#32
 135  003b 4b04          	push	#4
 136  003d ae5340        	ldw	x,#21312
 137  0040 cd0000        	call	_ADC_Init
 139  0043 5b03          	addw	sp,#3
 140                     ; 36 	ADC_ChannelCmd(ADC1, ADC_Channel_12, ENABLE);
 142  0045 4b01          	push	#1
 143  0047 ae0210        	ldw	x,#528
 144  004a 89            	pushw	x
 145  004b ae5340        	ldw	x,#21312
 146  004e cd0000        	call	_ADC_ChannelCmd
 148  0051 5b03          	addw	sp,#3
 149                     ; 38 	ADC_Cmd(ADC1, ENABLE);
 151  0053 4b01          	push	#1
 152  0055 ae5340        	ldw	x,#21312
 153  0058 cd0000        	call	_ADC_Cmd
 155  005b 84            	pop	a
 156  005c               L53:
 157                     ; 42 		ADC_SoftwareStartConv(ADC1);
 159  005c ae5340        	ldw	x,#21312
 160  005f cd0000        	call	_ADC_SoftwareStartConv
 162                     ; 43 		if((ADC1->SR & 0x01) == 0x01) {
 164  0062 c65343        	ld	a,21315
 165  0065 a401          	and	a,#1
 166  0067 a101          	cp	a,#1
 167  0069 26f1          	jrne	L53
 168                     ; 44 			ADCval = ADC_GetConversionValue(ADC1);
 170  006b ae5340        	ldw	x,#21312
 171  006e cd0000        	call	_ADC_GetConversionValue
 173                     ; 45 			ADC1->SR &= (~0x01);
 175  0071 72115343      	bres	21315,#0
 176  0075 20e5          	jra	L53
 189                     	xdef	_main
 190                     	xref	_GPIO_Init
 191                     	xref	_GPIO_DeInit
 192                     	xref	_CLK_GetFlagStatus
 193                     	xref	_CLK_PeripheralClockConfig
 194                     	xref	_CLK_SYSCLKSourceConfig
 195                     	xref	_CLK_LSICmd
 196                     	xref	_CLK_HSICmd
 197                     	xref	_CLK_DeInit
 198                     	xref	_ADC_GetConversionValue
 199                     	xref	_ADC_ChannelCmd
 200                     	xref	_ADC_SoftwareStartConv
 201                     	xref	_ADC_Cmd
 202                     	xref	_ADC_Init
 203                     	xref	_ADC_DeInit
 222                     	end
