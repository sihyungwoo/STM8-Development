   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 82 void PWR_DeInit(void)
  42                     ; 83 {
  44                     	switch	.text
  45  0000               _PWR_DeInit:
  49                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  51  0000 352050b2      	mov	20658,#32
  52                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  54  0004 725f50b3      	clr	20659
  55                     ; 86 }
  58  0008 81            	ret
 155                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 155                     ; 103 {
 156                     	switch	.text
 157  0009               _PWR_PVDLevelConfig:
 159  0009 88            	push	a
 160       00000000      OFST:	set	0
 163                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 165                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 167  000a c650b2        	ld	a,20658
 168  000d a4f1          	and	a,#241
 169  000f c750b2        	ld	20658,a
 170                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 172  0012 c650b2        	ld	a,20658
 173  0015 1a01          	or	a,(OFST+1,sp)
 174  0017 c750b2        	ld	20658,a
 175                     ; 113 }
 178  001a 84            	pop	a
 179  001b 81            	ret
 234                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 234                     ; 122 {
 235                     	switch	.text
 236  001c               _PWR_PVDCmd:
 240                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 242                     ; 126   if (NewState != DISABLE)
 244  001c 4d            	tnz	a
 245  001d 2706          	jreq	L111
 246                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 248  001f 721050b2      	bset	20658,#0
 250  0023 2004          	jra	L311
 251  0025               L111:
 252                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 254  0025 721150b2      	bres	20658,#0
 255  0029               L311:
 256                     ; 136 }
 259  0029 81            	ret
 294                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 294                     ; 172 {
 295                     	switch	.text
 296  002a               _PWR_FastWakeUpCmd:
 300                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 302                     ; 176   if (NewState != DISABLE)
 304  002a 4d            	tnz	a
 305  002b 2706          	jreq	L331
 306                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 308  002d 721450b3      	bset	20659,#2
 310  0031 2004          	jra	L531
 311  0033               L331:
 312                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 314  0033 721550b3      	bres	20659,#2
 315  0037               L531:
 316                     ; 186 }
 319  0037 81            	ret
 355                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 355                     ; 195 {
 356                     	switch	.text
 357  0038               _PWR_UltraLowPowerCmd:
 361                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 363                     ; 199   if (NewState != DISABLE)
 365  0038 4d            	tnz	a
 366  0039 2706          	jreq	L551
 367                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 369  003b 721250b3      	bset	20659,#1
 371  003f 2004          	jra	L751
 372  0041               L551:
 373                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 375  0041 721350b3      	bres	20659,#1
 376  0045               L751:
 377                     ; 209 }
 380  0045 81            	ret
 415                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 415                     ; 233 {
 416                     	switch	.text
 417  0046               _PWR_PVDITConfig:
 421                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 423                     ; 237   if (NewState != DISABLE)
 425  0046 4d            	tnz	a
 426  0047 2706          	jreq	L771
 427                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 429  0049 721850b2      	bset	20658,#4
 431  004d 2004          	jra	L102
 432  004f               L771:
 433                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 435  004f 721950b2      	bres	20658,#4
 436  0053               L102:
 437                     ; 247 }
 440  0053 81            	ret
 533                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 533                     ; 262 {
 534                     	switch	.text
 535  0054               _PWR_GetFlagStatus:
 537  0054 88            	push	a
 538  0055 88            	push	a
 539       00000001      OFST:	set	1
 542                     ; 263   FlagStatus bitstatus = RESET;
 544                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 546                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 548  0056 a501          	bcp	a,#1
 549  0058 2711          	jreq	L742
 550                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 552  005a c650b3        	ld	a,20659
 553  005d a501          	bcp	a,#1
 554  005f 2706          	jreq	L152
 555                     ; 272       bitstatus = SET;
 557  0061 a601          	ld	a,#1
 558  0063 6b01          	ld	(OFST+0,sp),a
 561  0065 2013          	jra	L552
 562  0067               L152:
 563                     ; 276       bitstatus = RESET;
 565  0067 0f01          	clr	(OFST+0,sp)
 567  0069 200f          	jra	L552
 568  006b               L742:
 569                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 571  006b c650b2        	ld	a,20658
 572  006e 1502          	bcp	a,(OFST+1,sp)
 573  0070 2706          	jreq	L752
 574                     ; 283       bitstatus = SET;
 576  0072 a601          	ld	a,#1
 577  0074 6b01          	ld	(OFST+0,sp),a
 580  0076 2002          	jra	L552
 581  0078               L752:
 582                     ; 287       bitstatus = RESET;
 584  0078 0f01          	clr	(OFST+0,sp)
 586  007a               L552:
 587                     ; 292   return((FlagStatus)bitstatus);
 589  007a 7b01          	ld	a,(OFST+0,sp)
 592  007c 85            	popw	x
 593  007d 81            	ret
 616                     ; 300 void PWR_PVDClearFlag(void)
 616                     ; 301 {
 617                     	switch	.text
 618  007e               _PWR_PVDClearFlag:
 622                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 624  007e 721a50b2      	bset	20658,#5
 625                     ; 304 }
 628  0082 81            	ret
 682                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 682                     ; 312 {
 683                     	switch	.text
 684  0083               _PWR_PVDGetITStatus:
 686  0083 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 313   ITStatus bitstatus = RESET;
 692                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 696                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 698  0084 c650b2        	ld	a,20658
 699  0087 a420          	and	a,#32
 700  0089 6b01          	ld	(OFST-1,sp),a
 702                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 704  008b c650b2        	ld	a,20658
 705  008e a410          	and	a,#16
 706  0090 6b02          	ld	(OFST+0,sp),a
 708                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 710  0092 0d01          	tnz	(OFST-1,sp)
 711  0094 270a          	jreq	L123
 713  0096 0d02          	tnz	(OFST+0,sp)
 714  0098 2706          	jreq	L123
 715                     ; 322     bitstatus = (ITStatus)SET;
 717  009a a601          	ld	a,#1
 718  009c 6b02          	ld	(OFST+0,sp),a
 721  009e 2002          	jra	L323
 722  00a0               L123:
 723                     ; 326     bitstatus = (ITStatus)RESET;
 725  00a0 0f02          	clr	(OFST+0,sp)
 727  00a2               L323:
 728                     ; 328   return ((ITStatus)bitstatus);
 730  00a2 7b02          	ld	a,(OFST+0,sp)
 733  00a4 85            	popw	x
 734  00a5 81            	ret
 758                     ; 336 void PWR_PVDClearITPendingBit(void)
 758                     ; 337 {
 759                     	switch	.text
 760  00a6               _PWR_PVDClearITPendingBit:
 764                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 766  00a6 721a50b2      	bset	20658,#5
 767                     ; 340 }
 770  00aa 81            	ret
 783                     	xdef	_PWR_PVDClearITPendingBit
 784                     	xdef	_PWR_PVDClearFlag
 785                     	xdef	_PWR_GetFlagStatus
 786                     	xdef	_PWR_PVDGetITStatus
 787                     	xdef	_PWR_PVDITConfig
 788                     	xdef	_PWR_UltraLowPowerCmd
 789                     	xdef	_PWR_FastWakeUpCmd
 790                     	xdef	_PWR_PVDCmd
 791                     	xdef	_PWR_PVDLevelConfig
 792                     	xdef	_PWR_DeInit
 811                     	end
