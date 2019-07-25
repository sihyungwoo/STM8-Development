   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 181 void TIM1_DeInit(void)
  42                     ; 182 {
  44                     	switch	.text
  45  0000               _TIM1_DeInit:
  49                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  51  0000 725f52b0      	clr	21168
  52                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  54  0004 725f52b1      	clr	21169
  55                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  57  0008 725f52b2      	clr	21170
  58                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  60  000c 725f52b3      	clr	21171
  61                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  63  0010 725f52b5      	clr	21173
  64                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  66  0014 725f52bd      	clr	21181
  67                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  69  0018 725f52be      	clr	21182
  70                     ; 193   TIM1->CCMR1 = 0x01;
  72  001c 350152b9      	mov	21177,#1
  73                     ; 194   TIM1->CCMR2 = 0x01;
  75  0020 350152ba      	mov	21178,#1
  76                     ; 195   TIM1->CCMR3 = 0x01;
  78  0024 350152bb      	mov	21179,#1
  79                     ; 196   TIM1->CCMR4 = 0x01;
  81  0028 350152bc      	mov	21180,#1
  82                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  84  002c 725f52bd      	clr	21181
  85                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  87  0030 725f52be      	clr	21182
  88                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  90  0034 725f52b9      	clr	21177
  91                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  93  0038 725f52ba      	clr	21178
  94                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  96  003c 725f52bb      	clr	21179
  97                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  99  0040 725f52bc      	clr	21180
 100                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 102  0044 725f52bf      	clr	21183
 103                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 105  0048 725f52c0      	clr	21184
 106                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 108  004c 725f52c1      	clr	21185
 109                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 111  0050 725f52c2      	clr	21186
 112                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 114  0054 35ff52c3      	mov	21187,#255
 115                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 117  0058 35ff52c4      	mov	21188,#255
 118                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 120  005c 725f52c6      	clr	21190
 121                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 123  0060 725f52c7      	clr	21191
 124                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 126  0064 725f52c8      	clr	21192
 127                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 129  0068 725f52c9      	clr	21193
 130                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 132  006c 725f52ca      	clr	21194
 133                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 135  0070 725f52cb      	clr	21195
 136                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 138  0074 725f52cc      	clr	21196
 139                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 141  0078 725f52cd      	clr	21197
 142                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 144  007c 725f52d0      	clr	21200
 145                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 147  0080 350152b8      	mov	21176,#1
 148                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 150  0084 725f52cf      	clr	21199
 151                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 153  0088 725f52ce      	clr	21198
 154                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 156  008c 725f52c5      	clr	21189
 157                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 159  0090 725f52b6      	clr	21174
 160                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 162  0094 725f52b7      	clr	21175
 163                     ; 225 }
 166  0098 81            	ret
 275                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 275                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 275                     ; 243                        uint16_t TIM1_Period,
 275                     ; 244                        uint8_t TIM1_RepetitionCounter)
 275                     ; 245 {
 276                     	switch	.text
 277  0099               _TIM1_TimeBaseInit:
 279  0099 89            	pushw	x
 280       00000000      OFST:	set	0
 283                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 285                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 287  009a 7b06          	ld	a,(OFST+6,sp)
 288  009c c752c3        	ld	21187,a
 289                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 291  009f 7b07          	ld	a,(OFST+7,sp)
 292  00a1 c752c4        	ld	21188,a
 293                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 295  00a4 9e            	ld	a,xh
 296  00a5 c752c1        	ld	21185,a
 297                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 299  00a8 9f            	ld	a,xl
 300  00a9 c752c2        	ld	21186,a
 301                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 301                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 303  00ac c652b0        	ld	a,21168
 304  00af a48f          	and	a,#143
 305  00b1 1a05          	or	a,(OFST+5,sp)
 306  00b3 c752b0        	ld	21168,a
 307                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 309  00b6 7b08          	ld	a,(OFST+8,sp)
 310  00b8 c752c5        	ld	21189,a
 311                     ; 265 }
 314  00bb 85            	popw	x
 315  00bc 81            	ret
 382                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 382                     ; 280 {
 383                     	switch	.text
 384  00bd               _TIM1_PrescalerConfig:
 386  00bd 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 392                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 394  00be 9e            	ld	a,xh
 395  00bf c752c1        	ld	21185,a
 396                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 398  00c2 9f            	ld	a,xl
 399  00c3 c752c2        	ld	21186,a
 400                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 402  00c6 7b05          	ld	a,(OFST+5,sp)
 403  00c8 c752b8        	ld	21176,a
 404                     ; 290 }
 407  00cb 85            	popw	x
 408  00cc 81            	ret
 444                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 444                     ; 304 {
 445                     	switch	.text
 446  00cd               _TIM1_CounterModeConfig:
 448  00cd 88            	push	a
 449       00000000      OFST:	set	0
 452                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 454                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 454                     ; 311                         | (uint8_t)TIM1_CounterMode);
 456  00ce c652b0        	ld	a,21168
 457  00d1 a48f          	and	a,#143
 458  00d3 1a01          	or	a,(OFST+1,sp)
 459  00d5 c752b0        	ld	21168,a
 460                     ; 312 }
 463  00d8 84            	pop	a
 464  00d9 81            	ret
 498                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 498                     ; 321 {
 499                     	switch	.text
 500  00da               _TIM1_SetCounter:
 504                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 506  00da 9e            	ld	a,xh
 507  00db c752bf        	ld	21183,a
 508                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 510  00de 9f            	ld	a,xl
 511  00df c752c0        	ld	21184,a
 512                     ; 325 }
 515  00e2 81            	ret
 549                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 549                     ; 334 {
 550                     	switch	.text
 551  00e3               _TIM1_SetAutoreload:
 555                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 557  00e3 9e            	ld	a,xh
 558  00e4 c752c3        	ld	21187,a
 559                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 561  00e7 9f            	ld	a,xl
 562  00e8 c752c4        	ld	21188,a
 563                     ; 338 }
 566  00eb 81            	ret
 618                     ; 345 uint16_t TIM1_GetCounter(void)
 618                     ; 346 {
 619                     	switch	.text
 620  00ec               _TIM1_GetCounter:
 622  00ec 5204          	subw	sp,#4
 623       00000004      OFST:	set	4
 626                     ; 348   uint16_t tmpcntr = 0;
 628                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 632                     ; 351   tmpcntrh = TIM1->CNTRH;
 634  00ee c652bf        	ld	a,21183
 635  00f1 6b02          	ld	(OFST-2,sp),a
 637                     ; 352   tmpcntrl = TIM1->CNTRL;
 639  00f3 c652c0        	ld	a,21184
 640  00f6 6b01          	ld	(OFST-3,sp),a
 642                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 644  00f8 7b01          	ld	a,(OFST-3,sp)
 645  00fa 5f            	clrw	x
 646  00fb 97            	ld	xl,a
 647  00fc 1f03          	ldw	(OFST-1,sp),x
 649                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 651  00fe 7b02          	ld	a,(OFST-2,sp)
 652  0100 5f            	clrw	x
 653  0101 97            	ld	xl,a
 654  0102 4f            	clr	a
 655  0103 02            	rlwa	x,a
 656  0104 01            	rrwa	x,a
 657  0105 1a04          	or	a,(OFST+0,sp)
 658  0107 01            	rrwa	x,a
 659  0108 1a03          	or	a,(OFST-1,sp)
 660  010a 01            	rrwa	x,a
 661  010b 1f03          	ldw	(OFST-1,sp),x
 663                     ; 358   return (uint16_t)tmpcntr;
 665  010d 1e03          	ldw	x,(OFST-1,sp)
 668  010f 5b04          	addw	sp,#4
 669  0111 81            	ret
 703                     ; 366 uint16_t TIM1_GetPrescaler(void)
 703                     ; 367 {
 704                     	switch	.text
 705  0112               _TIM1_GetPrescaler:
 707  0112 89            	pushw	x
 708       00000002      OFST:	set	2
 711                     ; 368   uint16_t tmpreg = 0;
 713                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 715  0113 c652c1        	ld	a,21185
 716  0116 5f            	clrw	x
 717  0117 97            	ld	xl,a
 718  0118 4f            	clr	a
 719  0119 02            	rlwa	x,a
 720  011a 1f01          	ldw	(OFST-1,sp),x
 722                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 724  011c c652c2        	ld	a,21186
 725  011f 5f            	clrw	x
 726  0120 97            	ld	xl,a
 727  0121 01            	rrwa	x,a
 728  0122 1a02          	or	a,(OFST+0,sp)
 729  0124 01            	rrwa	x,a
 730  0125 1a01          	or	a,(OFST-1,sp)
 731  0127 01            	rrwa	x,a
 734  0128 5b02          	addw	sp,#2
 735  012a 81            	ret
 791                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 791                     ; 381 {
 792                     	switch	.text
 793  012b               _TIM1_UpdateDisableConfig:
 797                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 799                     ; 386   if (NewState != DISABLE)
 801  012b 4d            	tnz	a
 802  012c 2706          	jreq	L772
 803                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 805  012e 721252b0      	bset	21168,#1
 807  0132 2004          	jra	L103
 808  0134               L772:
 809                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 811  0134 721352b0      	bres	21168,#1
 812  0138               L103:
 813                     ; 394 }
 816  0138 81            	ret
 874                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 874                     ; 405 {
 875                     	switch	.text
 876  0139               _TIM1_UpdateRequestConfig:
 880                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 882                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 884  0139 4d            	tnz	a
 885  013a 2706          	jreq	L133
 886                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 888  013c 721452b0      	bset	21168,#2
 890  0140 2004          	jra	L333
 891  0142               L133:
 892                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 894  0142 721552b0      	bres	21168,#2
 895  0146               L333:
 896                     ; 418 }
 899  0146 81            	ret
 935                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 935                     ; 427 {
 936                     	switch	.text
 937  0147               _TIM1_ARRPreloadConfig:
 941                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 943                     ; 432   if (NewState != DISABLE)
 945  0147 4d            	tnz	a
 946  0148 2706          	jreq	L353
 947                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 949  014a 721e52b0      	bset	21168,#7
 951  014e 2004          	jra	L553
 952  0150               L353:
 953                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 955  0150 721f52b0      	bres	21168,#7
 956  0154               L553:
 957                     ; 440 }
 960  0154 81            	ret
1017                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1017                     ; 451 {
1018                     	switch	.text
1019  0155               _TIM1_SelectOnePulseMode:
1023                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1025                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1027  0155 4d            	tnz	a
1028  0156 2706          	jreq	L504
1029                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1031  0158 721652b0      	bset	21168,#3
1033  015c 2004          	jra	L704
1034  015e               L504:
1035                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1037  015e 721752b0      	bres	21168,#3
1038  0162               L704:
1039                     ; 464 }
1042  0162 81            	ret
1077                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1077                     ; 473 {
1078                     	switch	.text
1079  0163               _TIM1_Cmd:
1083                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1085                     ; 478   if (NewState != DISABLE)
1087  0163 4d            	tnz	a
1088  0164 2706          	jreq	L724
1089                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1091  0166 721052b0      	bset	21168,#0
1093  016a 2004          	jra	L134
1094  016c               L724:
1095                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1097  016c 721152b0      	bres	21168,#0
1098  0170               L134:
1099                     ; 486 }
1102  0170 81            	ret
1387                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1387                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1387                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1387                     ; 580                   uint16_t TIM1_Pulse,
1387                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1387                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1387                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1387                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1387                     ; 585 {
1388                     	switch	.text
1389  0171               _TIM1_OC1Init:
1391  0171 89            	pushw	x
1392  0172 5203          	subw	sp,#3
1393       00000003      OFST:	set	3
1396                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1398                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1400                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1402                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1404                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1406                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1408                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1410                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1410                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1412  0174 c652bd        	ld	a,21181
1413  0177 a4f0          	and	a,#240
1414  0179 c752bd        	ld	21181,a
1415                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1415                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1415                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1415                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1417  017c 7b0c          	ld	a,(OFST+9,sp)
1418  017e a408          	and	a,#8
1419  0180 6b03          	ld	(OFST+0,sp),a
1421  0182 7b0b          	ld	a,(OFST+8,sp)
1422  0184 a402          	and	a,#2
1423  0186 1a03          	or	a,(OFST+0,sp)
1424  0188 6b02          	ld	(OFST-1,sp),a
1426  018a 7b08          	ld	a,(OFST+5,sp)
1427  018c a404          	and	a,#4
1428  018e 6b01          	ld	(OFST-2,sp),a
1430  0190 9f            	ld	a,xl
1431  0191 a401          	and	a,#1
1432  0193 1a01          	or	a,(OFST-2,sp)
1433  0195 1a02          	or	a,(OFST-1,sp)
1434  0197 ca52bd        	or	a,21181
1435  019a c752bd        	ld	21181,a
1436                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1436                     ; 608                           | (uint8_t)TIM1_OCMode);
1438  019d c652b9        	ld	a,21177
1439  01a0 a48f          	and	a,#143
1440  01a2 1a04          	or	a,(OFST+1,sp)
1441  01a4 c752b9        	ld	21177,a
1442                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1444  01a7 c652d0        	ld	a,21200
1445  01aa a4fc          	and	a,#252
1446  01ac c752d0        	ld	21200,a
1447                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1447                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1449  01af 7b0e          	ld	a,(OFST+11,sp)
1450  01b1 a402          	and	a,#2
1451  01b3 6b03          	ld	(OFST+0,sp),a
1453  01b5 7b0d          	ld	a,(OFST+10,sp)
1454  01b7 a401          	and	a,#1
1455  01b9 1a03          	or	a,(OFST+0,sp)
1456  01bb ca52d0        	or	a,21200
1457  01be c752d0        	ld	21200,a
1458                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1460  01c1 7b09          	ld	a,(OFST+6,sp)
1461  01c3 c752c6        	ld	21190,a
1462                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1464  01c6 7b0a          	ld	a,(OFST+7,sp)
1465  01c8 c752c7        	ld	21191,a
1466                     ; 619 }
1469  01cb 5b05          	addw	sp,#5
1470  01cd 81            	ret
1574                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1574                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1574                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1574                     ; 661                   uint16_t TIM1_Pulse,
1574                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1574                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1574                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1574                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1574                     ; 666 {
1575                     	switch	.text
1576  01ce               _TIM1_OC2Init:
1578  01ce 89            	pushw	x
1579  01cf 5203          	subw	sp,#3
1580       00000003      OFST:	set	3
1583                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1585                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1587                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1589                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1591                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1593                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1595                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1597                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1599  01d1 c652bd        	ld	a,21181
1600  01d4 a40f          	and	a,#15
1601  01d6 c752bd        	ld	21181,a
1602                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1602                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1604  01d9 7b0c          	ld	a,(OFST+9,sp)
1605  01db a480          	and	a,#128
1606  01dd 6b03          	ld	(OFST+0,sp),a
1608  01df 7b0b          	ld	a,(OFST+8,sp)
1609  01e1 a420          	and	a,#32
1610  01e3 1a03          	or	a,(OFST+0,sp)
1611  01e5 6b02          	ld	(OFST-1,sp),a
1613  01e7 7b08          	ld	a,(OFST+5,sp)
1614  01e9 a440          	and	a,#64
1615  01eb 6b01          	ld	(OFST-2,sp),a
1617  01ed 9f            	ld	a,xl
1618  01ee a410          	and	a,#16
1619  01f0 1a01          	or	a,(OFST-2,sp)
1620  01f2 1a02          	or	a,(OFST-1,sp)
1621  01f4 ca52bd        	or	a,21181
1622  01f7 c752bd        	ld	21181,a
1623                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1625  01fa c652ba        	ld	a,21178
1626  01fd a48f          	and	a,#143
1627  01ff 1a04          	or	a,(OFST+1,sp)
1628  0201 c752ba        	ld	21178,a
1629                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1631  0204 c652d0        	ld	a,21200
1632  0207 a4f3          	and	a,#243
1633  0209 c752d0        	ld	21200,a
1634                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1636  020c 7b0e          	ld	a,(OFST+11,sp)
1637  020e a408          	and	a,#8
1638  0210 6b03          	ld	(OFST+0,sp),a
1640  0212 7b0d          	ld	a,(OFST+10,sp)
1641  0214 a404          	and	a,#4
1642  0216 1a03          	or	a,(OFST+0,sp)
1643  0218 ca52d0        	or	a,21200
1644  021b c752d0        	ld	21200,a
1645                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1647  021e 7b09          	ld	a,(OFST+6,sp)
1648  0220 c752c8        	ld	21192,a
1649                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1651  0223 7b0a          	ld	a,(OFST+7,sp)
1652  0225 c752c9        	ld	21193,a
1653                     ; 696 }
1656  0228 5b05          	addw	sp,#5
1657  022a 81            	ret
1761                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1761                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1761                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1761                     ; 738                   uint16_t TIM1_Pulse,
1761                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1761                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1761                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1761                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1761                     ; 743 {
1762                     	switch	.text
1763  022b               _TIM1_OC3Init:
1765  022b 89            	pushw	x
1766  022c 5203          	subw	sp,#3
1767       00000003      OFST:	set	3
1770                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1772                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1774                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1776                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1778                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1780                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1782                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1784                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1786  022e c652be        	ld	a,21182
1787  0231 a4f0          	and	a,#240
1788  0233 c752be        	ld	21182,a
1789                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1789                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1791  0236 7b0c          	ld	a,(OFST+9,sp)
1792  0238 a408          	and	a,#8
1793  023a 6b03          	ld	(OFST+0,sp),a
1795  023c 7b0b          	ld	a,(OFST+8,sp)
1796  023e a402          	and	a,#2
1797  0240 1a03          	or	a,(OFST+0,sp)
1798  0242 6b02          	ld	(OFST-1,sp),a
1800  0244 7b08          	ld	a,(OFST+5,sp)
1801  0246 a404          	and	a,#4
1802  0248 6b01          	ld	(OFST-2,sp),a
1804  024a 9f            	ld	a,xl
1805  024b a401          	and	a,#1
1806  024d 1a01          	or	a,(OFST-2,sp)
1807  024f 1a02          	or	a,(OFST-1,sp)
1808  0251 ca52be        	or	a,21182
1809  0254 c752be        	ld	21182,a
1810                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1812  0257 c652bb        	ld	a,21179
1813  025a a48f          	and	a,#143
1814  025c 1a04          	or	a,(OFST+1,sp)
1815  025e c752bb        	ld	21179,a
1816                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1818  0261 c652d0        	ld	a,21200
1819  0264 a4cf          	and	a,#207
1820  0266 c752d0        	ld	21200,a
1821                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1823  0269 7b0e          	ld	a,(OFST+11,sp)
1824  026b a420          	and	a,#32
1825  026d 6b03          	ld	(OFST+0,sp),a
1827  026f 7b0d          	ld	a,(OFST+10,sp)
1828  0271 a410          	and	a,#16
1829  0273 1a03          	or	a,(OFST+0,sp)
1830  0275 ca52d0        	or	a,21200
1831  0278 c752d0        	ld	21200,a
1832                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1834  027b 7b09          	ld	a,(OFST+6,sp)
1835  027d c752ca        	ld	21194,a
1836                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1838  0280 7b0a          	ld	a,(OFST+7,sp)
1839  0282 c752cb        	ld	21195,a
1840                     ; 773 }
1843  0285 5b05          	addw	sp,#5
1844  0287 81            	ret
2051                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2051                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2051                     ; 805                      uint8_t TIM1_DeadTime,
2051                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2051                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2051                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2051                     ; 809 {
2052                     	switch	.text
2053  0288               _TIM1_BDTRConfig:
2055  0288 89            	pushw	x
2056  0289 88            	push	a
2057       00000001      OFST:	set	1
2060                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2062                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2064                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2066                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2068                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2070                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2072  028a 7b06          	ld	a,(OFST+5,sp)
2073  028c c752cf        	ld	21199,a
2074                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2074                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2074                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2076  028f 7b07          	ld	a,(OFST+6,sp)
2077  0291 1a08          	or	a,(OFST+7,sp)
2078  0293 1a09          	or	a,(OFST+8,sp)
2079  0295 6b01          	ld	(OFST+0,sp),a
2081  0297 9f            	ld	a,xl
2082  0298 1a02          	or	a,(OFST+1,sp)
2083  029a 1a01          	or	a,(OFST+0,sp)
2084  029c c752ce        	ld	21198,a
2085                     ; 826 }
2088  029f 5b03          	addw	sp,#3
2089  02a1 81            	ret
2125                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2125                     ; 835 {
2126                     	switch	.text
2127  02a2               _TIM1_CtrlPWMOutputs:
2131                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2133                     ; 841   if (NewState != DISABLE)
2135  02a2 4d            	tnz	a
2136  02a3 2706          	jreq	L5601
2137                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2139  02a5 721e52ce      	bset	21198,#7
2141  02a9 2004          	jra	L7601
2142  02ab               L5601:
2143                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2145  02ab 721f52ce      	bres	21198,#7
2146  02af               L7601:
2147                     ; 849 }
2150  02af 81            	ret
2229                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2229                     ; 872 {
2230                     	switch	.text
2231  02b0               _TIM1_SelectOCxM:
2233  02b0 89            	pushw	x
2234       00000000      OFST:	set	0
2237                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2239                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2241                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2243  02b1 9e            	ld	a,xh
2244  02b2 4d            	tnz	a
2245  02b3 2610          	jrne	L7211
2246                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2248  02b5 721152bd      	bres	21181,#0
2249                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2251  02b9 c652b9        	ld	a,21177
2252  02bc a48f          	and	a,#143
2253  02be 1a02          	or	a,(OFST+2,sp)
2254  02c0 c752b9        	ld	21177,a
2256  02c3 2024          	jra	L1311
2257  02c5               L7211:
2258                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2260  02c5 7b01          	ld	a,(OFST+1,sp)
2261  02c7 a101          	cp	a,#1
2262  02c9 2610          	jrne	L3311
2263                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2265  02cb 721952bd      	bres	21181,#4
2266                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2268  02cf c652ba        	ld	a,21178
2269  02d2 a48f          	and	a,#143
2270  02d4 1a02          	or	a,(OFST+2,sp)
2271  02d6 c752ba        	ld	21178,a
2273  02d9 200e          	jra	L1311
2274  02db               L3311:
2275                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2277  02db 721152be      	bres	21182,#0
2278                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2280  02df c652bb        	ld	a,21179
2281  02e2 a48f          	and	a,#143
2282  02e4 1a02          	or	a,(OFST+2,sp)
2283  02e6 c752bb        	ld	21179,a
2284  02e9               L1311:
2285                     ; 902 }
2288  02e9 85            	popw	x
2289  02ea 81            	ret
2323                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2323                     ; 911 {
2324                     	switch	.text
2325  02eb               _TIM1_SetCompare1:
2329                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2331  02eb 9e            	ld	a,xh
2332  02ec c752c6        	ld	21190,a
2333                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2335  02ef 9f            	ld	a,xl
2336  02f0 c752c7        	ld	21191,a
2337                     ; 916 }
2340  02f3 81            	ret
2374                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2374                     ; 925 {
2375                     	switch	.text
2376  02f4               _TIM1_SetCompare2:
2380                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2382  02f4 9e            	ld	a,xh
2383  02f5 c752c8        	ld	21192,a
2384                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2386  02f8 9f            	ld	a,xl
2387  02f9 c752c9        	ld	21193,a
2388                     ; 929 }
2391  02fc 81            	ret
2425                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2425                     ; 938 {
2426                     	switch	.text
2427  02fd               _TIM1_SetCompare3:
2431                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2433  02fd 9e            	ld	a,xh
2434  02fe c752ca        	ld	21194,a
2435                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2437  0301 9f            	ld	a,xl
2438  0302 c752cb        	ld	21195,a
2439                     ; 942 }
2442  0305 81            	ret
2476                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2476                     ; 951 {
2477                     	switch	.text
2478  0306               _TIM1_SetCompare4:
2482                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2484  0306 9e            	ld	a,xh
2485  0307 c752cc        	ld	21196,a
2486                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2488  030a 9f            	ld	a,xl
2489  030b c752cd        	ld	21197,a
2490                     ; 955 }
2493  030e 81            	ret
2529                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2529                     ; 964 {
2530                     	switch	.text
2531  030f               _TIM1_CCPreloadControl:
2535                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2537                     ; 969   if (NewState != DISABLE)
2539  030f 4d            	tnz	a
2540  0310 2706          	jreq	L5421
2541                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2543  0312 721052b1      	bset	21169,#0
2545  0316 2004          	jra	L7421
2546  0318               L5421:
2547                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2549  0318 721152b1      	bres	21169,#0
2550  031c               L7421:
2551                     ; 977 }
2554  031c 81            	ret
2612                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2612                     ; 988 {
2613                     	switch	.text
2614  031d               _TIM1_ForcedOC1Config:
2616  031d 88            	push	a
2617       00000000      OFST:	set	0
2620                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2622                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2624  031e c652b9        	ld	a,21177
2625  0321 a48f          	and	a,#143
2626  0323 1a01          	or	a,(OFST+1,sp)
2627  0325 c752b9        	ld	21177,a
2628                     ; 994 }
2631  0328 84            	pop	a
2632  0329 81            	ret
2668                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2668                     ; 1005 {
2669                     	switch	.text
2670  032a               _TIM1_ForcedOC2Config:
2672  032a 88            	push	a
2673       00000000      OFST:	set	0
2676                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2678                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2680  032b c652ba        	ld	a,21178
2681  032e a48f          	and	a,#143
2682  0330 1a01          	or	a,(OFST+1,sp)
2683  0332 c752ba        	ld	21178,a
2684                     ; 1011 }
2687  0335 84            	pop	a
2688  0336 81            	ret
2724                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2724                     ; 1022 {
2725                     	switch	.text
2726  0337               _TIM1_ForcedOC3Config:
2728  0337 88            	push	a
2729       00000000      OFST:	set	0
2732                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2734                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2736  0338 c652bb        	ld	a,21179
2737  033b a48f          	and	a,#143
2738  033d 1a01          	or	a,(OFST+1,sp)
2739  033f c752bb        	ld	21179,a
2740                     ; 1028 }
2743  0342 84            	pop	a
2744  0343 81            	ret
2780                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2780                     ; 1037 {
2781                     	switch	.text
2782  0344               _TIM1_OC1PreloadConfig:
2786                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2788                     ; 1042   if (NewState != DISABLE)
2790  0344 4d            	tnz	a
2791  0345 2706          	jreq	L1531
2792                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2794  0347 721652b9      	bset	21177,#3
2796  034b 2004          	jra	L3531
2797  034d               L1531:
2798                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2800  034d 721752b9      	bres	21177,#3
2801  0351               L3531:
2802                     ; 1050 }
2805  0351 81            	ret
2841                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2841                     ; 1059 {
2842                     	switch	.text
2843  0352               _TIM1_OC2PreloadConfig:
2847                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2849                     ; 1064   if (NewState != DISABLE)
2851  0352 4d            	tnz	a
2852  0353 2706          	jreq	L3731
2853                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2855  0355 721652ba      	bset	21178,#3
2857  0359 2004          	jra	L5731
2858  035b               L3731:
2859                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2861  035b 721752ba      	bres	21178,#3
2862  035f               L5731:
2863                     ; 1072 }
2866  035f 81            	ret
2902                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2902                     ; 1081 {
2903                     	switch	.text
2904  0360               _TIM1_OC3PreloadConfig:
2908                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2910                     ; 1086   if (NewState != DISABLE)
2912  0360 4d            	tnz	a
2913  0361 2706          	jreq	L5141
2914                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2916  0363 721652bb      	bset	21179,#3
2918  0367 2004          	jra	L7141
2919  0369               L5141:
2920                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2922  0369 721752bb      	bres	21179,#3
2923  036d               L7141:
2924                     ; 1094 }
2927  036d 81            	ret
2963                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2963                     ; 1103 {
2964                     	switch	.text
2965  036e               _TIM1_OC4PreloadConfig:
2969                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2971                     ; 1108   if (NewState != DISABLE)
2973  036e 4d            	tnz	a
2974  036f 2706          	jreq	L7341
2975                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2977  0371 721652bc      	bset	21180,#3
2979  0375 2004          	jra	L1441
2980  0377               L7341:
2981                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2983  0377 721752bc      	bres	21180,#3
2984  037b               L1441:
2985                     ; 1116 }
2988  037b 81            	ret
3023                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3023                     ; 1125 {
3024                     	switch	.text
3025  037c               _TIM1_OC1FastConfig:
3029                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3031                     ; 1130   if (NewState != DISABLE)
3033  037c 4d            	tnz	a
3034  037d 2706          	jreq	L1641
3035                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3037  037f 721452b9      	bset	21177,#2
3039  0383 2004          	jra	L3641
3040  0385               L1641:
3041                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3043  0385 721552b9      	bres	21177,#2
3044  0389               L3641:
3045                     ; 1138 }
3048  0389 81            	ret
3083                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3083                     ; 1147 {
3084                     	switch	.text
3085  038a               _TIM1_OC2FastConfig:
3089                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3091                     ; 1152   if (NewState != DISABLE)
3093  038a 4d            	tnz	a
3094  038b 2706          	jreq	L3051
3095                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3097  038d 721452ba      	bset	21178,#2
3099  0391 2004          	jra	L5051
3100  0393               L3051:
3101                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3103  0393 721552ba      	bres	21178,#2
3104  0397               L5051:
3105                     ; 1160 }
3108  0397 81            	ret
3143                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3143                     ; 1169 {
3144                     	switch	.text
3145  0398               _TIM1_OC3FastConfig:
3149                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3151                     ; 1174   if (NewState != DISABLE)
3153  0398 4d            	tnz	a
3154  0399 2706          	jreq	L5251
3155                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3157  039b 721452bb      	bset	21179,#2
3159  039f 2004          	jra	L7251
3160  03a1               L5251:
3161                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3163  03a1 721552bb      	bres	21179,#2
3164  03a5               L7251:
3165                     ; 1182 }
3168  03a5 81            	ret
3203                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3203                     ; 1191 {
3204                     	switch	.text
3205  03a6               _TIM1_ClearOC1Ref:
3209                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3211                     ; 1196   if (NewState != DISABLE)
3213  03a6 4d            	tnz	a
3214  03a7 2706          	jreq	L7451
3215                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3217  03a9 721e52b9      	bset	21177,#7
3219  03ad 2004          	jra	L1551
3220  03af               L7451:
3221                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3223  03af 721f52b9      	bres	21177,#7
3224  03b3               L1551:
3225                     ; 1204 }
3228  03b3 81            	ret
3263                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3263                     ; 1213 {
3264                     	switch	.text
3265  03b4               _TIM1_ClearOC2Ref:
3269                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3271                     ; 1218   if (NewState != DISABLE)
3273  03b4 4d            	tnz	a
3274  03b5 2706          	jreq	L1751
3275                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3277  03b7 721e52ba      	bset	21178,#7
3279  03bb 2004          	jra	L3751
3280  03bd               L1751:
3281                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3283  03bd 721f52ba      	bres	21178,#7
3284  03c1               L3751:
3285                     ; 1226 }
3288  03c1 81            	ret
3323                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3323                     ; 1235 {
3324                     	switch	.text
3325  03c2               _TIM1_ClearOC3Ref:
3329                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3331                     ; 1240   if (NewState != DISABLE)
3333  03c2 4d            	tnz	a
3334  03c3 2706          	jreq	L3161
3335                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3337  03c5 721e52bb      	bset	21179,#7
3339  03c9 2004          	jra	L5161
3340  03cb               L3161:
3341                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3343  03cb 721f52bb      	bres	21179,#7
3344  03cf               L5161:
3345                     ; 1248 }
3348  03cf 81            	ret
3383                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3383                     ; 1257 {
3384                     	switch	.text
3385  03d0               _TIM1_ClearOC4Ref:
3389                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3391                     ; 1262   if (NewState != DISABLE)
3393  03d0 4d            	tnz	a
3394  03d1 2706          	jreq	L5361
3395                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3397  03d3 721e52bc      	bset	21180,#7
3399  03d7 2004          	jra	L7361
3400  03d9               L5361:
3401                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3403  03d9 721f52bc      	bres	21180,#7
3404  03dd               L7361:
3405                     ; 1270 }
3408  03dd 81            	ret
3444                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3444                     ; 1281 {
3445                     	switch	.text
3446  03de               _TIM1_OC1PolarityConfig:
3450                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3452                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3454  03de 4d            	tnz	a
3455  03df 2706          	jreq	L7561
3456                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3458  03e1 721252bd      	bset	21181,#1
3460  03e5 2004          	jra	L1661
3461  03e7               L7561:
3462                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3464  03e7 721352bd      	bres	21181,#1
3465  03eb               L1661:
3466                     ; 1294 }
3469  03eb 81            	ret
3505                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3505                     ; 1305 {
3506                     	switch	.text
3507  03ec               _TIM1_OC1NPolarityConfig:
3511                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3513                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3515  03ec 4d            	tnz	a
3516  03ed 2706          	jreq	L1071
3517                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3519  03ef 721652bd      	bset	21181,#3
3521  03f3 2004          	jra	L3071
3522  03f5               L1071:
3523                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3525  03f5 721752bd      	bres	21181,#3
3526  03f9               L3071:
3527                     ; 1318 }
3530  03f9 81            	ret
3566                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3566                     ; 1329 {
3567                     	switch	.text
3568  03fa               _TIM1_OC2PolarityConfig:
3572                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3574                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3576  03fa 4d            	tnz	a
3577  03fb 2706          	jreq	L3271
3578                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3580  03fd 721a52bd      	bset	21181,#5
3582  0401 2004          	jra	L5271
3583  0403               L3271:
3584                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3586  0403 721b52bd      	bres	21181,#5
3587  0407               L5271:
3588                     ; 1342 }
3591  0407 81            	ret
3627                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3627                     ; 1353 {
3628                     	switch	.text
3629  0408               _TIM1_OC2NPolarityConfig:
3633                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3635                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3637  0408 4d            	tnz	a
3638  0409 2706          	jreq	L5471
3639                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3641  040b 721e52bd      	bset	21181,#7
3643  040f 2004          	jra	L7471
3644  0411               L5471:
3645                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3647  0411 721f52bd      	bres	21181,#7
3648  0415               L7471:
3649                     ; 1366 }
3652  0415 81            	ret
3688                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3688                     ; 1377 {
3689                     	switch	.text
3690  0416               _TIM1_OC3PolarityConfig:
3694                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3696                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3698  0416 4d            	tnz	a
3699  0417 2706          	jreq	L7671
3700                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3702  0419 721252be      	bset	21182,#1
3704  041d 2004          	jra	L1771
3705  041f               L7671:
3706                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3708  041f 721352be      	bres	21182,#1
3709  0423               L1771:
3710                     ; 1390 }
3713  0423 81            	ret
3749                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3749                     ; 1401 {
3750                     	switch	.text
3751  0424               _TIM1_OC3NPolarityConfig:
3755                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3757                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3759  0424 4d            	tnz	a
3760  0425 2706          	jreq	L1102
3761                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3763  0427 721652be      	bset	21182,#3
3765  042b 2004          	jra	L3102
3766  042d               L1102:
3767                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3769  042d 721752be      	bres	21182,#3
3770  0431               L3102:
3771                     ; 1414 }
3774  0431 81            	ret
3833                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3833                     ; 1425 {
3834                     	switch	.text
3835  0432               _TIM1_SelectOCREFClear:
3839                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3841                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3843  0432 721752b2      	bres	21170,#3
3844                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3846  0436 ca52b2        	or	a,21170
3847  0439 c752b2        	ld	21170,a
3848                     ; 1432 }
3851  043c 81            	ret
3886                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3886                     ; 1441 {
3887                     	switch	.text
3888  043d               _TIM1_SelectCOM:
3892                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3894                     ; 1446   if (NewState != DISABLE)
3896  043d 4d            	tnz	a
3897  043e 2706          	jreq	L1602
3898                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3900  0440 721452b1      	bset	21169,#2
3902  0444 2004          	jra	L3602
3903  0446               L1602:
3904                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3906  0446 721552b1      	bres	21169,#2
3907  044a               L3602:
3908                     ; 1454 }
3911  044a 81            	ret
3956                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3956                     ; 1469 {
3957                     	switch	.text
3958  044b               _TIM1_CCxCmd:
3960  044b 89            	pushw	x
3961       00000000      OFST:	set	0
3964                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3966                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3968                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3970  044c 9e            	ld	a,xh
3971  044d 4d            	tnz	a
3972  044e 2610          	jrne	L7012
3973                     ; 1477     if (NewState != DISABLE)
3975  0450 9f            	ld	a,xl
3976  0451 4d            	tnz	a
3977  0452 2706          	jreq	L1112
3978                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3980  0454 721052bd      	bset	21181,#0
3982  0458 2040          	jra	L5112
3983  045a               L1112:
3984                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3986  045a 721152bd      	bres	21181,#0
3987  045e 203a          	jra	L5112
3988  0460               L7012:
3989                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3991  0460 7b01          	ld	a,(OFST+1,sp)
3992  0462 a101          	cp	a,#1
3993  0464 2610          	jrne	L7112
3994                     ; 1489     if (NewState != DISABLE)
3996  0466 0d02          	tnz	(OFST+2,sp)
3997  0468 2706          	jreq	L1212
3998                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
4000  046a 721852bd      	bset	21181,#4
4002  046e 202a          	jra	L5112
4003  0470               L1212:
4004                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
4006  0470 721952bd      	bres	21181,#4
4007  0474 2024          	jra	L5112
4008  0476               L7112:
4009                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
4011  0476 7b01          	ld	a,(OFST+1,sp)
4012  0478 a102          	cp	a,#2
4013  047a 2610          	jrne	L7212
4014                     ; 1501     if (NewState != DISABLE)
4016  047c 0d02          	tnz	(OFST+2,sp)
4017  047e 2706          	jreq	L1312
4018                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4020  0480 721052be      	bset	21182,#0
4022  0484 2014          	jra	L5112
4023  0486               L1312:
4024                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4026  0486 721152be      	bres	21182,#0
4027  048a 200e          	jra	L5112
4028  048c               L7212:
4029                     ; 1513     if (NewState != DISABLE)
4031  048c 0d02          	tnz	(OFST+2,sp)
4032  048e 2706          	jreq	L7312
4033                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4035  0490 721852be      	bset	21182,#4
4037  0494 2004          	jra	L5112
4038  0496               L7312:
4039                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4041  0496 721952be      	bres	21182,#4
4042  049a               L5112:
4043                     ; 1522 }
4046  049a 85            	popw	x
4047  049b 81            	ret
4092                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4092                     ; 1536 {
4093                     	switch	.text
4094  049c               _TIM1_CCxNCmd:
4096  049c 89            	pushw	x
4097       00000000      OFST:	set	0
4100                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4102                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4104                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4106  049d 9e            	ld	a,xh
4107  049e 4d            	tnz	a
4108  049f 2610          	jrne	L5612
4109                     ; 1544     if (NewState != DISABLE)
4111  04a1 9f            	ld	a,xl
4112  04a2 4d            	tnz	a
4113  04a3 2706          	jreq	L7612
4114                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4116  04a5 721452bd      	bset	21181,#2
4118  04a9 202a          	jra	L3712
4119  04ab               L7612:
4120                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4122  04ab 721552bd      	bres	21181,#2
4123  04af 2024          	jra	L3712
4124  04b1               L5612:
4125                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4127  04b1 7b01          	ld	a,(OFST+1,sp)
4128  04b3 a101          	cp	a,#1
4129  04b5 2610          	jrne	L5712
4130                     ; 1556     if (NewState != DISABLE)
4132  04b7 0d02          	tnz	(OFST+2,sp)
4133  04b9 2706          	jreq	L7712
4134                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4136  04bb 721c52bd      	bset	21181,#6
4138  04bf 2014          	jra	L3712
4139  04c1               L7712:
4140                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4142  04c1 721d52bd      	bres	21181,#6
4143  04c5 200e          	jra	L3712
4144  04c7               L5712:
4145                     ; 1568     if (NewState != DISABLE)
4147  04c7 0d02          	tnz	(OFST+2,sp)
4148  04c9 2706          	jreq	L5022
4149                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4151  04cb 721452be      	bset	21182,#2
4153  04cf 2004          	jra	L3712
4154  04d1               L5022:
4155                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4157  04d1 721552be      	bres	21182,#2
4158  04d5               L3712:
4159                     ; 1577 }
4162  04d5 85            	popw	x
4163  04d6 81            	ret
4331                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4331                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4331                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4331                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4331                     ; 1668                  uint8_t TIM1_ICFilter)
4331                     ; 1669 {
4332                     	switch	.text
4333  04d7               _TIM1_ICInit:
4335  04d7 89            	pushw	x
4336       00000000      OFST:	set	0
4339                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4341                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4343                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4345                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4347                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4349                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4351  04d8 9e            	ld	a,xh
4352  04d9 4d            	tnz	a
4353  04da 2614          	jrne	L5032
4354                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4356  04dc 7b07          	ld	a,(OFST+7,sp)
4357  04de 88            	push	a
4358  04df 7b06          	ld	a,(OFST+6,sp)
4359  04e1 97            	ld	xl,a
4360  04e2 7b03          	ld	a,(OFST+3,sp)
4361  04e4 95            	ld	xh,a
4362  04e5 cd080b        	call	L3_TI1_Config
4364  04e8 84            	pop	a
4365                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4367  04e9 7b06          	ld	a,(OFST+6,sp)
4368  04eb cd0640        	call	_TIM1_SetIC1Prescaler
4371  04ee 2046          	jra	L7032
4372  04f0               L5032:
4373                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4375  04f0 7b01          	ld	a,(OFST+1,sp)
4376  04f2 a101          	cp	a,#1
4377  04f4 2614          	jrne	L1132
4378                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4380  04f6 7b07          	ld	a,(OFST+7,sp)
4381  04f8 88            	push	a
4382  04f9 7b06          	ld	a,(OFST+6,sp)
4383  04fb 97            	ld	xl,a
4384  04fc 7b03          	ld	a,(OFST+3,sp)
4385  04fe 95            	ld	xh,a
4386  04ff cd083b        	call	L5_TI2_Config
4388  0502 84            	pop	a
4389                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4391  0503 7b06          	ld	a,(OFST+6,sp)
4392  0505 cd064d        	call	_TIM1_SetIC2Prescaler
4395  0508 202c          	jra	L7032
4396  050a               L1132:
4397                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4399  050a 7b01          	ld	a,(OFST+1,sp)
4400  050c a102          	cp	a,#2
4401  050e 2614          	jrne	L5132
4402                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4404  0510 7b07          	ld	a,(OFST+7,sp)
4405  0512 88            	push	a
4406  0513 7b06          	ld	a,(OFST+6,sp)
4407  0515 97            	ld	xl,a
4408  0516 7b03          	ld	a,(OFST+3,sp)
4409  0518 95            	ld	xh,a
4410  0519 cd086b        	call	L7_TI3_Config
4412  051c 84            	pop	a
4413                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4415  051d 7b06          	ld	a,(OFST+6,sp)
4416  051f cd065a        	call	_TIM1_SetIC3Prescaler
4419  0522 2012          	jra	L7032
4420  0524               L5132:
4421                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4423  0524 7b07          	ld	a,(OFST+7,sp)
4424  0526 88            	push	a
4425  0527 7b06          	ld	a,(OFST+6,sp)
4426  0529 97            	ld	xl,a
4427  052a 7b03          	ld	a,(OFST+3,sp)
4428  052c 95            	ld	xh,a
4429  052d cd089b        	call	L11_TI4_Config
4431  0530 84            	pop	a
4432                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4434  0531 7b06          	ld	a,(OFST+6,sp)
4435  0533 cd0667        	call	_TIM1_SetIC4Prescaler
4437  0536               L7032:
4438                     ; 1706 }
4441  0536 85            	popw	x
4442  0537 81            	ret
4540                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4540                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4540                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4540                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4540                     ; 1737                      uint8_t TIM1_ICFilter)
4540                     ; 1738 {
4541                     	switch	.text
4542  0538               _TIM1_PWMIConfig:
4544  0538 89            	pushw	x
4545  0539 89            	pushw	x
4546       00000002      OFST:	set	2
4549                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4551                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4553                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4555                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4557                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4559                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4561                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4563  053a 9f            	ld	a,xl
4564  053b a101          	cp	a,#1
4565  053d 2706          	jreq	L7632
4566                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4568  053f a601          	ld	a,#1
4569  0541 6b01          	ld	(OFST-1,sp),a
4572  0543 2002          	jra	L1732
4573  0545               L7632:
4574                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4576  0545 0f01          	clr	(OFST-1,sp)
4578  0547               L1732:
4579                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4581  0547 7b07          	ld	a,(OFST+5,sp)
4582  0549 a101          	cp	a,#1
4583  054b 2606          	jrne	L3732
4584                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4586  054d a602          	ld	a,#2
4587  054f 6b02          	ld	(OFST+0,sp),a
4590  0551 2004          	jra	L5732
4591  0553               L3732:
4592                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4594  0553 a601          	ld	a,#1
4595  0555 6b02          	ld	(OFST+0,sp),a
4597  0557               L5732:
4598                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4600  0557 0d03          	tnz	(OFST+1,sp)
4601  0559 2626          	jrne	L7732
4602                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4604  055b 7b09          	ld	a,(OFST+7,sp)
4605  055d 88            	push	a
4606  055e 7b08          	ld	a,(OFST+6,sp)
4607  0560 97            	ld	xl,a
4608  0561 7b05          	ld	a,(OFST+3,sp)
4609  0563 95            	ld	xh,a
4610  0564 cd080b        	call	L3_TI1_Config
4612  0567 84            	pop	a
4613                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4615  0568 7b08          	ld	a,(OFST+6,sp)
4616  056a cd0640        	call	_TIM1_SetIC1Prescaler
4618                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4620  056d 7b09          	ld	a,(OFST+7,sp)
4621  056f 88            	push	a
4622  0570 7b03          	ld	a,(OFST+1,sp)
4623  0572 97            	ld	xl,a
4624  0573 7b02          	ld	a,(OFST+0,sp)
4625  0575 95            	ld	xh,a
4626  0576 cd083b        	call	L5_TI2_Config
4628  0579 84            	pop	a
4629                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4631  057a 7b08          	ld	a,(OFST+6,sp)
4632  057c cd064d        	call	_TIM1_SetIC2Prescaler
4635  057f 2024          	jra	L1042
4636  0581               L7732:
4637                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4639  0581 7b09          	ld	a,(OFST+7,sp)
4640  0583 88            	push	a
4641  0584 7b08          	ld	a,(OFST+6,sp)
4642  0586 97            	ld	xl,a
4643  0587 7b05          	ld	a,(OFST+3,sp)
4644  0589 95            	ld	xh,a
4645  058a cd083b        	call	L5_TI2_Config
4647  058d 84            	pop	a
4648                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4650  058e 7b08          	ld	a,(OFST+6,sp)
4651  0590 cd064d        	call	_TIM1_SetIC2Prescaler
4653                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4655  0593 7b09          	ld	a,(OFST+7,sp)
4656  0595 88            	push	a
4657  0596 7b03          	ld	a,(OFST+1,sp)
4658  0598 97            	ld	xl,a
4659  0599 7b02          	ld	a,(OFST+0,sp)
4660  059b 95            	ld	xh,a
4661  059c cd080b        	call	L3_TI1_Config
4663  059f 84            	pop	a
4664                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4666  05a0 7b08          	ld	a,(OFST+6,sp)
4667  05a2 cd0640        	call	_TIM1_SetIC1Prescaler
4669  05a5               L1042:
4670                     ; 1796 }
4673  05a5 5b04          	addw	sp,#4
4674  05a7 81            	ret
4726                     ; 1803 uint16_t TIM1_GetCapture1(void)
4726                     ; 1804 {
4727                     	switch	.text
4728  05a8               _TIM1_GetCapture1:
4730  05a8 5204          	subw	sp,#4
4731       00000004      OFST:	set	4
4734                     ; 1807   uint16_t tmpccr1 = 0;
4736                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4740                     ; 1810   tmpccr1h = TIM1->CCR1H;
4742  05aa c652c6        	ld	a,21190
4743  05ad 6b02          	ld	(OFST-2,sp),a
4745                     ; 1811   tmpccr1l = TIM1->CCR1L;
4747  05af c652c7        	ld	a,21191
4748  05b2 6b01          	ld	(OFST-3,sp),a
4750                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4752  05b4 7b01          	ld	a,(OFST-3,sp)
4753  05b6 5f            	clrw	x
4754  05b7 97            	ld	xl,a
4755  05b8 1f03          	ldw	(OFST-1,sp),x
4757                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4759  05ba 7b02          	ld	a,(OFST-2,sp)
4760  05bc 5f            	clrw	x
4761  05bd 97            	ld	xl,a
4762  05be 4f            	clr	a
4763  05bf 02            	rlwa	x,a
4764  05c0 01            	rrwa	x,a
4765  05c1 1a04          	or	a,(OFST+0,sp)
4766  05c3 01            	rrwa	x,a
4767  05c4 1a03          	or	a,(OFST-1,sp)
4768  05c6 01            	rrwa	x,a
4769  05c7 1f03          	ldw	(OFST-1,sp),x
4771                     ; 1816   return (uint16_t)tmpccr1;
4773  05c9 1e03          	ldw	x,(OFST-1,sp)
4776  05cb 5b04          	addw	sp,#4
4777  05cd 81            	ret
4829                     ; 1824 uint16_t TIM1_GetCapture2(void)
4829                     ; 1825 {
4830                     	switch	.text
4831  05ce               _TIM1_GetCapture2:
4833  05ce 5204          	subw	sp,#4
4834       00000004      OFST:	set	4
4837                     ; 1828   uint16_t tmpccr2 = 0;
4839                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4843                     ; 1831   tmpccr2h = TIM1->CCR2H;
4845  05d0 c652c8        	ld	a,21192
4846  05d3 6b02          	ld	(OFST-2,sp),a
4848                     ; 1832   tmpccr2l = TIM1->CCR2L;
4850  05d5 c652c9        	ld	a,21193
4851  05d8 6b01          	ld	(OFST-3,sp),a
4853                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4855  05da 7b01          	ld	a,(OFST-3,sp)
4856  05dc 5f            	clrw	x
4857  05dd 97            	ld	xl,a
4858  05de 1f03          	ldw	(OFST-1,sp),x
4860                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4862  05e0 7b02          	ld	a,(OFST-2,sp)
4863  05e2 5f            	clrw	x
4864  05e3 97            	ld	xl,a
4865  05e4 4f            	clr	a
4866  05e5 02            	rlwa	x,a
4867  05e6 01            	rrwa	x,a
4868  05e7 1a04          	or	a,(OFST+0,sp)
4869  05e9 01            	rrwa	x,a
4870  05ea 1a03          	or	a,(OFST-1,sp)
4871  05ec 01            	rrwa	x,a
4872  05ed 1f03          	ldw	(OFST-1,sp),x
4874                     ; 1837   return (uint16_t)tmpccr2;
4876  05ef 1e03          	ldw	x,(OFST-1,sp)
4879  05f1 5b04          	addw	sp,#4
4880  05f3 81            	ret
4932                     ; 1845 uint16_t TIM1_GetCapture3(void)
4932                     ; 1846 {
4933                     	switch	.text
4934  05f4               _TIM1_GetCapture3:
4936  05f4 5204          	subw	sp,#4
4937       00000004      OFST:	set	4
4940                     ; 1848   uint16_t tmpccr3 = 0;
4942                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4946                     ; 1851   tmpccr3h = TIM1->CCR3H;
4948  05f6 c652ca        	ld	a,21194
4949  05f9 6b02          	ld	(OFST-2,sp),a
4951                     ; 1852   tmpccr3l = TIM1->CCR3L;
4953  05fb c652cb        	ld	a,21195
4954  05fe 6b01          	ld	(OFST-3,sp),a
4956                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4958  0600 7b01          	ld	a,(OFST-3,sp)
4959  0602 5f            	clrw	x
4960  0603 97            	ld	xl,a
4961  0604 1f03          	ldw	(OFST-1,sp),x
4963                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4965  0606 7b02          	ld	a,(OFST-2,sp)
4966  0608 5f            	clrw	x
4967  0609 97            	ld	xl,a
4968  060a 4f            	clr	a
4969  060b 02            	rlwa	x,a
4970  060c 01            	rrwa	x,a
4971  060d 1a04          	or	a,(OFST+0,sp)
4972  060f 01            	rrwa	x,a
4973  0610 1a03          	or	a,(OFST-1,sp)
4974  0612 01            	rrwa	x,a
4975  0613 1f03          	ldw	(OFST-1,sp),x
4977                     ; 1857   return (uint16_t)tmpccr3;
4979  0615 1e03          	ldw	x,(OFST-1,sp)
4982  0617 5b04          	addw	sp,#4
4983  0619 81            	ret
5035                     ; 1865 uint16_t TIM1_GetCapture4(void)
5035                     ; 1866 {
5036                     	switch	.text
5037  061a               _TIM1_GetCapture4:
5039  061a 5204          	subw	sp,#4
5040       00000004      OFST:	set	4
5043                     ; 1868   uint16_t tmpccr4 = 0;
5045                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5049                     ; 1871   tmpccr4h = TIM1->CCR4H;
5051  061c c652cc        	ld	a,21196
5052  061f 6b02          	ld	(OFST-2,sp),a
5054                     ; 1872   tmpccr4l = TIM1->CCR4L;
5056  0621 c652cd        	ld	a,21197
5057  0624 6b01          	ld	(OFST-3,sp),a
5059                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5061  0626 7b01          	ld	a,(OFST-3,sp)
5062  0628 5f            	clrw	x
5063  0629 97            	ld	xl,a
5064  062a 1f03          	ldw	(OFST-1,sp),x
5066                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5068  062c 7b02          	ld	a,(OFST-2,sp)
5069  062e 5f            	clrw	x
5070  062f 97            	ld	xl,a
5071  0630 4f            	clr	a
5072  0631 02            	rlwa	x,a
5073  0632 01            	rrwa	x,a
5074  0633 1a04          	or	a,(OFST+0,sp)
5075  0635 01            	rrwa	x,a
5076  0636 1a03          	or	a,(OFST-1,sp)
5077  0638 01            	rrwa	x,a
5078  0639 1f03          	ldw	(OFST-1,sp),x
5080                     ; 1877   return (uint16_t)tmpccr4;
5082  063b 1e03          	ldw	x,(OFST-1,sp)
5085  063d 5b04          	addw	sp,#4
5086  063f 81            	ret
5122                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5122                     ; 1891 {
5123                     	switch	.text
5124  0640               _TIM1_SetIC1Prescaler:
5126  0640 88            	push	a
5127       00000000      OFST:	set	0
5130                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5132                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5134  0641 c652b9        	ld	a,21177
5135  0644 a4f3          	and	a,#243
5136  0646 1a01          	or	a,(OFST+1,sp)
5137  0648 c752b9        	ld	21177,a
5138                     ; 1897 }
5141  064b 84            	pop	a
5142  064c 81            	ret
5178                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5178                     ; 1910 {
5179                     	switch	.text
5180  064d               _TIM1_SetIC2Prescaler:
5182  064d 88            	push	a
5183       00000000      OFST:	set	0
5186                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5188                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5190  064e c652ba        	ld	a,21178
5191  0651 a4f3          	and	a,#243
5192  0653 1a01          	or	a,(OFST+1,sp)
5193  0655 c752ba        	ld	21178,a
5194                     ; 1916 }
5197  0658 84            	pop	a
5198  0659 81            	ret
5234                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5234                     ; 1929 {
5235                     	switch	.text
5236  065a               _TIM1_SetIC3Prescaler:
5238  065a 88            	push	a
5239       00000000      OFST:	set	0
5242                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5244                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5246  065b c652bb        	ld	a,21179
5247  065e a4f3          	and	a,#243
5248  0660 1a01          	or	a,(OFST+1,sp)
5249  0662 c752bb        	ld	21179,a
5250                     ; 1936 }
5253  0665 84            	pop	a
5254  0666 81            	ret
5290                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5290                     ; 1949 {
5291                     	switch	.text
5292  0667               _TIM1_SetIC4Prescaler:
5294  0667 88            	push	a
5295       00000000      OFST:	set	0
5298                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5300                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5302  0668 c652bc        	ld	a,21180
5303  066b a4f3          	and	a,#243
5304  066d 1a01          	or	a,(OFST+1,sp)
5305  066f c752bc        	ld	21180,a
5306                     ; 1956 }
5309  0672 84            	pop	a
5310  0673 81            	ret
5417                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5417                     ; 1992 {
5418                     	switch	.text
5419  0674               _TIM1_ITConfig:
5421  0674 89            	pushw	x
5422       00000000      OFST:	set	0
5425                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5427                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5429                     ; 1997   if (NewState != DISABLE)
5431  0675 9f            	ld	a,xl
5432  0676 4d            	tnz	a
5433  0677 2709          	jreq	L1762
5434                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5436  0679 9e            	ld	a,xh
5437  067a ca52b5        	or	a,21173
5438  067d c752b5        	ld	21173,a
5440  0680 2009          	jra	L3762
5441  0682               L1762:
5442                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5444  0682 7b01          	ld	a,(OFST+1,sp)
5445  0684 43            	cpl	a
5446  0685 c452b5        	and	a,21173
5447  0688 c752b5        	ld	21173,a
5448  068b               L3762:
5449                     ; 2007 }
5452  068b 85            	popw	x
5453  068c 81            	ret
5558                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5558                     ; 2024 {
5559                     	switch	.text
5560  068d               _TIM1_GenerateEvent:
5564                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5566                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5568  068d c752b8        	ld	21176,a
5569                     ; 2030 }
5572  0690 81            	ret
5746                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5746                     ; 2050 {
5747                     	switch	.text
5748  0691               _TIM1_GetFlagStatus:
5750  0691 89            	pushw	x
5751  0692 89            	pushw	x
5752       00000002      OFST:	set	2
5755                     ; 2051   FlagStatus bitstatus = RESET;
5757                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5761                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5763                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5765  0693 9f            	ld	a,xl
5766  0694 c452b6        	and	a,21174
5767  0697 6b01          	ld	(OFST-1,sp),a
5769                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5771  0699 c652b7        	ld	a,21175
5772  069c 1403          	and	a,(OFST+1,sp)
5773  069e 6b02          	ld	(OFST+0,sp),a
5775                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5777  06a0 7b01          	ld	a,(OFST-1,sp)
5778  06a2 1a02          	or	a,(OFST+0,sp)
5779  06a4 2706          	jreq	L5303
5780                     ; 2062     bitstatus = SET;
5782  06a6 a601          	ld	a,#1
5783  06a8 6b02          	ld	(OFST+0,sp),a
5786  06aa 2002          	jra	L7303
5787  06ac               L5303:
5788                     ; 2066     bitstatus = RESET;
5790  06ac 0f02          	clr	(OFST+0,sp)
5792  06ae               L7303:
5793                     ; 2068   return (FlagStatus)(bitstatus);
5795  06ae 7b02          	ld	a,(OFST+0,sp)
5798  06b0 5b04          	addw	sp,#4
5799  06b2 81            	ret
5834                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5834                     ; 2090 {
5835                     	switch	.text
5836  06b3               _TIM1_ClearFlag:
5838  06b3 89            	pushw	x
5839       00000000      OFST:	set	0
5842                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5844                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5846  06b4 9f            	ld	a,xl
5847  06b5 43            	cpl	a
5848  06b6 c752b6        	ld	21174,a
5849                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5851  06b9 7b01          	ld	a,(OFST+1,sp)
5852  06bb 43            	cpl	a
5853  06bc a41e          	and	a,#30
5854  06be c752b7        	ld	21175,a
5855                     ; 2097 }
5858  06c1 85            	popw	x
5859  06c2 81            	ret
5923                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5923                     ; 2115 {
5924                     	switch	.text
5925  06c3               _TIM1_GetITStatus:
5927  06c3 88            	push	a
5928  06c4 89            	pushw	x
5929       00000002      OFST:	set	2
5932                     ; 2116   ITStatus bitstatus = RESET;
5934                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5938                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5940                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5942  06c5 c452b6        	and	a,21174
5943  06c8 6b01          	ld	(OFST-1,sp),a
5945                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5947  06ca c652b5        	ld	a,21173
5948  06cd 1403          	and	a,(OFST+1,sp)
5949  06cf 6b02          	ld	(OFST+0,sp),a
5951                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5953  06d1 0d01          	tnz	(OFST-1,sp)
5954  06d3 270a          	jreq	L1113
5956  06d5 0d02          	tnz	(OFST+0,sp)
5957  06d7 2706          	jreq	L1113
5958                     ; 2129     bitstatus = SET;
5960  06d9 a601          	ld	a,#1
5961  06db 6b02          	ld	(OFST+0,sp),a
5964  06dd 2002          	jra	L3113
5965  06df               L1113:
5966                     ; 2133     bitstatus = RESET;
5968  06df 0f02          	clr	(OFST+0,sp)
5970  06e1               L3113:
5971                     ; 2135   return (ITStatus)(bitstatus);
5973  06e1 7b02          	ld	a,(OFST+0,sp)
5976  06e3 5b03          	addw	sp,#3
5977  06e5 81            	ret
6013                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6013                     ; 2153 {
6014                     	switch	.text
6015  06e6               _TIM1_ClearITPendingBit:
6019                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
6021                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6023  06e6 43            	cpl	a
6024  06e7 c752b6        	ld	21174,a
6025                     ; 2159 }
6028  06ea 81            	ret
6566                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6566                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6566                     ; 2169 {
6567                     	switch	.text
6568  06eb               _TIM1_DMAConfig:
6572                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6574                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6576                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6578  06eb 9e            	ld	a,xh
6579  06ec c752d1        	ld	21201,a
6580                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6582  06ef 9f            	ld	a,xl
6583  06f0 c752d2        	ld	21202,a
6584                     ; 2177 }
6587  06f3 81            	ret
6681                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6681                     ; 2190 {
6682                     	switch	.text
6683  06f4               _TIM1_DMACmd:
6685  06f4 89            	pushw	x
6686       00000000      OFST:	set	0
6689                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6691                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6693                     ; 2195   if (NewState != DISABLE)
6695  06f5 9f            	ld	a,xl
6696  06f6 4d            	tnz	a
6697  06f7 2709          	jreq	L7243
6698                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6700  06f9 9e            	ld	a,xh
6701  06fa ca52b4        	or	a,21172
6702  06fd c752b4        	ld	21172,a
6704  0700 2009          	jra	L1343
6705  0702               L7243:
6706                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6708  0702 7b01          	ld	a,(OFST+1,sp)
6709  0704 43            	cpl	a
6710  0705 c452b4        	and	a,21172
6711  0708 c752b4        	ld	21172,a
6712  070b               L1343:
6713                     ; 2205 }
6716  070b 85            	popw	x
6717  070c 81            	ret
6752                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6752                     ; 2214 {
6753                     	switch	.text
6754  070d               _TIM1_SelectCCDMA:
6758                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6760                     ; 2218   if (NewState != DISABLE)
6762  070d 4d            	tnz	a
6763  070e 2706          	jreq	L1543
6764                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6766  0710 721652b1      	bset	21169,#3
6768  0714 2004          	jra	L3543
6769  0716               L1543:
6770                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6772  0716 721752b1      	bres	21169,#3
6773  071a               L3543:
6774                     ; 2228 }
6777  071a 81            	ret
6801                     ; 2251 void TIM1_InternalClockConfig(void)
6801                     ; 2252 {
6802                     	switch	.text
6803  071b               _TIM1_InternalClockConfig:
6807                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6809  071b c652b2        	ld	a,21170
6810  071e a4f8          	and	a,#248
6811  0720 c752b2        	ld	21170,a
6812                     ; 2255 }
6815  0723 81            	ret
6904                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6904                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6904                     ; 2274                                  uint8_t ICFilter)
6904                     ; 2275 {
6905                     	switch	.text
6906  0724               _TIM1_TIxExternalClockConfig:
6908  0724 89            	pushw	x
6909       00000000      OFST:	set	0
6912                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6914                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6916                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6918                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6920  0725 9e            	ld	a,xh
6921  0726 a160          	cp	a,#96
6922  0728 260e          	jrne	L5253
6923                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6925  072a 7b05          	ld	a,(OFST+5,sp)
6926  072c 88            	push	a
6927  072d 9f            	ld	a,xl
6928  072e ae0001        	ldw	x,#1
6929  0731 95            	ld	xh,a
6930  0732 cd083b        	call	L5_TI2_Config
6932  0735 84            	pop	a
6934  0736 200d          	jra	L7253
6935  0738               L5253:
6936                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6938  0738 7b05          	ld	a,(OFST+5,sp)
6939  073a 88            	push	a
6940  073b 7b03          	ld	a,(OFST+3,sp)
6941  073d ae0001        	ldw	x,#1
6942  0740 95            	ld	xh,a
6943  0741 cd080b        	call	L3_TI1_Config
6945  0744 84            	pop	a
6946  0745               L7253:
6947                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6949  0745 7b01          	ld	a,(OFST+1,sp)
6950  0747 ad34          	call	_TIM1_SelectInputTrigger
6952                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6954  0749 c652b2        	ld	a,21170
6955  074c aa07          	or	a,#7
6956  074e c752b2        	ld	21170,a
6957                     ; 2296 }
6960  0751 85            	popw	x
6961  0752 81            	ret
7078                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7078                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7078                     ; 2316                               uint8_t ExtTRGFilter)
7078                     ; 2317 {
7079                     	switch	.text
7080  0753               _TIM1_ETRClockMode1Config:
7082  0753 89            	pushw	x
7083       00000000      OFST:	set	0
7086                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7088                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7090                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7092                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7094  0754 7b05          	ld	a,(OFST+5,sp)
7095  0756 88            	push	a
7096  0757 9f            	ld	a,xl
7097  0758 97            	ld	xl,a
7098  0759 7b02          	ld	a,(OFST+2,sp)
7099  075b 95            	ld	xh,a
7100  075c ad54          	call	_TIM1_ETRConfig
7102  075e 84            	pop	a
7103                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7103                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7105  075f c652b2        	ld	a,21170
7106  0762 a488          	and	a,#136
7107  0764 aa77          	or	a,#119
7108  0766 c752b2        	ld	21170,a
7109                     ; 2329 }
7112  0769 85            	popw	x
7113  076a 81            	ret
7171                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7171                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7171                     ; 2349                               uint8_t ExtTRGFilter)
7171                     ; 2350 {
7172                     	switch	.text
7173  076b               _TIM1_ETRClockMode2Config:
7175  076b 89            	pushw	x
7176       00000000      OFST:	set	0
7179                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7181                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7183                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7185  076c 7b05          	ld	a,(OFST+5,sp)
7186  076e 88            	push	a
7187  076f 9f            	ld	a,xl
7188  0770 97            	ld	xl,a
7189  0771 7b02          	ld	a,(OFST+2,sp)
7190  0773 95            	ld	xh,a
7191  0774 ad3c          	call	_TIM1_ETRConfig
7193  0776 84            	pop	a
7194                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7196  0777 721c52b3      	bset	21171,#6
7197                     ; 2360 }
7200  077b 85            	popw	x
7201  077c 81            	ret
7308                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7308                     ; 2411 {
7309                     	switch	.text
7310  077d               _TIM1_SelectInputTrigger:
7312  077d 88            	push	a
7313       00000000      OFST:	set	0
7316                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7318                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7320  077e c652b2        	ld	a,21170
7321  0781 a48f          	and	a,#143
7322  0783 1a01          	or	a,(OFST+1,sp)
7323  0785 c752b2        	ld	21170,a
7324                     ; 2417 }
7327  0788 84            	pop	a
7328  0789 81            	ret
7434                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7434                     ; 2434 {
7435                     	switch	.text
7436  078a               _TIM1_SelectOutputTrigger:
7438  078a 88            	push	a
7439       00000000      OFST:	set	0
7442                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7444                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7446  078b c652b1        	ld	a,21169
7447  078e a48f          	and	a,#143
7448  0790 1a01          	or	a,(OFST+1,sp)
7449  0792 c752b1        	ld	21169,a
7450                     ; 2439 }
7453  0795 84            	pop	a
7454  0796 81            	ret
7528                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7528                     ; 2452 {
7529                     	switch	.text
7530  0797               _TIM1_SelectSlaveMode:
7532  0797 88            	push	a
7533       00000000      OFST:	set	0
7536                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7538                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7540  0798 c652b2        	ld	a,21170
7541  079b a4f8          	and	a,#248
7542  079d 1a01          	or	a,(OFST+1,sp)
7543  079f c752b2        	ld	21170,a
7544                     ; 2459 }
7547  07a2 84            	pop	a
7548  07a3 81            	ret
7584                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7584                     ; 2468 {
7585                     	switch	.text
7586  07a4               _TIM1_SelectMasterSlaveMode:
7590                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7592                     ; 2473   if (NewState != DISABLE)
7594  07a4 4d            	tnz	a
7595  07a5 2706          	jreq	L5004
7596                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7598  07a7 721e52b2      	bset	21170,#7
7600  07ab 2004          	jra	L7004
7601  07ad               L5004:
7602                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7604  07ad 721f52b2      	bres	21170,#7
7605  07b1               L7004:
7606                     ; 2481 }
7609  07b1 81            	ret
7665                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7665                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7665                     ; 2501                     uint8_t ExtTRGFilter)
7665                     ; 2502 {
7666                     	switch	.text
7667  07b2               _TIM1_ETRConfig:
7669  07b2 89            	pushw	x
7670       00000000      OFST:	set	0
7673                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7675                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7675                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7675                     ; 2508                          | (uint8_t) ExtTRGFilter);
7677  07b3 9f            	ld	a,xl
7678  07b4 1a01          	or	a,(OFST+1,sp)
7679  07b6 1a05          	or	a,(OFST+5,sp)
7680  07b8 ca52b3        	or	a,21171
7681  07bb c752b3        	ld	21171,a
7682                     ; 2509 }
7685  07be 85            	popw	x
7686  07bf 81            	ret
7772                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7772                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7772                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7772                     ; 2550 {
7773                     	switch	.text
7774  07c0               _TIM1_EncoderInterfaceConfig:
7776  07c0 89            	pushw	x
7777       00000000      OFST:	set	0
7780                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7782                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7784                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7786                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7788  07c1 9f            	ld	a,xl
7789  07c2 4d            	tnz	a
7790  07c3 2706          	jreq	L7704
7791                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7793  07c5 721252bd      	bset	21181,#1
7795  07c9 2004          	jra	L1014
7796  07cb               L7704:
7797                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7799  07cb 721352bd      	bres	21181,#1
7800  07cf               L1014:
7801                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7803  07cf 0d05          	tnz	(OFST+5,sp)
7804  07d1 2706          	jreq	L3014
7805                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7807  07d3 721a52bd      	bset	21181,#5
7809  07d7 2004          	jra	L5014
7810  07d9               L3014:
7811                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7813  07d9 721b52bd      	bres	21181,#5
7814  07dd               L5014:
7815                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7817  07dd c652b2        	ld	a,21170
7818  07e0 a4f0          	and	a,#240
7819  07e2 1a01          	or	a,(OFST+1,sp)
7820  07e4 c752b2        	ld	21170,a
7821                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7823  07e7 c652b9        	ld	a,21177
7824  07ea a4fc          	and	a,#252
7825  07ec aa01          	or	a,#1
7826  07ee c752b9        	ld	21177,a
7827                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7829  07f1 c652ba        	ld	a,21178
7830  07f4 a4fc          	and	a,#252
7831  07f6 aa01          	or	a,#1
7832  07f8 c752ba        	ld	21178,a
7833                     ; 2581 }
7836  07fb 85            	popw	x
7837  07fc 81            	ret
7873                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7873                     ; 2590 {
7874                     	switch	.text
7875  07fd               _TIM1_SelectHallSensor:
7879                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7881                     ; 2595   if (NewState != DISABLE)
7883  07fd 4d            	tnz	a
7884  07fe 2706          	jreq	L5214
7885                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7887  0800 721e52b1      	bset	21169,#7
7889  0804 2004          	jra	L7214
7890  0806               L5214:
7891                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7893  0806 721f52b1      	bres	21169,#7
7894  080a               L7214:
7895                     ; 2603 }
7898  080a 81            	ret
7950                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7950                     ; 2624 {
7951                     	switch	.text
7952  080b               L3_TI1_Config:
7954  080b 89            	pushw	x
7955  080c 88            	push	a
7956       00000001      OFST:	set	1
7959                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7961  080d 721152bd      	bres	21181,#0
7962                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7962                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7964  0811 7b06          	ld	a,(OFST+5,sp)
7965  0813 97            	ld	xl,a
7966  0814 a610          	ld	a,#16
7967  0816 42            	mul	x,a
7968  0817 9f            	ld	a,xl
7969  0818 1a03          	or	a,(OFST+2,sp)
7970  081a 6b01          	ld	(OFST+0,sp),a
7972  081c c652b9        	ld	a,21177
7973  081f a40c          	and	a,#12
7974  0821 1a01          	or	a,(OFST+0,sp)
7975  0823 c752b9        	ld	21177,a
7976                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7978  0826 0d02          	tnz	(OFST+1,sp)
7979  0828 2706          	jreq	L7514
7980                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7982  082a 721252bd      	bset	21181,#1
7984  082e 2004          	jra	L1614
7985  0830               L7514:
7986                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7988  0830 721352bd      	bres	21181,#1
7989  0834               L1614:
7990                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7992  0834 721052bd      	bset	21181,#0
7993                     ; 2647 }
7996  0838 5b03          	addw	sp,#3
7997  083a 81            	ret
8049                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8049                     ; 2664 {
8050                     	switch	.text
8051  083b               L5_TI2_Config:
8053  083b 89            	pushw	x
8054  083c 88            	push	a
8055       00000001      OFST:	set	1
8058                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8060  083d 721952bd      	bres	21181,#4
8061                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8061                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8063  0841 7b06          	ld	a,(OFST+5,sp)
8064  0843 97            	ld	xl,a
8065  0844 a610          	ld	a,#16
8066  0846 42            	mul	x,a
8067  0847 9f            	ld	a,xl
8068  0848 1a03          	or	a,(OFST+2,sp)
8069  084a 6b01          	ld	(OFST+0,sp),a
8071  084c c652ba        	ld	a,21178
8072  084f a40c          	and	a,#12
8073  0851 1a01          	or	a,(OFST+0,sp)
8074  0853 c752ba        	ld	21178,a
8075                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8077  0856 0d02          	tnz	(OFST+1,sp)
8078  0858 2706          	jreq	L1124
8079                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8081  085a 721a52bd      	bset	21181,#5
8083  085e 2004          	jra	L3124
8084  0860               L1124:
8085                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8087  0860 721b52bd      	bres	21181,#5
8088  0864               L3124:
8089                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8091  0864 721852bd      	bset	21181,#4
8092                     ; 2682 }
8095  0868 5b03          	addw	sp,#3
8096  086a 81            	ret
8148                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8148                     ; 2699 {
8149                     	switch	.text
8150  086b               L7_TI3_Config:
8152  086b 89            	pushw	x
8153  086c 88            	push	a
8154       00000001      OFST:	set	1
8157                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8159  086d 721152be      	bres	21182,#0
8160                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8160                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8162  0871 7b06          	ld	a,(OFST+5,sp)
8163  0873 97            	ld	xl,a
8164  0874 a610          	ld	a,#16
8165  0876 42            	mul	x,a
8166  0877 9f            	ld	a,xl
8167  0878 1a03          	or	a,(OFST+2,sp)
8168  087a 6b01          	ld	(OFST+0,sp),a
8170  087c c652bb        	ld	a,21179
8171  087f a40c          	and	a,#12
8172  0881 1a01          	or	a,(OFST+0,sp)
8173  0883 c752bb        	ld	21179,a
8174                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8176  0886 0d02          	tnz	(OFST+1,sp)
8177  0888 2706          	jreq	L3424
8178                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8180  088a 721252be      	bset	21182,#1
8182  088e 2004          	jra	L5424
8183  0890               L3424:
8184                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8186  0890 721352be      	bres	21182,#1
8187  0894               L5424:
8188                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8190  0894 721052be      	bset	21182,#0
8191                     ; 2718 }
8194  0898 5b03          	addw	sp,#3
8195  089a 81            	ret
8247                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8247                     ; 2734 {
8248                     	switch	.text
8249  089b               L11_TI4_Config:
8251  089b 89            	pushw	x
8252  089c 88            	push	a
8253       00000001      OFST:	set	1
8256                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8258  089d 721952be      	bres	21182,#4
8259                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8259                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8261  08a1 7b06          	ld	a,(OFST+5,sp)
8262  08a3 97            	ld	xl,a
8263  08a4 a610          	ld	a,#16
8264  08a6 42            	mul	x,a
8265  08a7 9f            	ld	a,xl
8266  08a8 1a03          	or	a,(OFST+2,sp)
8267  08aa 6b01          	ld	(OFST+0,sp),a
8269  08ac c652bc        	ld	a,21180
8270  08af a40c          	and	a,#12
8271  08b1 1a01          	or	a,(OFST+0,sp)
8272  08b3 c752bc        	ld	21180,a
8273                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8275  08b6 0d02          	tnz	(OFST+1,sp)
8276  08b8 2706          	jreq	L5724
8277                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8279  08ba 721a52be      	bset	21182,#5
8281  08be 2004          	jra	L7724
8282  08c0               L5724:
8283                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8285  08c0 721b52be      	bres	21182,#5
8286  08c4               L7724:
8287                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8289  08c4 721852be      	bset	21182,#4
8290                     ; 2755 }
8293  08c8 5b03          	addw	sp,#3
8294  08ca 81            	ret
8307                     	xdef	_TIM1_SelectHallSensor
8308                     	xdef	_TIM1_EncoderInterfaceConfig
8309                     	xdef	_TIM1_ETRConfig
8310                     	xdef	_TIM1_SelectMasterSlaveMode
8311                     	xdef	_TIM1_SelectSlaveMode
8312                     	xdef	_TIM1_SelectOutputTrigger
8313                     	xdef	_TIM1_SelectInputTrigger
8314                     	xdef	_TIM1_ETRClockMode2Config
8315                     	xdef	_TIM1_ETRClockMode1Config
8316                     	xdef	_TIM1_TIxExternalClockConfig
8317                     	xdef	_TIM1_InternalClockConfig
8318                     	xdef	_TIM1_SelectCCDMA
8319                     	xdef	_TIM1_DMACmd
8320                     	xdef	_TIM1_DMAConfig
8321                     	xdef	_TIM1_ClearITPendingBit
8322                     	xdef	_TIM1_GetITStatus
8323                     	xdef	_TIM1_ClearFlag
8324                     	xdef	_TIM1_GetFlagStatus
8325                     	xdef	_TIM1_GenerateEvent
8326                     	xdef	_TIM1_ITConfig
8327                     	xdef	_TIM1_SetIC4Prescaler
8328                     	xdef	_TIM1_SetIC3Prescaler
8329                     	xdef	_TIM1_SetIC2Prescaler
8330                     	xdef	_TIM1_SetIC1Prescaler
8331                     	xdef	_TIM1_GetCapture4
8332                     	xdef	_TIM1_GetCapture3
8333                     	xdef	_TIM1_GetCapture2
8334                     	xdef	_TIM1_GetCapture1
8335                     	xdef	_TIM1_PWMIConfig
8336                     	xdef	_TIM1_ICInit
8337                     	xdef	_TIM1_CCxNCmd
8338                     	xdef	_TIM1_CCxCmd
8339                     	xdef	_TIM1_SelectCOM
8340                     	xdef	_TIM1_SelectOCREFClear
8341                     	xdef	_TIM1_OC3NPolarityConfig
8342                     	xdef	_TIM1_OC3PolarityConfig
8343                     	xdef	_TIM1_OC2NPolarityConfig
8344                     	xdef	_TIM1_OC2PolarityConfig
8345                     	xdef	_TIM1_OC1NPolarityConfig
8346                     	xdef	_TIM1_OC1PolarityConfig
8347                     	xdef	_TIM1_ClearOC4Ref
8348                     	xdef	_TIM1_ClearOC3Ref
8349                     	xdef	_TIM1_ClearOC2Ref
8350                     	xdef	_TIM1_ClearOC1Ref
8351                     	xdef	_TIM1_OC3FastConfig
8352                     	xdef	_TIM1_OC2FastConfig
8353                     	xdef	_TIM1_OC1FastConfig
8354                     	xdef	_TIM1_OC4PreloadConfig
8355                     	xdef	_TIM1_OC3PreloadConfig
8356                     	xdef	_TIM1_OC2PreloadConfig
8357                     	xdef	_TIM1_OC1PreloadConfig
8358                     	xdef	_TIM1_ForcedOC3Config
8359                     	xdef	_TIM1_ForcedOC2Config
8360                     	xdef	_TIM1_ForcedOC1Config
8361                     	xdef	_TIM1_CCPreloadControl
8362                     	xdef	_TIM1_SetCompare4
8363                     	xdef	_TIM1_SetCompare3
8364                     	xdef	_TIM1_SetCompare2
8365                     	xdef	_TIM1_SetCompare1
8366                     	xdef	_TIM1_SelectOCxM
8367                     	xdef	_TIM1_CtrlPWMOutputs
8368                     	xdef	_TIM1_BDTRConfig
8369                     	xdef	_TIM1_OC3Init
8370                     	xdef	_TIM1_OC2Init
8371                     	xdef	_TIM1_OC1Init
8372                     	xdef	_TIM1_Cmd
8373                     	xdef	_TIM1_SelectOnePulseMode
8374                     	xdef	_TIM1_ARRPreloadConfig
8375                     	xdef	_TIM1_UpdateRequestConfig
8376                     	xdef	_TIM1_UpdateDisableConfig
8377                     	xdef	_TIM1_GetPrescaler
8378                     	xdef	_TIM1_GetCounter
8379                     	xdef	_TIM1_SetAutoreload
8380                     	xdef	_TIM1_SetCounter
8381                     	xdef	_TIM1_CounterModeConfig
8382                     	xdef	_TIM1_PrescalerConfig
8383                     	xdef	_TIM1_TimeBaseInit
8384                     	xdef	_TIM1_DeInit
8403                     	end
