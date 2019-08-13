   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  62                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  62                     ; 120 {
  64                     	switch	.text
  65  0000               _WWDG_Init:
  67  0000 89            	pushw	x
  68       00000000      OFST:	set	0
  71                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  73                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  75  0001 357f50d4      	mov	20692,#127
  76                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  78  0005 9e            	ld	a,xh
  79  0006 aa80          	or	a,#128
  80  0008 c750d3        	ld	20691,a
  81                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  83  000b 7b02          	ld	a,(OFST+2,sp)
  84  000d a47f          	and	a,#127
  85  000f c750d4        	ld	20692,a
  86                     ; 127 }
  89  0012 85            	popw	x
  90  0013 81            	ret
 134                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 134                     ; 136 {
 135                     	switch	.text
 136  0014               _WWDG_SetWindowValue:
 138  0014 88            	push	a
 139       00000001      OFST:	set	1
 142                     ; 137   __IO uint8_t tmpreg = 0;
 144  0015 0f01          	clr	(OFST+0,sp)
 146                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 148                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 150  0017 a47f          	and	a,#127
 151  0019 1a01          	or	a,(OFST+0,sp)
 152  001b 6b01          	ld	(OFST+0,sp),a
 154                     ; 146   WWDG->WR = tmpreg;
 156  001d 7b01          	ld	a,(OFST+0,sp)
 157  001f c750d4        	ld	20692,a
 158                     ; 147 }
 161  0022 84            	pop	a
 162  0023 81            	ret
 196                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 196                     ; 157 {
 197                     	switch	.text
 198  0024               _WWDG_SetCounter:
 202                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 204                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 206  0024 a47f          	and	a,#127
 207  0026 c750d3        	ld	20691,a
 208                     ; 164 }
 211  0029 81            	ret
 245                     ; 187 void WWDG_Enable(uint8_t Counter)
 245                     ; 188 {
 246                     	switch	.text
 247  002a               _WWDG_Enable:
 251                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 253                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 255  002a aa80          	or	a,#128
 256  002c c750d3        	ld	20691,a
 257                     ; 192 }
 260  002f 81            	ret
 283                     ; 216 uint8_t WWDG_GetCounter(void)
 283                     ; 217 {
 284                     	switch	.text
 285  0030               _WWDG_GetCounter:
 289                     ; 218   return(WWDG->CR);
 291  0030 c650d3        	ld	a,20691
 294  0033 81            	ret
 317                     ; 226 void WWDG_SWReset(void)
 317                     ; 227 {
 318                     	switch	.text
 319  0034               _WWDG_SWReset:
 323                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 325  0034 358050d3      	mov	20691,#128
 326                     ; 229 }
 329  0038 81            	ret
 342                     	xdef	_WWDG_SWReset
 343                     	xdef	_WWDG_GetCounter
 344                     	xdef	_WWDG_Enable
 345                     	xdef	_WWDG_SetCounter
 346                     	xdef	_WWDG_SetWindowValue
 347                     	xdef	_WWDG_Init
 366                     	end
