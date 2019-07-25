   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 97 void IRTIM_DeInit(void)
  42                     ; 98 {
  44                     	switch	.text
  45  0000               _IRTIM_DeInit:
  49                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  51  0000 725f52ff      	clr	21247
  52                     ; 100 }
  55  0004 81            	ret
 110                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 110                     ; 109 {
 111                     	switch	.text
 112  0005               _IRTIM_Cmd:
 116                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 118                     ; 114   if (NewState ==   DISABLE)
 120  0005 4d            	tnz	a
 121  0006 2606          	jrne	L74
 122                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 124  0008 721152ff      	bres	21247,#0
 126  000c 2004          	jra	L15
 127  000e               L74:
 128                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 130  000e 721052ff      	bset	21247,#0
 131  0012               L15:
 132                     ; 122 }
 135  0012 81            	ret
 171                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 171                     ; 131 {
 172                     	switch	.text
 173  0013               _IRTIM_HighSinkODCmd:
 177                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 179                     ; 136   if (NewState == DISABLE)
 181  0013 4d            	tnz	a
 182  0014 2606          	jrne	L17
 183                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 185  0016 721352ff      	bres	21247,#1
 187  001a 2004          	jra	L37
 188  001c               L17:
 189                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 191  001c 721252ff      	bset	21247,#1
 192  0020               L37:
 193                     ; 144 }
 196  0020 81            	ret
 220                     ; 168 FunctionalState IRTIM_GetStatus(void)
 220                     ; 169 {
 221                     	switch	.text
 222  0021               _IRTIM_GetStatus:
 226                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 228  0021 c652ff        	ld	a,21247
 229  0024 a401          	and	a,#1
 232  0026 81            	ret
 257                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 257                     ; 179 {
 258                     	switch	.text
 259  0027               _IRTIM_GetHighSinkODStatus:
 263                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 265  0027 c652ff        	ld	a,21247
 266  002a a402          	and	a,#2
 269  002c 81            	ret
 282                     	xdef	_IRTIM_GetHighSinkODStatus
 283                     	xdef	_IRTIM_GetStatus
 284                     	xdef	_IRTIM_HighSinkODCmd
 285                     	xdef	_IRTIM_Cmd
 286                     	xdef	_IRTIM_DeInit
 305                     	end
