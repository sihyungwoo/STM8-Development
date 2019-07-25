   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 123                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 123                     ; 100 {
 125                     	switch	.text
 126  0000               _RST_GetFlagStatus:
 130                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 132                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 134  0000 c450b1        	and	a,20657
 135  0003 2603          	jrne	L6
 136  0005 4f            	clr	a
 137  0006 2002          	jra	L01
 138  0008               L6:
 139  0008 a601          	ld	a,#1
 140  000a               L01:
 143  000a 81            	ret
 178                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 178                     ; 121 {
 179                     	switch	.text
 180  000b               _RST_ClearFlag:
 184                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 186                     ; 125   RST->SR = (uint8_t)RST_Flag;
 188  000b c750b1        	ld	20657,a
 189                     ; 126 }
 192  000e 81            	ret
 215                     ; 149 void RST_GPOutputEnable(void)
 215                     ; 150 {
 216                     	switch	.text
 217  000f               _RST_GPOutputEnable:
 221                     ; 152   RST->CR = RST_CR_MASK;
 223  000f 35d050b0      	mov	20656,#208
 224                     ; 153 }
 227  0013 81            	ret
 240                     	xdef	_RST_GPOutputEnable
 241                     	xdef	_RST_ClearFlag
 242                     	xdef	_RST_GetFlagStatus
 261                     	end
