   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  49                     ; 36 int main() {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 37 	GPIO_DeInit(GPIOB);
  58  0000 ae5005        	ldw	x,#20485
  59  0003 cd0000        	call	_GPIO_DeInit
  61                     ; 38 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
  63  0006 4be0          	push	#224
  64  0008 4b40          	push	#64
  65  000a ae5005        	ldw	x,#20485
  66  000d cd0000        	call	_GPIO_Init
  68  0010 85            	popw	x
  69                     ; 40 	Delay(50000);			// To make seeing the reset easier on the board LED 
  71  0011 aec350        	ldw	x,#50000
  72  0014 89            	pushw	x
  73  0015 ae0000        	ldw	x,#0
  74  0018 89            	pushw	x
  75  0019 ad1a          	call	_Delay
  77  001b 5b04          	addw	sp,#4
  78                     ; 43 	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  80  001d a655          	ld	a,#85
  81  001f cd0000        	call	_IWDG_WriteAccessCmd
  83                     ; 44 	IWDG_SetPrescaler(IWDG_Prescaler_256);
  85  0022 a606          	ld	a,#6
  86  0024 cd0000        	call	_IWDG_SetPrescaler
  88                     ; 45 	IWDG_SetReload(0xFF);
  90  0027 a6ff          	ld	a,#255
  91  0029 cd0000        	call	_IWDG_SetReload
  93                     ; 46 	IWDG_Enable();
  95  002c cd0000        	call	_IWDG_Enable
  97                     ; 48 	GPIOB->ODR = 0x40;		// Leave PB6 on
  99  002f 35405005      	mov	20485,#64
 100  0033               L12:
 102  0033 20fe          	jra	L12
 136                     ; 62 void Delay(__IO uint32_t nCount){
 137                     	switch	.text
 138  0035               _Delay:
 140       00000000      OFST:	set	0
 143  0035 2009          	jra	L54
 144  0037               L34:
 145                     ; 65     nCount--; 
 147  0037 96            	ldw	x,sp
 148  0038 1c0003        	addw	x,#OFST+3
 149  003b a601          	ld	a,#1
 150  003d cd0000        	call	c_lgsbc
 152  0040               L54:
 153                     ; 64   while(nCount != 0){ 
 155  0040 96            	ldw	x,sp
 156  0041 1c0003        	addw	x,#OFST+3
 157  0044 cd0000        	call	c_lzmp
 159  0047 26ee          	jrne	L34
 160                     ; 67 } 
 163  0049 81            	ret
 188                     ; 74 void Heartbeat(void) {
 189                     	switch	.text
 190  004a               _Heartbeat:
 194                     ; 76 	GPIO_Write(GPIOC, 0x00);
 196  004a 4b00          	push	#0
 197  004c ae500a        	ldw	x,#20490
 198  004f cd0000        	call	_GPIO_Write
 200  0052 84            	pop	a
 201                     ; 77 	Delay(50000);
 203  0053 aec350        	ldw	x,#50000
 204  0056 89            	pushw	x
 205  0057 ae0000        	ldw	x,#0
 206  005a 89            	pushw	x
 207  005b add8          	call	_Delay
 209  005d 5b04          	addw	sp,#4
 210                     ; 78 	GPIO_Write(GPIOB, GPIO_Pin_6);
 212  005f 4b40          	push	#64
 213  0061 ae5005        	ldw	x,#20485
 214  0064 cd0000        	call	_GPIO_Write
 216  0067 84            	pop	a
 217                     ; 79 	GPIOB->ODR = 0x40;	
 219  0068 35405005      	mov	20485,#64
 220                     ; 81 }
 223  006c 81            	ret
 236                     	xdef	_main
 237                     	xdef	_Heartbeat
 238                     	xdef	_Delay
 239                     	xref	_IWDG_Enable
 240                     	xref	_IWDG_SetReload
 241                     	xref	_IWDG_SetPrescaler
 242                     	xref	_IWDG_WriteAccessCmd
 243                     	xref	_GPIO_Write
 244                     	xref	_GPIO_Init
 245                     	xref	_GPIO_DeInit
 264                     	xref	c_lzmp
 265                     	xref	c_lgsbc
 266                     	end
