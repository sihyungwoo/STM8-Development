   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  53                     ; 25 void Delay(__IO uint32_t nCount) {
  55                     	switch	.text
  56  0000               _Delay:
  58       00000000      OFST:	set	0
  61  0000 2009          	jra	L13
  62  0002               L72:
  63                     ; 28     nCount--; 
  65  0002 96            	ldw	x,sp
  66  0003 1c0003        	addw	x,#OFST+3
  67  0006 a601          	ld	a,#1
  68  0008 cd0000        	call	c_lgsbc
  70  000b               L13:
  71                     ; 27   while (nCount != 0) { 
  73  000b 96            	ldw	x,sp
  74  000c 1c0003        	addw	x,#OFST+3
  75  000f cd0000        	call	c_lzmp
  77  0012 26ee          	jrne	L72
  78                     ; 30 } 
  81  0014 81            	ret
 109                     ; 34  int main(void) {
 110                     	switch	.text
 111  0015               _main:
 115                     ; 35 	CLK_Initialization_TIM3();
 117  0015 ad57          	call	_CLK_Initialization_TIM3
 119                     ; 36 	GPIO_Initialization_TIM3();
 121  0017 ad17          	call	_GPIO_Initialization_TIM3
 123                     ; 37 	PWM_Initialization_TIM3(999, 500);		// Period 1000 (1ms) and pulse (50% duty cycle)
 125  0019 ae01f4        	ldw	x,#500
 126  001c 89            	pushw	x
 127  001d ae03e7        	ldw	x,#999
 128  0020 ad20          	call	_PWM_Initialization_TIM3
 130  0022 85            	popw	x
 131                     ; 39 	TIM3_CtrlPWMOutputs(ENABLE);
 133  0023 a601          	ld	a,#1
 134  0025 cd0000        	call	_TIM3_CtrlPWMOutputs
 136  0028               L54:
 137                     ; 42 		TIM3_SetCompare2(500);		// Function to change the duty cycle of the PWM
 139  0028 ae01f4        	ldw	x,#500
 140  002b cd0000        	call	_TIM3_SetCompare2
 143  002e 20f8          	jra	L54
 169                     ; 55 void GPIO_Initialization_TIM3(void) {
 170                     	switch	.text
 171  0030               _GPIO_Initialization_TIM3:
 175                     ; 56 	GPIO_DeInit(GPIOD);
 177  0030 ae500f        	ldw	x,#20495
 178  0033 cd0000        	call	_GPIO_DeInit
 180                     ; 58 	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_Out_PP_Low_Fast);
 182  0036 4be0          	push	#224
 183  0038 4b01          	push	#1
 184  003a ae500f        	ldw	x,#20495
 185  003d cd0000        	call	_GPIO_Init
 187  0040 85            	popw	x
 188                     ; 62  }
 191  0041 81            	ret
 241                     ; 84 void PWM_Initialization_TIM3(uint16_t period, uint16_t pulse) {
 242                     	switch	.text
 243  0042               _PWM_Initialization_TIM3:
 245  0042 89            	pushw	x
 246       00000000      OFST:	set	0
 249                     ; 85 	TIM3_DeInit();
 251  0043 cd0000        	call	_TIM3_DeInit
 253                     ; 87 	TIM3_TimeBaseInit(TIM3_Prescaler_1, TIM3_CounterMode_Up, period);		//Period of 1ms
 255  0046 1e01          	ldw	x,(OFST+1,sp)
 256  0048 89            	pushw	x
 257  0049 5f            	clrw	x
 258  004a cd0000        	call	_TIM3_TimeBaseInit
 260  004d 85            	popw	x
 261                     ; 89 	TIM3_OC2Init(TIM3_OCMode_PWM2, TIM3_OutputState_Enable, pulse, TIM3_OCPolarity_High, TIM3_OCIdleState_Set);
 263  004e 4b01          	push	#1
 264  0050 4b00          	push	#0
 265  0052 1e07          	ldw	x,(OFST+7,sp)
 266  0054 89            	pushw	x
 267  0055 ae7001        	ldw	x,#28673
 268  0058 cd0000        	call	_TIM3_OC2Init
 270  005b 5b04          	addw	sp,#4
 271                     ; 90 	TIM3_OC2PreloadConfig(ENABLE);
 273  005d a601          	ld	a,#1
 274  005f cd0000        	call	_TIM3_OC2PreloadConfig
 276                     ; 92 	TIM3_ARRPreloadConfig(ENABLE);
 278  0062 a601          	ld	a,#1
 279  0064 cd0000        	call	_TIM3_ARRPreloadConfig
 281                     ; 93 	TIM3_Cmd(ENABLE);
 283  0067 a601          	ld	a,#1
 284  0069 cd0000        	call	_TIM3_Cmd
 286                     ; 96 }
 289  006c 85            	popw	x
 290  006d 81            	ret
 320                     ; 107 void CLK_Initialization_TIM3(void) {
 321                     	switch	.text
 322  006e               _CLK_Initialization_TIM3:
 326                     ; 108 	CLK_DeInit();
 328  006e cd0000        	call	_CLK_DeInit
 330                     ; 110 	CLK_LSICmd(DISABLE);	// Use internal clock.
 332  0071 4f            	clr	a
 333  0072 cd0000        	call	_CLK_LSICmd
 335                     ; 111 	CLK_HSICmd(ENABLE);
 337  0075 a601          	ld	a,#1
 338  0077 cd0000        	call	_CLK_HSICmd
 341  007a               L511:
 342                     ; 112 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
 344  007a a611          	ld	a,#17
 345  007c cd0000        	call	_CLK_GetFlagStatus
 347  007f 4d            	tnz	a
 348  0080 27f8          	jreq	L511
 349                     ; 114 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 351  0082 a601          	ld	a,#1
 352  0084 cd0000        	call	_CLK_SYSCLKSourceConfig
 354                     ; 116 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
 356  0087 ae0101        	ldw	x,#257
 357  008a cd0000        	call	_CLK_PeripheralClockConfig
 359                     ; 118 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
 361  008d ae0400        	ldw	x,#1024
 362  0090 cd0000        	call	_CLK_PeripheralClockConfig
 364                     ; 119 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 366  0093 ae1000        	ldw	x,#4096
 367  0096 cd0000        	call	_CLK_PeripheralClockConfig
 369                     ; 120 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 371  0099 ae0500        	ldw	x,#1280
 372  009c cd0000        	call	_CLK_PeripheralClockConfig
 374                     ; 123 }
 377  009f 81            	ret
 390                     	xdef	_main
 391                     	xdef	_Delay
 392                     	xdef	_CLK_Initialization_TIM3
 393                     	xdef	_PWM_Initialization_TIM3
 394                     	xdef	_GPIO_Initialization_TIM3
 395                     	xref	_TIM3_OC2PreloadConfig
 396                     	xref	_TIM3_SetCompare2
 397                     	xref	_TIM3_CtrlPWMOutputs
 398                     	xref	_TIM3_OC2Init
 399                     	xref	_TIM3_Cmd
 400                     	xref	_TIM3_ARRPreloadConfig
 401                     	xref	_TIM3_TimeBaseInit
 402                     	xref	_TIM3_DeInit
 403                     	xref	_GPIO_Init
 404                     	xref	_GPIO_DeInit
 405                     	xref	_CLK_GetFlagStatus
 406                     	xref	_CLK_PeripheralClockConfig
 407                     	xref	_CLK_SYSCLKSourceConfig
 408                     	xref	_CLK_LSICmd
 409                     	xref	_CLK_HSICmd
 410                     	xref	_CLK_DeInit
 429                     	xref	c_lzmp
 430                     	xref	c_lgsbc
 431                     	end
