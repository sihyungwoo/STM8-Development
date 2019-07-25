   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 168 void TIM2_DeInit(void)
  42                     ; 169 {
  44                     	switch	.text
  45  0000               _TIM2_DeInit:
  49                     ; 170   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  51  0000 725f5250      	clr	21072
  52                     ; 171   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  54  0004 725f5251      	clr	21073
  55                     ; 172   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  57  0008 725f5252      	clr	21074
  58                     ; 173   TIM2->ETR = TIM_ETR_RESET_VALUE;
  60  000c 725f5253      	clr	21075
  61                     ; 174   TIM2->IER = TIM_IER_RESET_VALUE;
  63  0010 725f5255      	clr	21077
  64                     ; 175   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  66  0014 725f5257      	clr	21079
  67                     ; 178   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  69  0018 725f525b      	clr	21083
  70                     ; 180   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  72  001c 35015259      	mov	21081,#1
  73                     ; 181   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  75  0020 3501525a      	mov	21082,#1
  76                     ; 184   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  78  0024 725f525b      	clr	21083
  79                     ; 185   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  81  0028 725f5259      	clr	21081
  82                     ; 186   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  84  002c 725f525a      	clr	21082
  85                     ; 188   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  87  0030 725f525c      	clr	21084
  88                     ; 189   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  90  0034 725f525d      	clr	21085
  91                     ; 191   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  93  0038 725f525e      	clr	21086
  94                     ; 193   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  96  003c 35ff525f      	mov	21087,#255
  97                     ; 194   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
  99  0040 35ff5260      	mov	21088,#255
 100                     ; 196   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 102  0044 725f5261      	clr	21089
 103                     ; 197   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 105  0048 725f5262      	clr	21090
 106                     ; 198   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 108  004c 725f5263      	clr	21091
 109                     ; 199   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 111  0050 725f5264      	clr	21092
 112                     ; 202   TIM2->OISR = TIM_OISR_RESET_VALUE;
 114  0054 725f5266      	clr	21094
 115                     ; 203   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 117  0058 35015258      	mov	21080,#1
 118                     ; 204   TIM2->BKR = TIM_BKR_RESET_VALUE;
 120  005c 725f5265      	clr	21093
 121                     ; 205   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 123  0060 725f5256      	clr	21078
 124                     ; 206 }
 127  0064 81            	ret
 289                     ; 231 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 289                     ; 232                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 289                     ; 233                        uint16_t TIM2_Period)
 289                     ; 234 {
 290                     	switch	.text
 291  0065               _TIM2_TimeBaseInit:
 293  0065 89            	pushw	x
 294       00000000      OFST:	set	0
 297                     ; 236   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 299                     ; 237   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 301                     ; 242   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 303  0066 7b05          	ld	a,(OFST+5,sp)
 304  0068 c7525f        	ld	21087,a
 305                     ; 243   TIM2->ARRL = (uint8_t)(TIM2_Period);
 307  006b 7b06          	ld	a,(OFST+6,sp)
 308  006d c75260        	ld	21088,a
 309                     ; 246   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 311  0070 9e            	ld	a,xh
 312  0071 c7525e        	ld	21086,a
 313                     ; 249   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 315  0074 c65250        	ld	a,21072
 316  0077 a48f          	and	a,#143
 317  0079 c75250        	ld	21072,a
 318                     ; 250   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 320  007c 9f            	ld	a,xl
 321  007d ca5250        	or	a,21072
 322  0080 c75250        	ld	21072,a
 323                     ; 253   TIM2->EGR = TIM2_EventSource_Update;
 325  0083 35015258      	mov	21080,#1
 326                     ; 254 }
 329  0087 85            	popw	x
 330  0088 81            	ret
 398                     ; 274 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
 398                     ; 275                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
 398                     ; 276 {
 399                     	switch	.text
 400  0089               _TIM2_PrescalerConfig:
 404                     ; 278   assert_param(IS_TIM2_PRESCALER(Prescaler));
 406                     ; 279   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
 408                     ; 282   TIM2->PSCR = (uint8_t)(Prescaler);
 410  0089 9e            	ld	a,xh
 411  008a c7525e        	ld	21086,a
 412                     ; 285   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
 414  008d 9f            	ld	a,xl
 415  008e a101          	cp	a,#1
 416  0090 2606          	jrne	L741
 417                     ; 287     TIM2->EGR |= TIM_EGR_UG ;
 419  0092 72105258      	bset	21080,#0
 421  0096 2004          	jra	L151
 422  0098               L741:
 423                     ; 291     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 425  0098 72115258      	bres	21080,#0
 426  009c               L151:
 427                     ; 293 }
 430  009c 81            	ret
 475                     ; 306 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
 475                     ; 307 {
 476                     	switch	.text
 477  009d               _TIM2_CounterModeConfig:
 479  009d 88            	push	a
 480  009e 88            	push	a
 481       00000001      OFST:	set	1
 484                     ; 308   uint8_t tmpcr1 = 0;
 486                     ; 311   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 488                     ; 313   tmpcr1 = TIM2->CR1;
 490  009f c65250        	ld	a,21072
 491  00a2 6b01          	ld	(OFST+0,sp),a
 493                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 495  00a4 7b01          	ld	a,(OFST+0,sp)
 496  00a6 a48f          	and	a,#143
 497  00a8 6b01          	ld	(OFST+0,sp),a
 499                     ; 319   tmpcr1 |= (uint8_t)TIM2_CounterMode;
 501  00aa 7b01          	ld	a,(OFST+0,sp)
 502  00ac 1a02          	or	a,(OFST+1,sp)
 503  00ae 6b01          	ld	(OFST+0,sp),a
 505                     ; 321   TIM2->CR1 = tmpcr1;
 507  00b0 7b01          	ld	a,(OFST+0,sp)
 508  00b2 c75250        	ld	21072,a
 509                     ; 322 }
 512  00b5 85            	popw	x
 513  00b6 81            	ret
 547                     ; 330 void TIM2_SetCounter(uint16_t Counter)
 547                     ; 331 {
 548                     	switch	.text
 549  00b7               _TIM2_SetCounter:
 553                     ; 334   TIM2->CNTRH = (uint8_t)(Counter >> 8);
 555  00b7 9e            	ld	a,xh
 556  00b8 c7525c        	ld	21084,a
 557                     ; 335   TIM2->CNTRL = (uint8_t)(Counter);
 559  00bb 9f            	ld	a,xl
 560  00bc c7525d        	ld	21085,a
 561                     ; 336 }
 564  00bf 81            	ret
 598                     ; 344 void TIM2_SetAutoreload(uint16_t Autoreload)
 598                     ; 345 {
 599                     	switch	.text
 600  00c0               _TIM2_SetAutoreload:
 604                     ; 347   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
 606  00c0 9e            	ld	a,xh
 607  00c1 c7525f        	ld	21087,a
 608                     ; 348   TIM2->ARRL = (uint8_t)(Autoreload);
 610  00c4 9f            	ld	a,xl
 611  00c5 c75260        	ld	21088,a
 612                     ; 349 }
 615  00c8 81            	ret
 667                     ; 356 uint16_t TIM2_GetCounter(void)
 667                     ; 357 {
 668                     	switch	.text
 669  00c9               _TIM2_GetCounter:
 671  00c9 5204          	subw	sp,#4
 672       00000004      OFST:	set	4
 675                     ; 358   uint16_t tmpcnt = 0;
 677                     ; 361   tmpcntrh = TIM2->CNTRH;
 679  00cb c6525c        	ld	a,21084
 680  00ce 6b02          	ld	(OFST-2,sp),a
 682                     ; 362   tmpcntrl = TIM2->CNTRL;
 684  00d0 c6525d        	ld	a,21085
 685  00d3 6b01          	ld	(OFST-3,sp),a
 687                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 689  00d5 7b01          	ld	a,(OFST-3,sp)
 690  00d7 5f            	clrw	x
 691  00d8 97            	ld	xl,a
 692  00d9 1f03          	ldw	(OFST-1,sp),x
 694                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 696  00db 7b02          	ld	a,(OFST-2,sp)
 697  00dd 5f            	clrw	x
 698  00de 97            	ld	xl,a
 699  00df 4f            	clr	a
 700  00e0 02            	rlwa	x,a
 701  00e1 01            	rrwa	x,a
 702  00e2 1a04          	or	a,(OFST+0,sp)
 703  00e4 01            	rrwa	x,a
 704  00e5 1a03          	or	a,(OFST-1,sp)
 705  00e7 01            	rrwa	x,a
 706  00e8 1f03          	ldw	(OFST-1,sp),x
 708                     ; 367   return ((uint16_t)tmpcnt);
 710  00ea 1e03          	ldw	x,(OFST-1,sp)
 713  00ec 5b04          	addw	sp,#4
 714  00ee 81            	ret
 738                     ; 383 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
 738                     ; 384 {
 739                     	switch	.text
 740  00ef               _TIM2_GetPrescaler:
 744                     ; 386   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
 746  00ef c6525e        	ld	a,21086
 749  00f2 81            	ret
 805                     ; 396 void TIM2_UpdateDisableConfig(FunctionalState NewState)
 805                     ; 397 {
 806                     	switch	.text
 807  00f3               _TIM2_UpdateDisableConfig:
 811                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 813                     ; 402   if (NewState != DISABLE)
 815  00f3 4d            	tnz	a
 816  00f4 2706          	jreq	L513
 817                     ; 404     TIM2->CR1 |= TIM_CR1_UDIS;
 819  00f6 72125250      	bset	21072,#1
 821  00fa 2004          	jra	L713
 822  00fc               L513:
 823                     ; 408     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 825  00fc 72135250      	bres	21072,#1
 826  0100               L713:
 827                     ; 410 }
 830  0100 81            	ret
 888                     ; 420 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
 888                     ; 421 {
 889                     	switch	.text
 890  0101               _TIM2_UpdateRequestConfig:
 894                     ; 423   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
 896                     ; 426   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
 898  0101 a101          	cp	a,#1
 899  0103 2606          	jrne	L743
 900                     ; 428     TIM2->CR1 |= TIM_CR1_URS ;
 902  0105 72145250      	bset	21072,#2
 904  0109 2004          	jra	L153
 905  010b               L743:
 906                     ; 432     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
 908  010b 72155250      	bres	21072,#2
 909  010f               L153:
 910                     ; 434 }
 913  010f 81            	ret
 949                     ; 442 void TIM2_ARRPreloadConfig(FunctionalState NewState)
 949                     ; 443 {
 950                     	switch	.text
 951  0110               _TIM2_ARRPreloadConfig:
 955                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 957                     ; 448   if (NewState != DISABLE)
 959  0110 4d            	tnz	a
 960  0111 2706          	jreq	L173
 961                     ; 450     TIM2->CR1 |= TIM_CR1_ARPE;
 963  0113 721e5250      	bset	21072,#7
 965  0117 2004          	jra	L373
 966  0119               L173:
 967                     ; 454     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 969  0119 721f5250      	bres	21072,#7
 970  011d               L373:
 971                     ; 456 }
 974  011d 81            	ret
1031                     ; 466 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1031                     ; 467 {
1032                     	switch	.text
1033  011e               _TIM2_SelectOnePulseMode:
1037                     ; 469   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
1039                     ; 472   if (TIM2_OPMode == TIM2_OPMode_Single)
1041  011e a101          	cp	a,#1
1042  0120 2606          	jrne	L324
1043                     ; 474     TIM2->CR1 |= TIM_CR1_OPM ;
1045  0122 72165250      	bset	21072,#3
1047  0126 2004          	jra	L524
1048  0128               L324:
1049                     ; 478     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1051  0128 72175250      	bres	21072,#3
1052  012c               L524:
1053                     ; 480 }
1056  012c 81            	ret
1091                     ; 488 void TIM2_Cmd(FunctionalState NewState)
1091                     ; 489 {
1092                     	switch	.text
1093  012d               _TIM2_Cmd:
1097                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1099                     ; 494   if (NewState != DISABLE)
1101  012d 4d            	tnz	a
1102  012e 2706          	jreq	L544
1103                     ; 496     TIM2->CR1 |= TIM_CR1_CEN;
1105  0130 72105250      	bset	21072,#0
1107  0134 2004          	jra	L744
1108  0136               L544:
1109                     ; 500     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1111  0136 72115250      	bres	21072,#0
1112  013a               L744:
1113                     ; 502 }
1116  013a 81            	ret
1314                     ; 578 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1314                     ; 579                   TIM2_OutputState_TypeDef TIM2_OutputState,
1314                     ; 580                   uint16_t TIM2_Pulse,
1314                     ; 581                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1314                     ; 582                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1314                     ; 583 {
1315                     	switch	.text
1316  013b               _TIM2_OC1Init:
1318  013b 89            	pushw	x
1319  013c 88            	push	a
1320       00000001      OFST:	set	1
1323                     ; 584   uint8_t tmpccmr1 = 0;
1325                     ; 587   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1327                     ; 588   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1329                     ; 589   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1331                     ; 590   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1333                     ; 592   tmpccmr1 = TIM2->CCMR1;
1335  013d c65259        	ld	a,21081
1336  0140 6b01          	ld	(OFST+0,sp),a
1338                     ; 595   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1340  0142 7211525b      	bres	21083,#0
1341                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1343  0146 7b01          	ld	a,(OFST+0,sp)
1344  0148 a48f          	and	a,#143
1345  014a 6b01          	ld	(OFST+0,sp),a
1347                     ; 600   tmpccmr1 |= (uint8_t)TIM2_OCMode;
1349  014c 9e            	ld	a,xh
1350  014d 1a01          	or	a,(OFST+0,sp)
1351  014f 6b01          	ld	(OFST+0,sp),a
1353                     ; 602   TIM2->CCMR1 = tmpccmr1;
1355  0151 7b01          	ld	a,(OFST+0,sp)
1356  0153 c75259        	ld	21081,a
1357                     ; 605   if (TIM2_OutputState == TIM2_OutputState_Enable)
1359  0156 9f            	ld	a,xl
1360  0157 a101          	cp	a,#1
1361  0159 2606          	jrne	L365
1362                     ; 607     TIM2->CCER1 |= TIM_CCER1_CC1E;
1364  015b 7210525b      	bset	21083,#0
1366  015f 2004          	jra	L565
1367  0161               L365:
1368                     ; 611     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1370  0161 7211525b      	bres	21083,#0
1371  0165               L565:
1372                     ; 615   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1374  0165 7b08          	ld	a,(OFST+7,sp)
1375  0167 a101          	cp	a,#1
1376  0169 2606          	jrne	L765
1377                     ; 617     TIM2->CCER1 |= TIM_CCER1_CC1P;
1379  016b 7212525b      	bset	21083,#1
1381  016f 2004          	jra	L175
1382  0171               L765:
1383                     ; 621     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1385  0171 7213525b      	bres	21083,#1
1386  0175               L175:
1387                     ; 625   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1389  0175 7b09          	ld	a,(OFST+8,sp)
1390  0177 a101          	cp	a,#1
1391  0179 2606          	jrne	L375
1392                     ; 627     TIM2->OISR |= TIM_OISR_OIS1;
1394  017b 72105266      	bset	21094,#0
1396  017f 2004          	jra	L575
1397  0181               L375:
1398                     ; 631     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1400  0181 72115266      	bres	21094,#0
1401  0185               L575:
1402                     ; 635   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
1404  0185 7b06          	ld	a,(OFST+5,sp)
1405  0187 c75261        	ld	21089,a
1406                     ; 636   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
1408  018a 7b07          	ld	a,(OFST+6,sp)
1409  018c c75262        	ld	21090,a
1410                     ; 637 }
1413  018f 5b03          	addw	sp,#3
1414  0191 81            	ret
1497                     ; 664 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1497                     ; 665                   TIM2_OutputState_TypeDef TIM2_OutputState,
1497                     ; 666                   uint16_t TIM2_Pulse,
1497                     ; 667                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1497                     ; 668                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1497                     ; 669 {
1498                     	switch	.text
1499  0192               _TIM2_OC2Init:
1501  0192 89            	pushw	x
1502  0193 88            	push	a
1503       00000001      OFST:	set	1
1506                     ; 670   uint8_t tmpccmr2 = 0;
1508                     ; 673   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1510                     ; 674   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1512                     ; 675   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1514                     ; 676   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1516                     ; 678   tmpccmr2 = TIM2->CCMR2;
1518  0194 c6525a        	ld	a,21082
1519  0197 6b01          	ld	(OFST+0,sp),a
1521                     ; 681   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1523  0199 7219525b      	bres	21083,#4
1524                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1526  019d 7b01          	ld	a,(OFST+0,sp)
1527  019f a48f          	and	a,#143
1528  01a1 6b01          	ld	(OFST+0,sp),a
1530                     ; 687   tmpccmr2 |= (uint8_t)TIM2_OCMode;
1532  01a3 9e            	ld	a,xh
1533  01a4 1a01          	or	a,(OFST+0,sp)
1534  01a6 6b01          	ld	(OFST+0,sp),a
1536                     ; 689   TIM2->CCMR2 = tmpccmr2;
1538  01a8 7b01          	ld	a,(OFST+0,sp)
1539  01aa c7525a        	ld	21082,a
1540                     ; 692   if (TIM2_OutputState == TIM2_OutputState_Enable)
1542  01ad 9f            	ld	a,xl
1543  01ae a101          	cp	a,#1
1544  01b0 2606          	jrne	L146
1545                     ; 694     TIM2->CCER1 |= TIM_CCER1_CC2E;
1547  01b2 7218525b      	bset	21083,#4
1549  01b6 2004          	jra	L346
1550  01b8               L146:
1551                     ; 698     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1553  01b8 7219525b      	bres	21083,#4
1554  01bc               L346:
1555                     ; 702   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1557  01bc 7b08          	ld	a,(OFST+7,sp)
1558  01be a101          	cp	a,#1
1559  01c0 2606          	jrne	L546
1560                     ; 704     TIM2->CCER1 |= TIM_CCER1_CC2P;
1562  01c2 721a525b      	bset	21083,#5
1564  01c6 2004          	jra	L746
1565  01c8               L546:
1566                     ; 708     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1568  01c8 721b525b      	bres	21083,#5
1569  01cc               L746:
1570                     ; 713   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1572  01cc 7b09          	ld	a,(OFST+8,sp)
1573  01ce a101          	cp	a,#1
1574  01d0 2606          	jrne	L156
1575                     ; 715     TIM2->OISR |= TIM_OISR_OIS2;
1577  01d2 72145266      	bset	21094,#2
1579  01d6 2004          	jra	L356
1580  01d8               L156:
1581                     ; 719     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1583  01d8 72155266      	bres	21094,#2
1584  01dc               L356:
1585                     ; 723   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
1587  01dc 7b06          	ld	a,(OFST+5,sp)
1588  01de c75263        	ld	21091,a
1589                     ; 724   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
1591  01e1 7b07          	ld	a,(OFST+6,sp)
1592  01e3 c75264        	ld	21092,a
1593                     ; 725 }
1596  01e6 5b03          	addw	sp,#3
1597  01e8 81            	ret
1795                     ; 754 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1795                     ; 755                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1795                     ; 756                     TIM2_BreakState_TypeDef TIM2_BreakState,
1795                     ; 757                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1795                     ; 758                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1795                     ; 759 
1795                     ; 760 {
1796                     	switch	.text
1797  01e9               _TIM2_BKRConfig:
1799  01e9 89            	pushw	x
1800  01ea 88            	push	a
1801       00000001      OFST:	set	1
1804                     ; 762   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1806                     ; 763   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1808                     ; 764   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1810                     ; 765   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1812                     ; 766   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1814                     ; 772   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1814                     ; 773                                   (uint8_t)((uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity)) | \
1814                     ; 774                                   TIM2_AutomaticOutput));
1816  01eb 7b06          	ld	a,(OFST+5,sp)
1817  01ed 1a07          	or	a,(OFST+6,sp)
1818  01ef 6b01          	ld	(OFST+0,sp),a
1820  01f1 9f            	ld	a,xl
1821  01f2 1a02          	or	a,(OFST+1,sp)
1822  01f4 1a01          	or	a,(OFST+0,sp)
1823  01f6 1a08          	or	a,(OFST+7,sp)
1824  01f8 c75265        	ld	21093,a
1825                     ; 775 }
1828  01fb 5b03          	addw	sp,#3
1829  01fd 81            	ret
1865                     ; 783 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1865                     ; 784 {
1866                     	switch	.text
1867  01fe               _TIM2_CtrlPWMOutputs:
1871                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1873                     ; 790   if (NewState != DISABLE)
1875  01fe 4d            	tnz	a
1876  01ff 2706          	jreq	L5001
1877                     ; 792     TIM2->BKR |= TIM_BKR_MOE ;
1879  0201 721e5265      	bset	21093,#7
1881  0205 2004          	jra	L7001
1882  0207               L5001:
1883                     ; 796     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1885  0207 721f5265      	bres	21093,#7
1886  020b               L7001:
1887                     ; 798 }
1890  020b 81            	ret
1955                     ; 818 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
1955                     ; 819                      TIM2_OCMode_TypeDef TIM2_OCMode)
1955                     ; 820 {
1956                     	switch	.text
1957  020c               _TIM2_SelectOCxM:
1959  020c 89            	pushw	x
1960       00000000      OFST:	set	0
1963                     ; 822   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1965                     ; 823   assert_param(IS_TIM2_OCM(TIM2_OCMode));
1967                     ; 825   if (TIM2_Channel == TIM2_Channel_1)
1969  020d 9e            	ld	a,xh
1970  020e 4d            	tnz	a
1971  020f 2615          	jrne	L3401
1972                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1974  0211 7211525b      	bres	21083,#0
1975                     ; 831     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1977  0215 c65259        	ld	a,21081
1978  0218 a48f          	and	a,#143
1979  021a c75259        	ld	21081,a
1980                     ; 834     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
1982  021d 9f            	ld	a,xl
1983  021e ca5259        	or	a,21081
1984  0221 c75259        	ld	21081,a
1986  0224 2014          	jra	L5401
1987  0226               L3401:
1988                     ; 839     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1990  0226 7219525b      	bres	21083,#4
1991                     ; 842     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1993  022a c6525a        	ld	a,21082
1994  022d a48f          	and	a,#143
1995  022f c7525a        	ld	21082,a
1996                     ; 845     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
1998  0232 c6525a        	ld	a,21082
1999  0235 1a02          	or	a,(OFST+2,sp)
2000  0237 c7525a        	ld	21082,a
2001  023a               L5401:
2002                     ; 847 }
2005  023a 85            	popw	x
2006  023b 81            	ret
2040                     ; 855 void TIM2_SetCompare1(uint16_t Compare)
2040                     ; 856 {
2041                     	switch	.text
2042  023c               _TIM2_SetCompare1:
2046                     ; 858   TIM2->CCR1H = (uint8_t)(Compare >> 8);
2048  023c 9e            	ld	a,xh
2049  023d c75261        	ld	21089,a
2050                     ; 859   TIM2->CCR1L = (uint8_t)(Compare);
2052  0240 9f            	ld	a,xl
2053  0241 c75262        	ld	21090,a
2054                     ; 860 }
2057  0244 81            	ret
2091                     ; 868 void TIM2_SetCompare2(uint16_t Compare)
2091                     ; 869 {
2092                     	switch	.text
2093  0245               _TIM2_SetCompare2:
2097                     ; 871   TIM2->CCR2H = (uint8_t)(Compare >> 8);
2099  0245 9e            	ld	a,xh
2100  0246 c75263        	ld	21091,a
2101                     ; 872   TIM2->CCR2L = (uint8_t)(Compare);
2103  0249 9f            	ld	a,xl
2104  024a c75264        	ld	21092,a
2105                     ; 873 }
2108  024d 81            	ret
2175                     ; 883 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2175                     ; 884 {
2176                     	switch	.text
2177  024e               _TIM2_ForcedOC1Config:
2179  024e 88            	push	a
2180  024f 88            	push	a
2181       00000001      OFST:	set	1
2184                     ; 885   uint8_t tmpccmr1 = 0;
2186                     ; 888   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2188                     ; 890   tmpccmr1 = TIM2->CCMR1;
2190  0250 c65259        	ld	a,21081
2191  0253 6b01          	ld	(OFST+0,sp),a
2193                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2195  0255 7b01          	ld	a,(OFST+0,sp)
2196  0257 a48f          	and	a,#143
2197  0259 6b01          	ld	(OFST+0,sp),a
2199                     ; 896   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
2201  025b 7b01          	ld	a,(OFST+0,sp)
2202  025d 1a02          	or	a,(OFST+1,sp)
2203  025f 6b01          	ld	(OFST+0,sp),a
2205                     ; 898   TIM2->CCMR1 = tmpccmr1;
2207  0261 7b01          	ld	a,(OFST+0,sp)
2208  0263 c75259        	ld	21081,a
2209                     ; 899 }
2212  0266 85            	popw	x
2213  0267 81            	ret
2258                     ; 909 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2258                     ; 910 {
2259                     	switch	.text
2260  0268               _TIM2_ForcedOC2Config:
2262  0268 88            	push	a
2263  0269 88            	push	a
2264       00000001      OFST:	set	1
2267                     ; 911   uint8_t tmpccmr2 = 0;
2269                     ; 914   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2271                     ; 916   tmpccmr2 = TIM2->CCMR2;
2273  026a c6525a        	ld	a,21082
2274  026d 6b01          	ld	(OFST+0,sp),a
2276                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2278  026f 7b01          	ld	a,(OFST+0,sp)
2279  0271 a48f          	and	a,#143
2280  0273 6b01          	ld	(OFST+0,sp),a
2282                     ; 922   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
2284  0275 7b01          	ld	a,(OFST+0,sp)
2285  0277 1a02          	or	a,(OFST+1,sp)
2286  0279 6b01          	ld	(OFST+0,sp),a
2288                     ; 924   TIM2->CCMR2 = tmpccmr2;
2290  027b 7b01          	ld	a,(OFST+0,sp)
2291  027d c7525a        	ld	21082,a
2292                     ; 925 }
2295  0280 85            	popw	x
2296  0281 81            	ret
2332                     ; 933 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2332                     ; 934 {
2333                     	switch	.text
2334  0282               _TIM2_OC1PreloadConfig:
2338                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2340                     ; 939   if (NewState != DISABLE)
2342  0282 4d            	tnz	a
2343  0283 2706          	jreq	L5711
2344                     ; 941     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
2346  0285 72165259      	bset	21081,#3
2348  0289 2004          	jra	L7711
2349  028b               L5711:
2350                     ; 945     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2352  028b 72175259      	bres	21081,#3
2353  028f               L7711:
2354                     ; 947 }
2357  028f 81            	ret
2393                     ; 955 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2393                     ; 956 {
2394                     	switch	.text
2395  0290               _TIM2_OC2PreloadConfig:
2399                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2401                     ; 961   if (NewState != DISABLE)
2403  0290 4d            	tnz	a
2404  0291 2706          	jreq	L7121
2405                     ; 963     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
2407  0293 7216525a      	bset	21082,#3
2409  0297 2004          	jra	L1221
2410  0299               L7121:
2411                     ; 967     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2413  0299 7217525a      	bres	21082,#3
2414  029d               L1221:
2415                     ; 969 }
2418  029d 81            	ret
2453                     ; 977 void TIM2_OC1FastConfig(FunctionalState NewState)
2453                     ; 978 {
2454                     	switch	.text
2455  029e               _TIM2_OC1FastConfig:
2459                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2461                     ; 983   if (NewState != DISABLE)
2463  029e 4d            	tnz	a
2464  029f 2706          	jreq	L1421
2465                     ; 985     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
2467  02a1 72145259      	bset	21081,#2
2469  02a5 2004          	jra	L3421
2470  02a7               L1421:
2471                     ; 989     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2473  02a7 72155259      	bres	21081,#2
2474  02ab               L3421:
2475                     ; 991 }
2478  02ab 81            	ret
2513                     ; 1000 void TIM2_OC2FastConfig(FunctionalState NewState)
2513                     ; 1001 {
2514                     	switch	.text
2515  02ac               _TIM2_OC2FastConfig:
2519                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2521                     ; 1006   if (NewState != DISABLE)
2523  02ac 4d            	tnz	a
2524  02ad 2706          	jreq	L3621
2525                     ; 1008     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
2527  02af 7214525a      	bset	21082,#2
2529  02b3 2004          	jra	L5621
2530  02b5               L3621:
2531                     ; 1012     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2533  02b5 7215525a      	bres	21082,#2
2534  02b9               L5621:
2535                     ; 1014 }
2538  02b9 81            	ret
2574                     ; 1024 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2574                     ; 1025 {
2575                     	switch	.text
2576  02ba               _TIM2_OC1PolarityConfig:
2580                     ; 1027   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2582                     ; 1030   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2584  02ba a101          	cp	a,#1
2585  02bc 2606          	jrne	L5031
2586                     ; 1032     TIM2->CCER1 |= TIM_CCER1_CC1P ;
2588  02be 7212525b      	bset	21083,#1
2590  02c2 2004          	jra	L7031
2591  02c4               L5031:
2592                     ; 1036     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2594  02c4 7213525b      	bres	21083,#1
2595  02c8               L7031:
2596                     ; 1038 }
2599  02c8 81            	ret
2635                     ; 1048 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2635                     ; 1049 {
2636                     	switch	.text
2637  02c9               _TIM2_OC2PolarityConfig:
2641                     ; 1051   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2643                     ; 1054   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2645  02c9 a101          	cp	a,#1
2646  02cb 2606          	jrne	L7231
2647                     ; 1056     TIM2->CCER1 |= TIM_CCER1_CC2P ;
2649  02cd 721a525b      	bset	21083,#5
2651  02d1 2004          	jra	L1331
2652  02d3               L7231:
2653                     ; 1060     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2655  02d3 721b525b      	bres	21083,#5
2656  02d7               L1331:
2657                     ; 1062 }
2660  02d7 81            	ret
2705                     ; 1074 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
2705                     ; 1075                  FunctionalState NewState)
2705                     ; 1076 {
2706                     	switch	.text
2707  02d8               _TIM2_CCxCmd:
2709  02d8 89            	pushw	x
2710       00000000      OFST:	set	0
2713                     ; 1078   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2715                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2717                     ; 1081   if (TIM2_Channel == TIM2_Channel_1)
2719  02d9 9e            	ld	a,xh
2720  02da 4d            	tnz	a
2721  02db 2610          	jrne	L5531
2722                     ; 1084     if (NewState != DISABLE)
2724  02dd 9f            	ld	a,xl
2725  02de 4d            	tnz	a
2726  02df 2706          	jreq	L7531
2727                     ; 1086       TIM2->CCER1 |= TIM_CCER1_CC1E ;
2729  02e1 7210525b      	bset	21083,#0
2731  02e5 2014          	jra	L3631
2732  02e7               L7531:
2733                     ; 1090       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2735  02e7 7211525b      	bres	21083,#0
2736  02eb 200e          	jra	L3631
2737  02ed               L5531:
2738                     ; 1097     if (NewState != DISABLE)
2740  02ed 0d02          	tnz	(OFST+2,sp)
2741  02ef 2706          	jreq	L5631
2742                     ; 1099       TIM2->CCER1 |= TIM_CCER1_CC2E;
2744  02f1 7218525b      	bset	21083,#4
2746  02f5 2004          	jra	L3631
2747  02f7               L5631:
2748                     ; 1103       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2750  02f7 7219525b      	bres	21083,#4
2751  02fb               L3631:
2752                     ; 1106 }
2755  02fb 85            	popw	x
2756  02fc 81            	ret
2920                     ; 1184 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
2920                     ; 1185                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2920                     ; 1186                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
2920                     ; 1187                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2920                     ; 1188                  uint8_t TIM2_ICFilter)
2920                     ; 1189 {
2921                     	switch	.text
2922  02fd               _TIM2_ICInit:
2924  02fd 89            	pushw	x
2925       00000000      OFST:	set	0
2928                     ; 1191   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2930                     ; 1193   if (TIM2_Channel == TIM2_Channel_1)
2932  02fe 9e            	ld	a,xh
2933  02ff 4d            	tnz	a
2934  0300 2614          	jrne	L5641
2935                     ; 1196     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2937  0302 7b07          	ld	a,(OFST+7,sp)
2938  0304 88            	push	a
2939  0305 7b06          	ld	a,(OFST+6,sp)
2940  0307 97            	ld	xl,a
2941  0308 7b03          	ld	a,(OFST+3,sp)
2942  030a 95            	ld	xh,a
2943  030b cd060d        	call	L3_TI1_Config
2945  030e 84            	pop	a
2946                     ; 1199     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
2948  030f 7b06          	ld	a,(OFST+6,sp)
2949  0311 cd03e3        	call	_TIM2_SetIC1Prescaler
2952  0314 2012          	jra	L7641
2953  0316               L5641:
2954                     ; 1204     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2956  0316 7b07          	ld	a,(OFST+7,sp)
2957  0318 88            	push	a
2958  0319 7b06          	ld	a,(OFST+6,sp)
2959  031b 97            	ld	xl,a
2960  031c 7b03          	ld	a,(OFST+3,sp)
2961  031e 95            	ld	xh,a
2962  031f cd064a        	call	L5_TI2_Config
2964  0322 84            	pop	a
2965                     ; 1207     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
2967  0323 7b06          	ld	a,(OFST+6,sp)
2968  0325 cd03fd        	call	_TIM2_SetIC2Prescaler
2970  0328               L7641:
2971                     ; 1209 }
2974  0328 85            	popw	x
2975  0329 81            	ret
3071                     ; 1235 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
3071                     ; 1236                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
3071                     ; 1237                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
3071                     ; 1238                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
3071                     ; 1239                      uint8_t TIM2_ICFilter)
3071                     ; 1240 {
3072                     	switch	.text
3073  032a               _TIM2_PWMIConfig:
3075  032a 89            	pushw	x
3076  032b 89            	pushw	x
3077       00000002      OFST:	set	2
3080                     ; 1241   uint8_t icpolarity = TIM2_ICPolarity_Rising;
3082                     ; 1242   uint8_t icselection = TIM2_ICSelection_DirectTI;
3084                     ; 1245   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
3086                     ; 1248   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
3088  032c 9f            	ld	a,xl
3089  032d 4d            	tnz	a
3090  032e 2606          	jrne	L7351
3091                     ; 1250     icpolarity = TIM2_ICPolarity_Falling;
3093  0330 a601          	ld	a,#1
3094  0332 6b01          	ld	(OFST-1,sp),a
3097  0334 2002          	jra	L1451
3098  0336               L7351:
3099                     ; 1254     icpolarity = TIM2_ICPolarity_Rising;
3101  0336 0f01          	clr	(OFST-1,sp)
3103  0338               L1451:
3104                     ; 1258   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
3106  0338 7b07          	ld	a,(OFST+5,sp)
3107  033a a101          	cp	a,#1
3108  033c 2606          	jrne	L3451
3109                     ; 1260     icselection = TIM2_ICSelection_IndirectTI;
3111  033e a602          	ld	a,#2
3112  0340 6b02          	ld	(OFST+0,sp),a
3115  0342 2004          	jra	L5451
3116  0344               L3451:
3117                     ; 1264     icselection = TIM2_ICSelection_DirectTI;
3119  0344 a601          	ld	a,#1
3120  0346 6b02          	ld	(OFST+0,sp),a
3122  0348               L5451:
3123                     ; 1267   if (TIM2_Channel == TIM2_Channel_1)
3125  0348 0d03          	tnz	(OFST+1,sp)
3126  034a 2626          	jrne	L7451
3127                     ; 1270     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
3127                     ; 1271                TIM2_ICFilter);
3129  034c 7b09          	ld	a,(OFST+7,sp)
3130  034e 88            	push	a
3131  034f 7b08          	ld	a,(OFST+6,sp)
3132  0351 97            	ld	xl,a
3133  0352 7b05          	ld	a,(OFST+3,sp)
3134  0354 95            	ld	xh,a
3135  0355 cd060d        	call	L3_TI1_Config
3137  0358 84            	pop	a
3138                     ; 1274     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3140  0359 7b08          	ld	a,(OFST+6,sp)
3141  035b cd03e3        	call	_TIM2_SetIC1Prescaler
3143                     ; 1277     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3145  035e 7b09          	ld	a,(OFST+7,sp)
3146  0360 88            	push	a
3147  0361 7b03          	ld	a,(OFST+1,sp)
3148  0363 97            	ld	xl,a
3149  0364 7b02          	ld	a,(OFST+0,sp)
3150  0366 95            	ld	xh,a
3151  0367 cd064a        	call	L5_TI2_Config
3153  036a 84            	pop	a
3154                     ; 1280     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3156  036b 7b08          	ld	a,(OFST+6,sp)
3157  036d cd03fd        	call	_TIM2_SetIC2Prescaler
3160  0370 2022          	jra	L1551
3161  0372               L7451:
3162                     ; 1285     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
3162                     ; 1286                TIM2_ICFilter);
3164  0372 7b09          	ld	a,(OFST+7,sp)
3165  0374 88            	push	a
3166  0375 7b08          	ld	a,(OFST+6,sp)
3167  0377 97            	ld	xl,a
3168  0378 7b05          	ld	a,(OFST+3,sp)
3169  037a 95            	ld	xh,a
3170  037b cd064a        	call	L5_TI2_Config
3172  037e 84            	pop	a
3173                     ; 1289     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3175  037f 7b08          	ld	a,(OFST+6,sp)
3176  0381 ad7a          	call	_TIM2_SetIC2Prescaler
3178                     ; 1292     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3180  0383 7b09          	ld	a,(OFST+7,sp)
3181  0385 88            	push	a
3182  0386 7b03          	ld	a,(OFST+1,sp)
3183  0388 97            	ld	xl,a
3184  0389 7b02          	ld	a,(OFST+0,sp)
3185  038b 95            	ld	xh,a
3186  038c cd060d        	call	L3_TI1_Config
3188  038f 84            	pop	a
3189                     ; 1295     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3191  0390 7b08          	ld	a,(OFST+6,sp)
3192  0392 ad4f          	call	_TIM2_SetIC1Prescaler
3194  0394               L1551:
3195                     ; 1297 }
3198  0394 5b04          	addw	sp,#4
3199  0396 81            	ret
3251                     ; 1304 uint16_t TIM2_GetCapture1(void)
3251                     ; 1305 {
3252                     	switch	.text
3253  0397               _TIM2_GetCapture1:
3255  0397 5204          	subw	sp,#4
3256       00000004      OFST:	set	4
3259                     ; 1306   uint16_t tmpccr1 = 0;
3261                     ; 1309   tmpccr1h = TIM2->CCR1H;
3263  0399 c65261        	ld	a,21089
3264  039c 6b02          	ld	(OFST-2,sp),a
3266                     ; 1310   tmpccr1l = TIM2->CCR1L;
3268  039e c65262        	ld	a,21090
3269  03a1 6b01          	ld	(OFST-3,sp),a
3271                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3273  03a3 7b01          	ld	a,(OFST-3,sp)
3274  03a5 5f            	clrw	x
3275  03a6 97            	ld	xl,a
3276  03a7 1f03          	ldw	(OFST-1,sp),x
3278                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3280  03a9 7b02          	ld	a,(OFST-2,sp)
3281  03ab 5f            	clrw	x
3282  03ac 97            	ld	xl,a
3283  03ad 4f            	clr	a
3284  03ae 02            	rlwa	x,a
3285  03af 01            	rrwa	x,a
3286  03b0 1a04          	or	a,(OFST+0,sp)
3287  03b2 01            	rrwa	x,a
3288  03b3 1a03          	or	a,(OFST-1,sp)
3289  03b5 01            	rrwa	x,a
3290  03b6 1f03          	ldw	(OFST-1,sp),x
3292                     ; 1315   return ((uint16_t)tmpccr1);
3294  03b8 1e03          	ldw	x,(OFST-1,sp)
3297  03ba 5b04          	addw	sp,#4
3298  03bc 81            	ret
3350                     ; 1323 uint16_t TIM2_GetCapture2(void)
3350                     ; 1324 {
3351                     	switch	.text
3352  03bd               _TIM2_GetCapture2:
3354  03bd 5204          	subw	sp,#4
3355       00000004      OFST:	set	4
3358                     ; 1325   uint16_t tmpccr2 = 0;
3360                     ; 1328   tmpccr2h = TIM2->CCR2H;
3362  03bf c65263        	ld	a,21091
3363  03c2 6b02          	ld	(OFST-2,sp),a
3365                     ; 1329   tmpccr2l = TIM2->CCR2L;
3367  03c4 c65264        	ld	a,21092
3368  03c7 6b01          	ld	(OFST-3,sp),a
3370                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3372  03c9 7b01          	ld	a,(OFST-3,sp)
3373  03cb 5f            	clrw	x
3374  03cc 97            	ld	xl,a
3375  03cd 1f03          	ldw	(OFST-1,sp),x
3377                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3379  03cf 7b02          	ld	a,(OFST-2,sp)
3380  03d1 5f            	clrw	x
3381  03d2 97            	ld	xl,a
3382  03d3 4f            	clr	a
3383  03d4 02            	rlwa	x,a
3384  03d5 01            	rrwa	x,a
3385  03d6 1a04          	or	a,(OFST+0,sp)
3386  03d8 01            	rrwa	x,a
3387  03d9 1a03          	or	a,(OFST-1,sp)
3388  03db 01            	rrwa	x,a
3389  03dc 1f03          	ldw	(OFST-1,sp),x
3391                     ; 1334   return ((uint16_t)tmpccr2);
3393  03de 1e03          	ldw	x,(OFST-1,sp)
3396  03e0 5b04          	addw	sp,#4
3397  03e2 81            	ret
3442                     ; 1347 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3442                     ; 1348 {
3443                     	switch	.text
3444  03e3               _TIM2_SetIC1Prescaler:
3446  03e3 88            	push	a
3447  03e4 88            	push	a
3448       00000001      OFST:	set	1
3451                     ; 1349   uint8_t tmpccmr1 = 0;
3453                     ; 1352   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
3455                     ; 1354   tmpccmr1 = TIM2->CCMR1;
3457  03e5 c65259        	ld	a,21081
3458  03e8 6b01          	ld	(OFST+0,sp),a
3460                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3462  03ea 7b01          	ld	a,(OFST+0,sp)
3463  03ec a4f3          	and	a,#243
3464  03ee 6b01          	ld	(OFST+0,sp),a
3466                     ; 1360   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
3468  03f0 7b01          	ld	a,(OFST+0,sp)
3469  03f2 1a02          	or	a,(OFST+1,sp)
3470  03f4 6b01          	ld	(OFST+0,sp),a
3472                     ; 1362   TIM2->CCMR1 = tmpccmr1;
3474  03f6 7b01          	ld	a,(OFST+0,sp)
3475  03f8 c75259        	ld	21081,a
3476                     ; 1363 }
3479  03fb 85            	popw	x
3480  03fc 81            	ret
3525                     ; 1375 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3525                     ; 1376 {
3526                     	switch	.text
3527  03fd               _TIM2_SetIC2Prescaler:
3529  03fd 88            	push	a
3530  03fe 88            	push	a
3531       00000001      OFST:	set	1
3534                     ; 1377   uint8_t tmpccmr2 = 0;
3536                     ; 1380   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
3538                     ; 1382   tmpccmr2 = TIM2->CCMR2;
3540  03ff c6525a        	ld	a,21082
3541  0402 6b01          	ld	(OFST+0,sp),a
3543                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3545  0404 7b01          	ld	a,(OFST+0,sp)
3546  0406 a4f3          	and	a,#243
3547  0408 6b01          	ld	(OFST+0,sp),a
3549                     ; 1388   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
3551  040a 7b01          	ld	a,(OFST+0,sp)
3552  040c 1a02          	or	a,(OFST+1,sp)
3553  040e 6b01          	ld	(OFST+0,sp),a
3555                     ; 1390   TIM2->CCMR2 = tmpccmr2;
3557  0410 7b01          	ld	a,(OFST+0,sp)
3558  0412 c7525a        	ld	21082,a
3559                     ; 1391 }
3562  0415 85            	popw	x
3563  0416 81            	ret
3649                     ; 1422 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
3649                     ; 1423 {
3650                     	switch	.text
3651  0417               _TIM2_ITConfig:
3653  0417 89            	pushw	x
3654       00000000      OFST:	set	0
3657                     ; 1425   assert_param(IS_TIM2_IT(TIM2_IT));
3659                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3661                     ; 1428   if (NewState != DISABLE)
3663  0418 9f            	ld	a,xl
3664  0419 4d            	tnz	a
3665  041a 2709          	jreq	L3371
3666                     ; 1431     TIM2->IER |= (uint8_t)TIM2_IT;
3668  041c 9e            	ld	a,xh
3669  041d ca5255        	or	a,21077
3670  0420 c75255        	ld	21077,a
3672  0423 2009          	jra	L5371
3673  0425               L3371:
3674                     ; 1436     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
3676  0425 7b01          	ld	a,(OFST+1,sp)
3677  0427 43            	cpl	a
3678  0428 c45255        	and	a,21077
3679  042b c75255        	ld	21077,a
3680  042e               L5371:
3681                     ; 1438 }
3684  042e 85            	popw	x
3685  042f 81            	ret
3766                     ; 1451 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3766                     ; 1452 {
3767                     	switch	.text
3768  0430               _TIM2_GenerateEvent:
3772                     ; 1454   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3774                     ; 1457   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3776  0430 ca5258        	or	a,21080
3777  0433 c75258        	ld	21080,a
3778                     ; 1458 }
3781  0436 81            	ret
3920                     ; 1473 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3920                     ; 1474 {
3921                     	switch	.text
3922  0437               _TIM2_GetFlagStatus:
3924  0437 89            	pushw	x
3925  0438 89            	pushw	x
3926       00000002      OFST:	set	2
3929                     ; 1475   FlagStatus bitstatus = RESET;
3931                     ; 1476   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3935                     ; 1479   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
3937                     ; 1481   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
3939  0439 9f            	ld	a,xl
3940  043a c45256        	and	a,21078
3941  043d 6b01          	ld	(OFST-1,sp),a
3943                     ; 1482   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
3945  043f c65257        	ld	a,21079
3946  0442 1403          	and	a,(OFST+1,sp)
3947  0444 6b02          	ld	(OFST+0,sp),a
3949                     ; 1484   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
3951  0446 7b01          	ld	a,(OFST-1,sp)
3952  0448 1a02          	or	a,(OFST+0,sp)
3953  044a 2706          	jreq	L7502
3954                     ; 1486     bitstatus = SET;
3956  044c a601          	ld	a,#1
3957  044e 6b02          	ld	(OFST+0,sp),a
3960  0450 2002          	jra	L1602
3961  0452               L7502:
3962                     ; 1490     bitstatus = RESET;
3964  0452 0f02          	clr	(OFST+0,sp)
3966  0454               L1602:
3967                     ; 1492   return ((FlagStatus)bitstatus);
3969  0454 7b02          	ld	a,(OFST+0,sp)
3972  0456 5b04          	addw	sp,#4
3973  0458 81            	ret
4008                     ; 1506 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4008                     ; 1507 {
4009                     	switch	.text
4010  0459               _TIM2_ClearFlag:
4012  0459 89            	pushw	x
4013       00000000      OFST:	set	0
4016                     ; 1509   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
4018                     ; 1511   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
4020  045a 9f            	ld	a,xl
4021  045b 43            	cpl	a
4022  045c c75256        	ld	21078,a
4023                     ; 1512   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
4025  045f 7b01          	ld	a,(OFST+1,sp)
4026  0461 43            	cpl	a
4027  0462 c75257        	ld	21079,a
4028                     ; 1513 }
4031  0465 85            	popw	x
4032  0466 81            	ret
4096                     ; 1526 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4096                     ; 1527 {
4097                     	switch	.text
4098  0467               _TIM2_GetITStatus:
4100  0467 88            	push	a
4101  0468 89            	pushw	x
4102       00000002      OFST:	set	2
4105                     ; 1528   ITStatus bitstatus = RESET;
4107                     ; 1530   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
4111                     ; 1533   assert_param(IS_TIM2_GET_IT(TIM2_IT));
4113                     ; 1535   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
4115  0469 c45256        	and	a,21078
4116  046c 6b01          	ld	(OFST-1,sp),a
4118                     ; 1537   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
4120  046e c65255        	ld	a,21077
4121  0471 1403          	and	a,(OFST+1,sp)
4122  0473 6b02          	ld	(OFST+0,sp),a
4124                     ; 1539   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
4126  0475 0d01          	tnz	(OFST-1,sp)
4127  0477 270a          	jreq	L3312
4129  0479 0d02          	tnz	(OFST+0,sp)
4130  047b 2706          	jreq	L3312
4131                     ; 1541     bitstatus = (ITStatus)SET;
4133  047d a601          	ld	a,#1
4134  047f 6b02          	ld	(OFST+0,sp),a
4137  0481 2002          	jra	L5312
4138  0483               L3312:
4139                     ; 1545     bitstatus = (ITStatus)RESET;
4141  0483 0f02          	clr	(OFST+0,sp)
4143  0485               L5312:
4144                     ; 1547   return ((ITStatus)bitstatus);
4146  0485 7b02          	ld	a,(OFST+0,sp)
4149  0487 5b03          	addw	sp,#3
4150  0489 81            	ret
4186                     ; 1561 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4186                     ; 1562 {
4187                     	switch	.text
4188  048a               _TIM2_ClearITPendingBit:
4192                     ; 1564   assert_param(IS_TIM2_IT(TIM2_IT));
4194                     ; 1567   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
4196  048a 43            	cpl	a
4197  048b c75256        	ld	21078,a
4198                     ; 1568 }
4201  048e 81            	ret
4274                     ; 1581 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
4274                     ; 1582 {
4275                     	switch	.text
4276  048f               _TIM2_DMACmd:
4278  048f 89            	pushw	x
4279       00000000      OFST:	set	0
4282                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4284                     ; 1585   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
4286                     ; 1587   if (NewState != DISABLE)
4288  0490 9f            	ld	a,xl
4289  0491 4d            	tnz	a
4290  0492 2709          	jreq	L1122
4291                     ; 1590     TIM2->DER |= TIM2_DMASource;
4293  0494 9e            	ld	a,xh
4294  0495 ca5254        	or	a,21076
4295  0498 c75254        	ld	21076,a
4297  049b 2009          	jra	L3122
4298  049d               L1122:
4299                     ; 1595     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
4301  049d 7b01          	ld	a,(OFST+1,sp)
4302  049f 43            	cpl	a
4303  04a0 c45254        	and	a,21076
4304  04a3 c75254        	ld	21076,a
4305  04a6               L3122:
4306                     ; 1597 }
4309  04a6 85            	popw	x
4310  04a7 81            	ret
4345                     ; 1605 void TIM2_SelectCCDMA(FunctionalState NewState)
4345                     ; 1606 {
4346                     	switch	.text
4347  04a8               _TIM2_SelectCCDMA:
4351                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4353                     ; 1610   if (NewState != DISABLE)
4355  04a8 4d            	tnz	a
4356  04a9 2706          	jreq	L3322
4357                     ; 1613     TIM2->CR2 |= TIM_CR2_CCDS;
4359  04ab 72165251      	bset	21073,#3
4361  04af 2004          	jra	L5322
4362  04b1               L3322:
4363                     ; 1618     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4365  04b1 72175251      	bres	21073,#3
4366  04b5               L5322:
4367                     ; 1620 }
4370  04b5 81            	ret
4394                     ; 1644 void TIM2_InternalClockConfig(void)
4394                     ; 1645 {
4395                     	switch	.text
4396  04b6               _TIM2_InternalClockConfig:
4400                     ; 1647   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4402  04b6 c65252        	ld	a,21074
4403  04b9 a4f8          	and	a,#248
4404  04bb c75252        	ld	21074,a
4405                     ; 1648 }
4408  04be 81            	ret
4497                     ; 1665 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
4497                     ; 1666                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
4497                     ; 1667                                  uint8_t ICFilter)
4497                     ; 1668 {
4498                     	switch	.text
4499  04bf               _TIM2_TIxExternalClockConfig:
4501  04bf 89            	pushw	x
4502       00000000      OFST:	set	0
4505                     ; 1670   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
4507                     ; 1671   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
4509                     ; 1672   assert_param(IS_TIM2_IC_FILTER(ICFilter));
4511                     ; 1675   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
4513  04c0 9e            	ld	a,xh
4514  04c1 a160          	cp	a,#96
4515  04c3 260e          	jrne	L7032
4516                     ; 1677     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4518  04c5 7b05          	ld	a,(OFST+5,sp)
4519  04c7 88            	push	a
4520  04c8 9f            	ld	a,xl
4521  04c9 ae0001        	ldw	x,#1
4522  04cc 95            	ld	xh,a
4523  04cd cd064a        	call	L5_TI2_Config
4525  04d0 84            	pop	a
4527  04d1 200d          	jra	L1132
4528  04d3               L7032:
4529                     ; 1681     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4531  04d3 7b05          	ld	a,(OFST+5,sp)
4532  04d5 88            	push	a
4533  04d6 7b03          	ld	a,(OFST+3,sp)
4534  04d8 ae0001        	ldw	x,#1
4535  04db 95            	ld	xh,a
4536  04dc cd060d        	call	L3_TI1_Config
4538  04df 84            	pop	a
4539  04e0               L1132:
4540                     ; 1685   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
4542  04e0 7b01          	ld	a,(OFST+1,sp)
4543  04e2 ad4b          	call	_TIM2_SelectInputTrigger
4545                     ; 1688   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4547  04e4 c65252        	ld	a,21074
4548  04e7 aa07          	or	a,#7
4549  04e9 c75252        	ld	21074,a
4550                     ; 1689 }
4553  04ec 85            	popw	x
4554  04ed 81            	ret
4671                     ; 1707 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4671                     ; 1708                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4671                     ; 1709                               uint8_t ExtTRGFilter)
4671                     ; 1710 {
4672                     	switch	.text
4673  04ee               _TIM2_ETRClockMode1Config:
4675  04ee 89            	pushw	x
4676       00000000      OFST:	set	0
4679                     ; 1712   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4681  04ef 7b05          	ld	a,(OFST+5,sp)
4682  04f1 88            	push	a
4683  04f2 9f            	ld	a,xl
4684  04f3 97            	ld	xl,a
4685  04f4 7b02          	ld	a,(OFST+2,sp)
4686  04f6 95            	ld	xh,a
4687  04f7 cd058b        	call	_TIM2_ETRConfig
4689  04fa 84            	pop	a
4690                     ; 1715   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4692  04fb c65252        	ld	a,21074
4693  04fe a4f8          	and	a,#248
4694  0500 c75252        	ld	21074,a
4695                     ; 1716   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4697  0503 c65252        	ld	a,21074
4698  0506 aa07          	or	a,#7
4699  0508 c75252        	ld	21074,a
4700                     ; 1719   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4702  050b c65252        	ld	a,21074
4703  050e a48f          	and	a,#143
4704  0510 c75252        	ld	21074,a
4705                     ; 1720   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
4707  0513 c65252        	ld	a,21074
4708  0516 aa70          	or	a,#112
4709  0518 c75252        	ld	21074,a
4710                     ; 1721 }
4713  051b 85            	popw	x
4714  051c 81            	ret
4772                     ; 1739 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4772                     ; 1740                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4772                     ; 1741                               uint8_t ExtTRGFilter)
4772                     ; 1742 {
4773                     	switch	.text
4774  051d               _TIM2_ETRClockMode2Config:
4776  051d 89            	pushw	x
4777       00000000      OFST:	set	0
4780                     ; 1744   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4782  051e 7b05          	ld	a,(OFST+5,sp)
4783  0520 88            	push	a
4784  0521 9f            	ld	a,xl
4785  0522 97            	ld	xl,a
4786  0523 7b02          	ld	a,(OFST+2,sp)
4787  0525 95            	ld	xh,a
4788  0526 ad63          	call	_TIM2_ETRConfig
4790  0528 84            	pop	a
4791                     ; 1747   TIM2->ETR |= TIM_ETR_ECE ;
4793  0529 721c5253      	bset	21075,#6
4794                     ; 1748 }
4797  052d 85            	popw	x
4798  052e 81            	ret
4914                     ; 1799 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
4914                     ; 1800 {
4915                     	switch	.text
4916  052f               _TIM2_SelectInputTrigger:
4918  052f 88            	push	a
4919  0530 88            	push	a
4920       00000001      OFST:	set	1
4923                     ; 1801   uint8_t tmpsmcr = 0;
4925                     ; 1804   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
4927                     ; 1806   tmpsmcr = TIM2->SMCR;
4929  0531 c65252        	ld	a,21074
4930  0534 6b01          	ld	(OFST+0,sp),a
4932                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4934  0536 7b01          	ld	a,(OFST+0,sp)
4935  0538 a48f          	and	a,#143
4936  053a 6b01          	ld	(OFST+0,sp),a
4938                     ; 1810   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
4940  053c 7b01          	ld	a,(OFST+0,sp)
4941  053e 1a02          	or	a,(OFST+1,sp)
4942  0540 6b01          	ld	(OFST+0,sp),a
4944                     ; 1812   TIM2->SMCR = (uint8_t)tmpsmcr;
4946  0542 7b01          	ld	a,(OFST+0,sp)
4947  0544 c75252        	ld	21074,a
4948                     ; 1813 }
4951  0547 85            	popw	x
4952  0548 81            	ret
5051                     ; 1827 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
5051                     ; 1828 {
5052                     	switch	.text
5053  0549               _TIM2_SelectOutputTrigger:
5055  0549 88            	push	a
5056  054a 88            	push	a
5057       00000001      OFST:	set	1
5060                     ; 1829   uint8_t tmpcr2 = 0;
5062                     ; 1832   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
5064                     ; 1834   tmpcr2 = TIM2->CR2;
5066  054b c65251        	ld	a,21073
5067  054e 6b01          	ld	(OFST+0,sp),a
5069                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5071  0550 7b01          	ld	a,(OFST+0,sp)
5072  0552 a48f          	and	a,#143
5073  0554 6b01          	ld	(OFST+0,sp),a
5075                     ; 1840   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
5077  0556 7b01          	ld	a,(OFST+0,sp)
5078  0558 1a02          	or	a,(OFST+1,sp)
5079  055a 6b01          	ld	(OFST+0,sp),a
5081                     ; 1842   TIM2->CR2 = tmpcr2;
5083  055c 7b01          	ld	a,(OFST+0,sp)
5084  055e c75251        	ld	21073,a
5085                     ; 1843 }
5088  0561 85            	popw	x
5089  0562 81            	ret
5172                     ; 1855 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
5172                     ; 1856 {
5173                     	switch	.text
5174  0563               _TIM2_SelectSlaveMode:
5176  0563 88            	push	a
5177  0564 88            	push	a
5178       00000001      OFST:	set	1
5181                     ; 1857   uint8_t tmpsmcr = 0;
5183                     ; 1860   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
5185                     ; 1862   tmpsmcr = TIM2->SMCR;
5187  0565 c65252        	ld	a,21074
5188  0568 6b01          	ld	(OFST+0,sp),a
5190                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5192  056a 7b01          	ld	a,(OFST+0,sp)
5193  056c a4f8          	and	a,#248
5194  056e 6b01          	ld	(OFST+0,sp),a
5196                     ; 1868   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
5198  0570 7b01          	ld	a,(OFST+0,sp)
5199  0572 1a02          	or	a,(OFST+1,sp)
5200  0574 6b01          	ld	(OFST+0,sp),a
5202                     ; 1870   TIM2->SMCR = tmpsmcr;
5204  0576 7b01          	ld	a,(OFST+0,sp)
5205  0578 c75252        	ld	21074,a
5206                     ; 1871 }
5209  057b 85            	popw	x
5210  057c 81            	ret
5246                     ; 1879 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
5246                     ; 1880 {
5247                     	switch	.text
5248  057d               _TIM2_SelectMasterSlaveMode:
5252                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5254                     ; 1885   if (NewState != DISABLE)
5256  057d 4d            	tnz	a
5257  057e 2706          	jreq	L7752
5258                     ; 1887     TIM2->SMCR |= TIM_SMCR_MSM;
5260  0580 721e5252      	bset	21074,#7
5262  0584 2004          	jra	L1062
5263  0586               L7752:
5264                     ; 1891     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5266  0586 721f5252      	bres	21074,#7
5267  058a               L1062:
5268                     ; 1893 }
5271  058a 81            	ret
5327                     ; 1911 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
5327                     ; 1912                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
5327                     ; 1913                     uint8_t ExtTRGFilter)
5327                     ; 1914 {
5328                     	switch	.text
5329  058b               _TIM2_ETRConfig:
5331  058b 89            	pushw	x
5332       00000000      OFST:	set	0
5335                     ; 1916   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
5337                     ; 1917   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
5339                     ; 1918   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
5341                     ; 1921   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity)
5341                     ; 1922                          | (uint8_t)ExtTRGFilter);
5343  058c 9f            	ld	a,xl
5344  058d 1a01          	or	a,(OFST+1,sp)
5345  058f 1a05          	or	a,(OFST+5,sp)
5346  0591 ca5253        	or	a,21075
5347  0594 c75253        	ld	21075,a
5348                     ; 1923 }
5351  0597 85            	popw	x
5352  0598 81            	ret
5465                     ; 1958 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
5465                     ; 1959                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
5465                     ; 1960                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
5465                     ; 1961 {
5466                     	switch	.text
5467  0599               _TIM2_EncoderInterfaceConfig:
5469  0599 89            	pushw	x
5470  059a 5203          	subw	sp,#3
5471       00000003      OFST:	set	3
5474                     ; 1962   uint8_t tmpsmcr = 0;
5476                     ; 1963   uint8_t tmpccmr1 = 0;
5478                     ; 1964   uint8_t tmpccmr2 = 0;
5480                     ; 1967   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
5482                     ; 1968   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
5484                     ; 1969   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
5486                     ; 1971   tmpsmcr = TIM2->SMCR;
5488  059c c65252        	ld	a,21074
5489  059f 6b01          	ld	(OFST-2,sp),a
5491                     ; 1972   tmpccmr1 = TIM2->CCMR1;
5493  05a1 c65259        	ld	a,21081
5494  05a4 6b02          	ld	(OFST-1,sp),a
5496                     ; 1973   tmpccmr2 = TIM2->CCMR2;
5498  05a6 c6525a        	ld	a,21082
5499  05a9 6b03          	ld	(OFST+0,sp),a
5501                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5503  05ab 7b01          	ld	a,(OFST-2,sp)
5504  05ad a4f0          	and	a,#240
5505  05af 6b01          	ld	(OFST-2,sp),a
5507                     ; 1977   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
5509  05b1 9e            	ld	a,xh
5510  05b2 1a01          	or	a,(OFST-2,sp)
5511  05b4 6b01          	ld	(OFST-2,sp),a
5513                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5515  05b6 7b02          	ld	a,(OFST-1,sp)
5516  05b8 a4fc          	and	a,#252
5517  05ba 6b02          	ld	(OFST-1,sp),a
5519                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5521  05bc 7b03          	ld	a,(OFST+0,sp)
5522  05be a4fc          	and	a,#252
5523  05c0 6b03          	ld	(OFST+0,sp),a
5525                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5527  05c2 7b02          	ld	a,(OFST-1,sp)
5528  05c4 aa01          	or	a,#1
5529  05c6 6b02          	ld	(OFST-1,sp),a
5531                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5533  05c8 7b03          	ld	a,(OFST+0,sp)
5534  05ca aa01          	or	a,#1
5535  05cc 6b03          	ld	(OFST+0,sp),a
5537                     ; 1986   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
5539  05ce 9f            	ld	a,xl
5540  05cf a101          	cp	a,#1
5541  05d1 2606          	jrne	L5072
5542                     ; 1988     TIM2->CCER1 |= TIM_CCER1_CC1P ;
5544  05d3 7212525b      	bset	21083,#1
5546  05d7 2004          	jra	L7072
5547  05d9               L5072:
5548                     ; 1992     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5550  05d9 7213525b      	bres	21083,#1
5551  05dd               L7072:
5552                     ; 1995   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
5554  05dd 7b08          	ld	a,(OFST+5,sp)
5555  05df a101          	cp	a,#1
5556  05e1 2606          	jrne	L1172
5557                     ; 1997     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5559  05e3 721a525b      	bset	21083,#5
5561  05e7 2004          	jra	L3172
5562  05e9               L1172:
5563                     ; 2001     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5565  05e9 721b525b      	bres	21083,#5
5566  05ed               L3172:
5567                     ; 2004   TIM2->SMCR = tmpsmcr;
5569  05ed 7b01          	ld	a,(OFST-2,sp)
5570  05ef c75252        	ld	21074,a
5571                     ; 2005   TIM2->CCMR1 = tmpccmr1;
5573  05f2 7b02          	ld	a,(OFST-1,sp)
5574  05f4 c75259        	ld	21081,a
5575                     ; 2006   TIM2->CCMR2 = tmpccmr2;
5577  05f7 7b03          	ld	a,(OFST+0,sp)
5578  05f9 c7525a        	ld	21082,a
5579                     ; 2007 }
5582  05fc 5b05          	addw	sp,#5
5583  05fe 81            	ret
5619                     ; 2015 void TIM2_SelectHallSensor(FunctionalState NewState)
5619                     ; 2016 {
5620                     	switch	.text
5621  05ff               _TIM2_SelectHallSensor:
5625                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5627                     ; 2021   if (NewState != DISABLE)
5629  05ff 4d            	tnz	a
5630  0600 2706          	jreq	L3372
5631                     ; 2023     TIM2->CR2 |= TIM_CR2_TI1S;
5633  0602 721e5251      	bset	21073,#7
5635  0606 2004          	jra	L5372
5636  0608               L3372:
5637                     ; 2027     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5639  0608 721f5251      	bres	21073,#7
5640  060c               L5372:
5641                     ; 2029 }
5644  060c 81            	ret
5716                     ; 2050 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5716                     ; 2051                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5716                     ; 2052                        uint8_t TIM2_ICFilter)
5716                     ; 2053 {
5717                     	switch	.text
5718  060d               L3_TI1_Config:
5720  060d 89            	pushw	x
5721  060e 89            	pushw	x
5722       00000002      OFST:	set	2
5725                     ; 2054   uint8_t tmpccmr1 = 0;
5727                     ; 2055   uint8_t tmpicpolarity = TIM2_ICPolarity;
5729  060f 9e            	ld	a,xh
5730  0610 6b01          	ld	(OFST-1,sp),a
5732                     ; 2056   tmpccmr1 = TIM2->CCMR1;
5734  0612 c65259        	ld	a,21081
5735  0615 6b02          	ld	(OFST+0,sp),a
5737                     ; 2059   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5739                     ; 2060   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5741                     ; 2061   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5743                     ; 2064   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5745  0617 7211525b      	bres	21083,#0
5746                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5748  061b 7b02          	ld	a,(OFST+0,sp)
5749  061d a40c          	and	a,#12
5750  061f 6b02          	ld	(OFST+0,sp),a
5752                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5754  0621 7b07          	ld	a,(OFST+5,sp)
5755  0623 97            	ld	xl,a
5756  0624 a610          	ld	a,#16
5757  0626 42            	mul	x,a
5758  0627 9f            	ld	a,xl
5759  0628 1a04          	or	a,(OFST+2,sp)
5760  062a 1a02          	or	a,(OFST+0,sp)
5761  062c 6b02          	ld	(OFST+0,sp),a
5763                     ; 2070   TIM2->CCMR1 = tmpccmr1;
5765  062e 7b02          	ld	a,(OFST+0,sp)
5766  0630 c75259        	ld	21081,a
5767                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5769  0633 7b01          	ld	a,(OFST-1,sp)
5770  0635 a101          	cp	a,#1
5771  0637 2606          	jrne	L5772
5772                     ; 2075     TIM2->CCER1 |= TIM_CCER1_CC1P;
5774  0639 7212525b      	bset	21083,#1
5776  063d 2004          	jra	L7772
5777  063f               L5772:
5778                     ; 2079     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5780  063f 7213525b      	bres	21083,#1
5781  0643               L7772:
5782                     ; 2083   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5784  0643 7210525b      	bset	21083,#0
5785                     ; 2084 }
5788  0647 5b04          	addw	sp,#4
5789  0649 81            	ret
5861                     ; 2101 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5861                     ; 2102                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5861                     ; 2103                        uint8_t TIM2_ICFilter)
5861                     ; 2104 {
5862                     	switch	.text
5863  064a               L5_TI2_Config:
5865  064a 89            	pushw	x
5866  064b 89            	pushw	x
5867       00000002      OFST:	set	2
5870                     ; 2105   uint8_t tmpccmr2 = 0;
5872                     ; 2106   uint8_t tmpicpolarity = TIM2_ICPolarity;
5874  064c 9e            	ld	a,xh
5875  064d 6b01          	ld	(OFST-1,sp),a
5877                     ; 2109   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5879                     ; 2110   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5881                     ; 2111   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5883                     ; 2113   tmpccmr2 = TIM2->CCMR2;
5885  064f c6525a        	ld	a,21082
5886  0652 6b02          	ld	(OFST+0,sp),a
5888                     ; 2116   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5890  0654 7219525b      	bres	21083,#4
5891                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5893  0658 7b02          	ld	a,(OFST+0,sp)
5894  065a a40c          	and	a,#12
5895  065c 6b02          	ld	(OFST+0,sp),a
5897                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5899  065e 7b07          	ld	a,(OFST+5,sp)
5900  0660 97            	ld	xl,a
5901  0661 a610          	ld	a,#16
5902  0663 42            	mul	x,a
5903  0664 9f            	ld	a,xl
5904  0665 1a04          	or	a,(OFST+2,sp)
5905  0667 1a02          	or	a,(OFST+0,sp)
5906  0669 6b02          	ld	(OFST+0,sp),a
5908                     ; 2122   TIM2->CCMR2 = tmpccmr2;
5910  066b 7b02          	ld	a,(OFST+0,sp)
5911  066d c7525a        	ld	21082,a
5912                     ; 2125   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5914  0670 7b01          	ld	a,(OFST-1,sp)
5915  0672 a101          	cp	a,#1
5916  0674 2606          	jrne	L7303
5917                     ; 2127     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5919  0676 721a525b      	bset	21083,#5
5921  067a 2004          	jra	L1403
5922  067c               L7303:
5923                     ; 2131     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5925  067c 721b525b      	bres	21083,#5
5926  0680               L1403:
5927                     ; 2135   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5929  0680 7218525b      	bset	21083,#4
5930                     ; 2136 }
5933  0684 5b04          	addw	sp,#4
5934  0686 81            	ret
5947                     	xdef	_TIM2_SelectHallSensor
5948                     	xdef	_TIM2_EncoderInterfaceConfig
5949                     	xdef	_TIM2_ETRConfig
5950                     	xdef	_TIM2_SelectMasterSlaveMode
5951                     	xdef	_TIM2_SelectSlaveMode
5952                     	xdef	_TIM2_SelectOutputTrigger
5953                     	xdef	_TIM2_SelectInputTrigger
5954                     	xdef	_TIM2_ETRClockMode2Config
5955                     	xdef	_TIM2_ETRClockMode1Config
5956                     	xdef	_TIM2_TIxExternalClockConfig
5957                     	xdef	_TIM2_InternalClockConfig
5958                     	xdef	_TIM2_SelectCCDMA
5959                     	xdef	_TIM2_DMACmd
5960                     	xdef	_TIM2_ClearITPendingBit
5961                     	xdef	_TIM2_GetITStatus
5962                     	xdef	_TIM2_ClearFlag
5963                     	xdef	_TIM2_GetFlagStatus
5964                     	xdef	_TIM2_GenerateEvent
5965                     	xdef	_TIM2_ITConfig
5966                     	xdef	_TIM2_SetIC2Prescaler
5967                     	xdef	_TIM2_SetIC1Prescaler
5968                     	xdef	_TIM2_GetCapture2
5969                     	xdef	_TIM2_GetCapture1
5970                     	xdef	_TIM2_PWMIConfig
5971                     	xdef	_TIM2_ICInit
5972                     	xdef	_TIM2_CCxCmd
5973                     	xdef	_TIM2_OC2PolarityConfig
5974                     	xdef	_TIM2_OC1PolarityConfig
5975                     	xdef	_TIM2_OC2FastConfig
5976                     	xdef	_TIM2_OC1FastConfig
5977                     	xdef	_TIM2_OC2PreloadConfig
5978                     	xdef	_TIM2_OC1PreloadConfig
5979                     	xdef	_TIM2_ForcedOC2Config
5980                     	xdef	_TIM2_ForcedOC1Config
5981                     	xdef	_TIM2_SetCompare2
5982                     	xdef	_TIM2_SetCompare1
5983                     	xdef	_TIM2_SelectOCxM
5984                     	xdef	_TIM2_CtrlPWMOutputs
5985                     	xdef	_TIM2_BKRConfig
5986                     	xdef	_TIM2_OC2Init
5987                     	xdef	_TIM2_OC1Init
5988                     	xdef	_TIM2_Cmd
5989                     	xdef	_TIM2_SelectOnePulseMode
5990                     	xdef	_TIM2_ARRPreloadConfig
5991                     	xdef	_TIM2_UpdateRequestConfig
5992                     	xdef	_TIM2_UpdateDisableConfig
5993                     	xdef	_TIM2_GetPrescaler
5994                     	xdef	_TIM2_GetCounter
5995                     	xdef	_TIM2_SetAutoreload
5996                     	xdef	_TIM2_SetCounter
5997                     	xdef	_TIM2_CounterModeConfig
5998                     	xdef	_TIM2_PrescalerConfig
5999                     	xdef	_TIM2_TimeBaseInit
6000                     	xdef	_TIM2_DeInit
6019                     	end
