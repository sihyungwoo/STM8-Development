   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  52                     ; 26 int main(){
  54                     	switch	.text
  55  0000               _main:
  59                     ; 28 	CLK_DeInit();
  61  0000 cd0000        	call	_CLK_DeInit
  63                     ; 29 	CLK_HSICmd(ENABLE);
  65  0003 a601          	ld	a,#1
  66  0005 cd0000        	call	_CLK_HSICmd
  68                     ; 30 	CLK_LSICmd(DISABLE);
  70  0008 4f            	clr	a
  71  0009 cd0000        	call	_CLK_LSICmd
  74  000c               L32:
  75                     ; 32 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
  77  000c a611          	ld	a,#17
  78  000e cd0000        	call	_CLK_GetFlagStatus
  80  0011 4d            	tnz	a
  81  0012 27f8          	jreq	L32
  82                     ; 34 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  84  0014 a601          	ld	a,#1
  85  0016 cd0000        	call	_CLK_SYSCLKSourceConfig
  87                     ; 35 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  89  0019 ae0401        	ldw	x,#1025
  90  001c cd0000        	call	_CLK_PeripheralClockConfig
  92                     ; 38 	GPIO_DeInit(GPIOB);
  94  001f ae5005        	ldw	x,#20485
  95  0022 cd0000        	call	_GPIO_DeInit
  97                     ; 39 	GPIO_Init(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7, GPIO_Mode_Out_PP_High_Fast);
  99  0025 4bf0          	push	#240
 100  0027 4be0          	push	#224
 101  0029 ae5005        	ldw	x,#20485
 102  002c cd0000        	call	_GPIO_Init
 104  002f 85            	popw	x
 105                     ; 40 	GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7, ENABLE);
 107  0030 4b01          	push	#1
 108  0032 4be0          	push	#224
 109  0034 ae5005        	ldw	x,#20485
 110  0037 cd0000        	call	_GPIO_ExternalPullUpConfig
 112  003a 85            	popw	x
 113                     ; 47 	SPI_DeInit(SPI1);
 115  003b ae5200        	ldw	x,#20992
 116  003e cd0000        	call	_SPI_DeInit
 118                     ; 48 	SPI1->CR1 = 0x96;			// Baud rate: 2MHz, MSB transmitted first, Master config, HIGH when idle
 120  0041 35965200      	mov	20992,#150
 121                     ; 50 	SPI1->CR2 &= ~0x02;		// Master mode and hardware slave management
 123  0045 72135201      	bres	20993,#1
 124                     ; 51 	SPI1->CR2 |= 0x01;		//	(meaning use GPIO HIGH/LOW level to select slaves)
 126  0049 72105201      	bset	20993,#0
 127                     ; 52 	SPI1->CR1 |= 0x40;		// Enable SPI peripheral
 129  004d 721c5200      	bset	20992,#6
 130  0051               L72:
 132  0051 20fe          	jra	L72
 145                     	xdef	_main
 146                     	xref	_SPI_DeInit
 147                     	xref	_GPIO_ExternalPullUpConfig
 148                     	xref	_GPIO_Init
 149                     	xref	_GPIO_DeInit
 150                     	xref	_CLK_GetFlagStatus
 151                     	xref	_CLK_PeripheralClockConfig
 152                     	xref	_CLK_SYSCLKSourceConfig
 153                     	xref	_CLK_LSICmd
 154                     	xref	_CLK_HSICmd
 155                     	xref	_CLK_DeInit
 174                     	end
