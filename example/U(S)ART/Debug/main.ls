   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  53                     ; 41 void Delay(__IO uint32_t nCount) 
  53                     ; 42 { /* Decrement nCount value */ 
  55                     	switch	.text
  56  0000               _Delay:
  58       00000000      OFST:	set	0
  61  0000 2009          	jra	L13
  62  0002               L72:
  63                     ; 45     nCount--; 
  65  0002 96            	ldw	x,sp
  66  0003 1c0003        	addw	x,#OFST+3
  67  0006 a601          	ld	a,#1
  68  0008 cd0000        	call	c_lgsbc
  70  000b               L13:
  71                     ; 43   while (nCount != 0) 
  73  000b 96            	ldw	x,sp
  74  000c 1c0003        	addw	x,#OFST+3
  75  000f cd0000        	call	c_lzmp
  77  0012 26ee          	jrne	L72
  78                     ; 47 } 
  81  0014 81            	ret
 112                     ; 102 int main() {
 113                     	switch	.text
 114  0015               _main:
 118                     ; 103 	Delay(150000);				// Pin 1 gets used. Add delay for SWIM programming	
 120  0015 ae49f0        	ldw	x,#18928
 121  0018 89            	pushw	x
 122  0019 ae0002        	ldw	x,#2
 123  001c 89            	pushw	x
 124  001d ade1          	call	_Delay
 126  001f 5b04          	addw	sp,#4
 127                     ; 106 	CLK_DeInit();
 129  0021 cd0000        	call	_CLK_DeInit
 131                     ; 108 	CLK_LSICmd(DISABLE);	// Use internal high speed clock (16MHz).
 133  0024 4f            	clr	a
 134  0025 cd0000        	call	_CLK_LSICmd
 136                     ; 109 	CLK_HSICmd(ENABLE);
 138  0028 a601          	ld	a,#1
 139  002a cd0000        	call	_CLK_HSICmd
 142  002d               L74:
 143                     ; 110 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
 145  002d a611          	ld	a,#17
 146  002f cd0000        	call	_CLK_GetFlagStatus
 148  0032 4d            	tnz	a
 149  0033 27f8          	jreq	L74
 150                     ; 112 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 152  0035 a601          	ld	a,#1
 153  0037 cd0000        	call	_CLK_SYSCLKSourceConfig
 155                     ; 113 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
 157  003a ae0501        	ldw	x,#1281
 158  003d cd0000        	call	_CLK_PeripheralClockConfig
 160                     ; 116 	GPIO_DeInit(GPIOC);
 162  0040 ae500a        	ldw	x,#20490
 163  0043 cd0000        	call	_GPIO_DeInit
 165                     ; 117 	GPIOC->DDR |= 0x20;
 167  0046 721a500c      	bset	20492,#5
 168                     ; 118 	GPIOC->DDR &= ~0x40;
 170  004a 721d500c      	bres	20492,#6
 171                     ; 120 	GPIOC->CR1 &= ~0x60;		// Floating input and open drain output
 173  004e c6500d        	ld	a,20493
 174  0051 a49f          	and	a,#159
 175  0053 c7500d        	ld	20493,a
 176                     ; 121 	GPIOC->CR2 |= 0x20;			// Output fast mode (10MHz)
 178  0056 721a500e      	bset	20494,#5
 179                     ; 122 	GPIOC->CR2 &= ~0x40;		// no interrupts (input)
 181  005a 721d500e      	bres	20494,#6
 182                     ; 126 	USART1->BRR2 = 0x02;		// 10 MHz sys Clk, Baud rate 9600: 10MHz / 9600 = 1042d = 0x0412
 184  005e 35025233      	mov	21043,#2
 185                     ; 127 	USART1->BRR1 = 0x41;		// BRR2 should be written before BBR1. BBR2 = 1st and 4th nibble
 187  0062 35415232      	mov	21042,#65
 188                     ; 129 	USART1->CR1 = 0x00;			// 8 bits per frame, parity disabled
 190  0066 725f5234      	clr	21044
 191                     ; 130 	USART1->CR2 = 0x0C;			// Enable transmitter and receiver. No breaks
 193  006a 350c5235      	mov	21045,#12
 194                     ; 131 	USART1->CR3 = 0x00;			// Disable USART_Clock
 196  006e 725f5236      	clr	21046
 197  0072               L35:
 199  0072 20fe          	jra	L35
 212                     	xdef	_main
 213                     	xdef	_Delay
 214                     	xref	_GPIO_DeInit
 215                     	xref	_CLK_GetFlagStatus
 216                     	xref	_CLK_PeripheralClockConfig
 217                     	xref	_CLK_SYSCLKSourceConfig
 218                     	xref	_CLK_LSICmd
 219                     	xref	_CLK_HSICmd
 220                     	xref	_CLK_DeInit
 239                     	xref	c_lzmp
 240                     	xref	c_lgsbc
 241                     	end
