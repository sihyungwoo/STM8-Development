   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 93 void AES_DeInit(void)
  42                     ; 94 {
  44                     	switch	.text
  45  0000               _AES_DeInit:
  49                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  51  0000 351853d0      	mov	21456,#24
  52                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  54  0004 725f53d2      	clr	21458
  55                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  57  0008 725f53d3      	clr	21459
  58                     ; 99 }
  61  000c 81            	ret
 135                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 135                     ; 113 {
 136                     	switch	.text
 137  000d               _AES_OperationModeConfig:
 139  000d 88            	push	a
 140       00000000      OFST:	set	0
 143                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 145                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 147  000e c653d0        	ld	a,21456
 148  0011 a4f9          	and	a,#249
 149  0013 c753d0        	ld	21456,a
 150                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 152  0016 c653d0        	ld	a,21456
 153  0019 1a01          	or	a,(OFST+1,sp)
 154  001b c753d0        	ld	21456,a
 155                     ; 122 }
 158  001e 84            	pop	a
 159  001f 81            	ret
 214                     ; 132 void AES_Cmd(FunctionalState NewState)
 214                     ; 133 {
 215                     	switch	.text
 216  0020               _AES_Cmd:
 220                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 222                     ; 137   if (NewState != DISABLE)
 224  0020 4d            	tnz	a
 225  0021 2706          	jreq	L101
 226                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 228  0023 721053d0      	bset	21456,#0
 230  0027 2004          	jra	L301
 231  0029               L101:
 232                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 234  0029 721153d0      	bres	21456,#0
 235  002d               L301:
 236                     ; 145 }
 239  002d 81            	ret
 273                     ; 170 void AES_WriteSubData(uint8_t Data)
 273                     ; 171 {
 274                     	switch	.text
 275  002e               _AES_WriteSubData:
 279                     ; 173   AES->DINR = Data;
 281  002e c753d2        	ld	21458,a
 282                     ; 174 }
 285  0031 81            	ret
 319                     ; 183 void AES_WriteSubKey(uint8_t Key)
 319                     ; 184 {
 320                     	switch	.text
 321  0032               _AES_WriteSubKey:
 325                     ; 186   AES->DINR = Key;
 327  0032 c753d2        	ld	21458,a
 328                     ; 187 }
 331  0035 81            	ret
 354                     ; 195 uint8_t AES_ReadSubData(void)
 354                     ; 196 {
 355                     	switch	.text
 356  0036               _AES_ReadSubData:
 360                     ; 197   return AES->DOUTR;
 362  0036 c653d3        	ld	a,21459
 365  0039 81            	ret
 388                     ; 206 uint8_t AES_ReadSubKey(void)
 388                     ; 207 {
 389                     	switch	.text
 390  003a               _AES_ReadSubKey:
 394                     ; 208   return AES->DOUTR;
 396  003a c653d3        	ld	a,21459
 399  003d 81            	ret
 458                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 458                     ; 238 {
 459                     	switch	.text
 460  003e               _AES_DMAConfig:
 462  003e 89            	pushw	x
 463       00000000      OFST:	set	0
 466                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 468                     ; 242   if (NewState != DISABLE)
 470  003f 9f            	ld	a,xl
 471  0040 4d            	tnz	a
 472  0041 2709          	jreq	L112
 473                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 475  0043 9e            	ld	a,xh
 476  0044 ca53d0        	or	a,21456
 477  0047 c753d0        	ld	21456,a
 479  004a 2009          	jra	L312
 480  004c               L112:
 481                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 483  004c 7b01          	ld	a,(OFST+1,sp)
 484  004e 43            	cpl	a
 485  004f c453d0        	and	a,21456
 486  0052 c753d0        	ld	21456,a
 487  0055               L312:
 488                     ; 252 }
 491  0055 85            	popw	x
 492  0056 81            	ret
 557                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 557                     ; 282 {
 558                     	switch	.text
 559  0057               _AES_ITConfig:
 561  0057 89            	pushw	x
 562       00000000      OFST:	set	0
 565                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 567                     ; 285   assert_param(IS_AES_IT(AES_IT));
 569                     ; 287   if (NewState != DISABLE)
 571  0058 9f            	ld	a,xl
 572  0059 4d            	tnz	a
 573  005a 2709          	jreq	L742
 574                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 576  005c 9e            	ld	a,xh
 577  005d ca53d0        	or	a,21456
 578  0060 c753d0        	ld	21456,a
 580  0063 2009          	jra	L152
 581  0065               L742:
 582                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 584  0065 7b01          	ld	a,(OFST+1,sp)
 585  0067 43            	cpl	a
 586  0068 c453d0        	and	a,21456
 587  006b c753d0        	ld	21456,a
 588  006e               L152:
 589                     ; 295 }
 592  006e 85            	popw	x
 593  006f 81            	ret
 686                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 686                     ; 308 {
 687                     	switch	.text
 688  0070               _AES_GetFlagStatus:
 690  0070 88            	push	a
 691  0071 88            	push	a
 692       00000001      OFST:	set	1
 695                     ; 309   FlagStatus status = RESET;
 697                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 699                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 701  0072 a101          	cp	a,#1
 702  0074 2611          	jrne	L713
 703                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 705  0076 c653d1        	ld	a,21457
 706  0079 a501          	bcp	a,#1
 707  007b 2706          	jreq	L123
 708                     ; 319       status = (FlagStatus) SET;
 710  007d a601          	ld	a,#1
 711  007f 6b01          	ld	(OFST+0,sp),a
 714  0081 202a          	jra	L523
 715  0083               L123:
 716                     ; 324       status = (FlagStatus) RESET;
 718  0083 0f01          	clr	(OFST+0,sp)
 720  0085 2026          	jra	L523
 721  0087               L713:
 722                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 724  0087 7b02          	ld	a,(OFST+1,sp)
 725  0089 a102          	cp	a,#2
 726  008b 2611          	jrne	L723
 727                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 729  008d c653d1        	ld	a,21457
 730  0090 a502          	bcp	a,#2
 731  0092 2706          	jreq	L133
 732                     ; 332       status = (FlagStatus) SET;
 734  0094 a601          	ld	a,#1
 735  0096 6b01          	ld	(OFST+0,sp),a
 738  0098 2013          	jra	L523
 739  009a               L133:
 740                     ; 337       status = (FlagStatus) RESET;
 742  009a 0f01          	clr	(OFST+0,sp)
 744  009c 200f          	jra	L523
 745  009e               L723:
 746                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 748  009e c653d1        	ld	a,21457
 749  00a1 a504          	bcp	a,#4
 750  00a3 2706          	jreq	L733
 751                     ; 345       status = (FlagStatus) SET;
 753  00a5 a601          	ld	a,#1
 754  00a7 6b01          	ld	(OFST+0,sp),a
 757  00a9 2002          	jra	L523
 758  00ab               L733:
 759                     ; 350       status = (FlagStatus) RESET;
 761  00ab 0f01          	clr	(OFST+0,sp)
 763  00ad               L523:
 764                     ; 354   return ((FlagStatus) status);
 766  00ad 7b01          	ld	a,(OFST+0,sp)
 769  00af 85            	popw	x
 770  00b0 81            	ret
 805                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 805                     ; 367 {
 806                     	switch	.text
 807  00b1               _AES_ClearFlag:
 811                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 813                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 815  00b1 a101          	cp	a,#1
 816  00b3 2606          	jrne	L163
 817                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 819  00b5 721653d0      	bset	21456,#3
 821  00b9 2004          	jra	L363
 822  00bb               L163:
 823                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 825  00bb 721853d0      	bset	21456,#4
 826  00bf               L363:
 827                     ; 382 }
 830  00bf 81            	ret
 896                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 896                     ; 393 {
 897                     	switch	.text
 898  00c0               _AES_GetITStatus:
 900  00c0 88            	push	a
 901  00c1 89            	pushw	x
 902       00000002      OFST:	set	2
 905                     ; 394   ITStatus itstatus = RESET;
 907                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 909                     ; 398   assert_param(IS_AES_IT(AES_IT));
 911                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 913  00c2 c653d0        	ld	a,21456
 914  00c5 a420          	and	a,#32
 915  00c7 6b01          	ld	(OFST-1,sp),a
 917                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 919  00c9 c653d1        	ld	a,21457
 920  00cc a401          	and	a,#1
 921  00ce 6b02          	ld	(OFST+0,sp),a
 923                     ; 404   if (AES_IT == AES_IT_CCIE)
 925  00d0 7b03          	ld	a,(OFST+1,sp)
 926  00d2 a120          	cp	a,#32
 927  00d4 2612          	jrne	L714
 928                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 930  00d6 0d01          	tnz	(OFST-1,sp)
 931  00d8 270a          	jreq	L124
 933  00da 0d02          	tnz	(OFST+0,sp)
 934  00dc 2706          	jreq	L124
 935                     ; 410       itstatus = (ITStatus) SET;
 937  00de a601          	ld	a,#1
 938  00e0 6b02          	ld	(OFST+0,sp),a
 941  00e2 201e          	jra	L524
 942  00e4               L124:
 943                     ; 415       itstatus = (ITStatus) RESET;
 945  00e4 0f02          	clr	(OFST+0,sp)
 947  00e6 201a          	jra	L524
 948  00e8               L714:
 949                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 951  00e8 c653d0        	ld	a,21456
 952  00eb a540          	bcp	a,#64
 953  00ed 2711          	jreq	L724
 954                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 956  00ef c653d1        	ld	a,21457
 957  00f2 a506          	bcp	a,#6
 958  00f4 2706          	jreq	L134
 959                     ; 427         itstatus = (ITStatus) SET;
 961  00f6 a601          	ld	a,#1
 962  00f8 6b02          	ld	(OFST+0,sp),a
 965  00fa 2006          	jra	L524
 966  00fc               L134:
 967                     ; 432         itstatus = (ITStatus) RESET;
 969  00fc 0f02          	clr	(OFST+0,sp)
 971  00fe 2002          	jra	L524
 972  0100               L724:
 973                     ; 438       itstatus = (ITStatus) RESET;
 975  0100 0f02          	clr	(OFST+0,sp)
 977  0102               L524:
 978                     ; 443   return ((ITStatus)itstatus);
 980  0102 7b02          	ld	a,(OFST+0,sp)
 983  0104 5b03          	addw	sp,#3
 984  0106 81            	ret
1020                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1020                     ; 455 {
1021                     	switch	.text
1022  0107               _AES_ClearITPendingBit:
1026                     ; 457   assert_param(IS_AES_IT(AES_IT));
1028                     ; 460   if (AES_IT == AES_IT_CCIE)
1030  0107 a120          	cp	a,#32
1031  0109 2606          	jrne	L554
1032                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1034  010b 721653d0      	bset	21456,#3
1036  010f 2004          	jra	L754
1037  0111               L554:
1038                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1040  0111 721853d0      	bset	21456,#4
1041  0115               L754:
1042                     ; 470 }
1045  0115 81            	ret
1058                     	xdef	_AES_ClearITPendingBit
1059                     	xdef	_AES_GetITStatus
1060                     	xdef	_AES_ClearFlag
1061                     	xdef	_AES_GetFlagStatus
1062                     	xdef	_AES_ITConfig
1063                     	xdef	_AES_DMAConfig
1064                     	xdef	_AES_ReadSubKey
1065                     	xdef	_AES_ReadSubData
1066                     	xdef	_AES_WriteSubKey
1067                     	xdef	_AES_WriteSubData
1068                     	xdef	_AES_Cmd
1069                     	xdef	_AES_OperationModeConfig
1070                     	xdef	_AES_DeInit
1089                     	end
