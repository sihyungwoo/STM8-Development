   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 130 void TIM4_DeInit(void)
  42                     ; 131 {
  44                     	switch	.text
  45  0000               _TIM4_DeInit:
  49                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  51  0000 725f52e0      	clr	21216
  52                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  54  0004 725f52e1      	clr	21217
  55                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  57  0008 725f52e2      	clr	21218
  58                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  60  000c 725f52e4      	clr	21220
  61                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  63  0010 725f52e7      	clr	21223
  64                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  66  0014 725f52e8      	clr	21224
  67                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  69  0018 35ff52e9      	mov	21225,#255
  70                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  72  001c 725f52e5      	clr	21221
  73                     ; 140 }
  76  0020 81            	ret
 244                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 244                     ; 166                        uint8_t TIM4_Period)
 244                     ; 167 {
 245                     	switch	.text
 246  0021               _TIM4_TimeBaseInit:
 250                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 252                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 254  0021 9f            	ld	a,xl
 255  0022 c752e9        	ld	21225,a
 256                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 258  0025 9e            	ld	a,xh
 259  0026 c752e8        	ld	21224,a
 260                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 262  0029 350152e6      	mov	21222,#1
 263                     ; 177 }
 266  002d 81            	ret
 334                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 334                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 334                     ; 207 {
 335                     	switch	.text
 336  002e               _TIM4_PrescalerConfig:
 340                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 342                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 344                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 346  002e 9e            	ld	a,xh
 347  002f c752e8        	ld	21224,a
 348                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 350  0032 9f            	ld	a,xl
 351  0033 a101          	cp	a,#1
 352  0035 2606          	jrne	L141
 353                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 355  0037 721052e6      	bset	21222,#0
 357  003b 2004          	jra	L341
 358  003d               L141:
 359                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 361  003d 721152e6      	bres	21222,#0
 362  0041               L341:
 363                     ; 224 }
 366  0041 81            	ret
 400                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 400                     ; 233 {
 401                     	switch	.text
 402  0042               _TIM4_SetCounter:
 406                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 408  0042 c752e7        	ld	21223,a
 409                     ; 236 }
 412  0045 81            	ret
 446                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 446                     ; 245 {
 447                     	switch	.text
 448  0046               _TIM4_SetAutoreload:
 452                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 454  0046 c752e9        	ld	21225,a
 455                     ; 248 }
 458  0049 81            	ret
 492                     ; 255 uint8_t TIM4_GetCounter(void)
 492                     ; 256 {
 493                     	switch	.text
 494  004a               _TIM4_GetCounter:
 496  004a 88            	push	a
 497       00000001      OFST:	set	1
 500                     ; 257   uint8_t tmpcntr = 0;
 502                     ; 258   tmpcntr = TIM4->CNTR;
 504  004b c652e7        	ld	a,21223
 505  004e 6b01          	ld	(OFST+0,sp),a
 507                     ; 260   return ((uint8_t)tmpcntr);
 509  0050 7b01          	ld	a,(OFST+0,sp)
 512  0052 5b01          	addw	sp,#1
 513  0054 81            	ret
 537                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 537                     ; 285 {
 538                     	switch	.text
 539  0055               _TIM4_GetPrescaler:
 543                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 545  0055 c652e8        	ld	a,21224
 548  0058 81            	ret
 604                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 604                     ; 297 {
 605                     	switch	.text
 606  0059               _TIM4_UpdateDisableConfig:
 610                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 612                     ; 302   if (NewState != DISABLE)
 614  0059 4d            	tnz	a
 615  005a 2706          	jreq	L552
 616                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 618  005c 721252e0      	bset	21216,#1
 620  0060 2004          	jra	L752
 621  0062               L552:
 622                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 624  0062 721352e0      	bres	21216,#1
 625  0066               L752:
 626                     ; 310 }
 629  0066 81            	ret
 687                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 687                     ; 321 {
 688                     	switch	.text
 689  0067               _TIM4_UpdateRequestConfig:
 693                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 695                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 697  0067 a101          	cp	a,#1
 698  0069 2606          	jrne	L703
 699                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 701  006b 721452e0      	bset	21216,#2
 703  006f 2004          	jra	L113
 704  0071               L703:
 705                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 707  0071 721552e0      	bres	21216,#2
 708  0075               L113:
 709                     ; 334 }
 712  0075 81            	ret
 748                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 748                     ; 343 {
 749                     	switch	.text
 750  0076               _TIM4_ARRPreloadConfig:
 754                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 756                     ; 348   if (NewState != DISABLE)
 758  0076 4d            	tnz	a
 759  0077 2706          	jreq	L133
 760                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 762  0079 721e52e0      	bset	21216,#7
 764  007d 2004          	jra	L333
 765  007f               L133:
 766                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 768  007f 721f52e0      	bres	21216,#7
 769  0083               L333:
 770                     ; 356 }
 773  0083 81            	ret
 830                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 830                     ; 367 {
 831                     	switch	.text
 832  0084               _TIM4_SelectOnePulseMode:
 836                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 838                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 840  0084 a101          	cp	a,#1
 841  0086 2606          	jrne	L363
 842                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 844  0088 721652e0      	bset	21216,#3
 846  008c 2004          	jra	L563
 847  008e               L363:
 848                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 850  008e 721752e0      	bres	21216,#3
 851  0092               L563:
 852                     ; 380 }
 855  0092 81            	ret
 890                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 890                     ; 389 {
 891                     	switch	.text
 892  0093               _TIM4_Cmd:
 896                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 898                     ; 394   if (NewState != DISABLE)
 900  0093 4d            	tnz	a
 901  0094 2706          	jreq	L504
 902                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 904  0096 721052e0      	bset	21216,#0
 906  009a 2004          	jra	L704
 907  009c               L504:
 908                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 910  009c 721152e0      	bres	21216,#0
 911  00a0               L704:
 912                     ; 402 }
 915  00a0 81            	ret
 980                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 980                     ; 431 {
 981                     	switch	.text
 982  00a1               _TIM4_ITConfig:
 984  00a1 89            	pushw	x
 985       00000000      OFST:	set	0
 988                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 990                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 992                     ; 436   if (NewState != DISABLE)
 994  00a2 9f            	ld	a,xl
 995  00a3 4d            	tnz	a
 996  00a4 2709          	jreq	L344
 997                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 999  00a6 9e            	ld	a,xh
1000  00a7 ca52e4        	or	a,21220
1001  00aa c752e4        	ld	21220,a
1003  00ad 2009          	jra	L544
1004  00af               L344:
1005                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1007  00af 7b01          	ld	a,(OFST+1,sp)
1008  00b1 43            	cpl	a
1009  00b2 c452e4        	and	a,21220
1010  00b5 c752e4        	ld	21220,a
1011  00b8               L544:
1012                     ; 446 }
1015  00b8 85            	popw	x
1016  00b9 81            	ret
1073                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1073                     ; 457 {
1074                     	switch	.text
1075  00ba               _TIM4_GenerateEvent:
1079                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1081                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1083  00ba ca52e6        	or	a,21222
1084  00bd c752e6        	ld	21222,a
1085                     ; 463 }
1088  00c0 81            	ret
1174                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1174                     ; 475 {
1175                     	switch	.text
1176  00c1               _TIM4_GetFlagStatus:
1178  00c1 88            	push	a
1179       00000001      OFST:	set	1
1182                     ; 476   FlagStatus bitstatus = RESET;
1184                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1186                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1188  00c2 c452e5        	and	a,21221
1189  00c5 2706          	jreq	L735
1190                     ; 483     bitstatus = SET;
1192  00c7 a601          	ld	a,#1
1193  00c9 6b01          	ld	(OFST+0,sp),a
1196  00cb 2002          	jra	L145
1197  00cd               L735:
1198                     ; 487     bitstatus = RESET;
1200  00cd 0f01          	clr	(OFST+0,sp)
1202  00cf               L145:
1203                     ; 489   return ((FlagStatus)bitstatus);
1205  00cf 7b01          	ld	a,(OFST+0,sp)
1208  00d1 5b01          	addw	sp,#1
1209  00d3 81            	ret
1244                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1244                     ; 501 {
1245                     	switch	.text
1246  00d4               _TIM4_ClearFlag:
1250                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1252                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1254  00d4 43            	cpl	a
1255  00d5 c752e5        	ld	21221,a
1256                     ; 506 }
1259  00d8 81            	ret
1323                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1323                     ; 519 {
1324                     	switch	.text
1325  00d9               _TIM4_GetITStatus:
1327  00d9 88            	push	a
1328  00da 89            	pushw	x
1329       00000002      OFST:	set	2
1332                     ; 520   ITStatus bitstatus = RESET;
1334                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1338                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1340                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1342  00db c452e5        	and	a,21221
1343  00de 6b01          	ld	(OFST-1,sp),a
1345                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1347  00e0 c652e4        	ld	a,21220
1348  00e3 1403          	and	a,(OFST+1,sp)
1349  00e5 6b02          	ld	(OFST+0,sp),a
1351                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1353  00e7 0d01          	tnz	(OFST-1,sp)
1354  00e9 270a          	jreq	L316
1356  00eb 0d02          	tnz	(OFST+0,sp)
1357  00ed 2706          	jreq	L316
1358                     ; 533     bitstatus = (ITStatus)SET;
1360  00ef a601          	ld	a,#1
1361  00f1 6b02          	ld	(OFST+0,sp),a
1364  00f3 2002          	jra	L516
1365  00f5               L316:
1366                     ; 537     bitstatus = (ITStatus)RESET;
1368  00f5 0f02          	clr	(OFST+0,sp)
1370  00f7               L516:
1371                     ; 539   return ((ITStatus)bitstatus);
1373  00f7 7b02          	ld	a,(OFST+0,sp)
1376  00f9 5b03          	addw	sp,#3
1377  00fb 81            	ret
1413                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1413                     ; 551 {
1414                     	switch	.text
1415  00fc               _TIM4_ClearITPendingBit:
1419                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1421                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1423  00fc 43            	cpl	a
1424  00fd c752e5        	ld	21221,a
1425                     ; 557 }
1428  0100 81            	ret
1487                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1487                     ; 569 {
1488                     	switch	.text
1489  0101               _TIM4_DMACmd:
1491  0101 89            	pushw	x
1492       00000000      OFST:	set	0
1495                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1497                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1499                     ; 574   if (NewState != DISABLE)
1501  0102 9f            	ld	a,xl
1502  0103 4d            	tnz	a
1503  0104 2709          	jreq	L566
1504                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1506  0106 9e            	ld	a,xh
1507  0107 ca52e3        	or	a,21219
1508  010a c752e3        	ld	21219,a
1510  010d 2009          	jra	L766
1511  010f               L566:
1512                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1514  010f 7b01          	ld	a,(OFST+1,sp)
1515  0111 43            	cpl	a
1516  0112 c452e3        	and	a,21219
1517  0115 c752e3        	ld	21219,a
1518  0118               L766:
1519                     ; 584 }
1522  0118 85            	popw	x
1523  0119 81            	ret
1547                     ; 607 void TIM4_InternalClockConfig(void)
1547                     ; 608 {
1548                     	switch	.text
1549  011a               _TIM4_InternalClockConfig:
1553                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1555  011a c652e2        	ld	a,21218
1556  011d a4f8          	and	a,#248
1557  011f c752e2        	ld	21218,a
1558                     ; 611 }
1561  0122 81            	ret
1645                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1645                     ; 652 {
1646                     	switch	.text
1647  0123               _TIM4_SelectInputTrigger:
1649  0123 88            	push	a
1650  0124 88            	push	a
1651       00000001      OFST:	set	1
1654                     ; 653   uint8_t tmpsmcr = 0;
1656                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1658                     ; 658   tmpsmcr = TIM4->SMCR;
1660  0125 c652e2        	ld	a,21218
1661  0128 6b01          	ld	(OFST+0,sp),a
1663                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1665  012a 7b01          	ld	a,(OFST+0,sp)
1666  012c a48f          	and	a,#143
1667  012e 6b01          	ld	(OFST+0,sp),a
1669                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1671  0130 7b01          	ld	a,(OFST+0,sp)
1672  0132 1a02          	or	a,(OFST+1,sp)
1673  0134 6b01          	ld	(OFST+0,sp),a
1675                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1677  0136 7b01          	ld	a,(OFST+0,sp)
1678  0138 c752e2        	ld	21218,a
1679                     ; 665 }
1682  013b 85            	popw	x
1683  013c 81            	ret
1758                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1758                     ; 677 {
1759                     	switch	.text
1760  013d               _TIM4_SelectOutputTrigger:
1762  013d 88            	push	a
1763  013e 88            	push	a
1764       00000001      OFST:	set	1
1767                     ; 678   uint8_t tmpcr2 = 0;
1769                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1771                     ; 683   tmpcr2 = TIM4->CR2;
1773  013f c652e1        	ld	a,21217
1774  0142 6b01          	ld	(OFST+0,sp),a
1776                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1778  0144 7b01          	ld	a,(OFST+0,sp)
1779  0146 a48f          	and	a,#143
1780  0148 6b01          	ld	(OFST+0,sp),a
1782                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1784  014a 7b01          	ld	a,(OFST+0,sp)
1785  014c 1a02          	or	a,(OFST+1,sp)
1786  014e 6b01          	ld	(OFST+0,sp),a
1788                     ; 691   TIM4->CR2 = tmpcr2;
1790  0150 7b01          	ld	a,(OFST+0,sp)
1791  0152 c752e1        	ld	21217,a
1792                     ; 692 }
1795  0155 85            	popw	x
1796  0156 81            	ret
1887                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1887                     ; 707 {
1888                     	switch	.text
1889  0157               _TIM4_SelectSlaveMode:
1891  0157 88            	push	a
1892  0158 88            	push	a
1893       00000001      OFST:	set	1
1896                     ; 708   uint8_t tmpsmcr = 0;
1898                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1900                     ; 713   tmpsmcr = TIM4->SMCR;
1902  0159 c652e2        	ld	a,21218
1903  015c 6b01          	ld	(OFST+0,sp),a
1905                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1907  015e 7b01          	ld	a,(OFST+0,sp)
1908  0160 a4f8          	and	a,#248
1909  0162 6b01          	ld	(OFST+0,sp),a
1911                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1913  0164 7b01          	ld	a,(OFST+0,sp)
1914  0166 1a02          	or	a,(OFST+1,sp)
1915  0168 6b01          	ld	(OFST+0,sp),a
1917                     ; 721   TIM4->SMCR = tmpsmcr;
1919  016a 7b01          	ld	a,(OFST+0,sp)
1920  016c c752e2        	ld	21218,a
1921                     ; 722 }
1924  016f 85            	popw	x
1925  0170 81            	ret
1961                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1961                     ; 731 {
1962                     	switch	.text
1963  0171               _TIM4_SelectMasterSlaveMode:
1967                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1969                     ; 736   if (NewState != DISABLE)
1971  0171 4d            	tnz	a
1972  0172 2706          	jreq	L1501
1973                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1975  0174 721e52e2      	bset	21218,#7
1977  0178 2004          	jra	L3501
1978  017a               L1501:
1979                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1981  017a 721f52e2      	bres	21218,#7
1982  017e               L3501:
1983                     ; 744 }
1986  017e 81            	ret
1999                     	xdef	_TIM4_SelectMasterSlaveMode
2000                     	xdef	_TIM4_SelectSlaveMode
2001                     	xdef	_TIM4_SelectOutputTrigger
2002                     	xdef	_TIM4_SelectInputTrigger
2003                     	xdef	_TIM4_InternalClockConfig
2004                     	xdef	_TIM4_DMACmd
2005                     	xdef	_TIM4_ClearITPendingBit
2006                     	xdef	_TIM4_GetITStatus
2007                     	xdef	_TIM4_ClearFlag
2008                     	xdef	_TIM4_GetFlagStatus
2009                     	xdef	_TIM4_GenerateEvent
2010                     	xdef	_TIM4_ITConfig
2011                     	xdef	_TIM4_Cmd
2012                     	xdef	_TIM4_SelectOnePulseMode
2013                     	xdef	_TIM4_ARRPreloadConfig
2014                     	xdef	_TIM4_UpdateRequestConfig
2015                     	xdef	_TIM4_UpdateDisableConfig
2016                     	xdef	_TIM4_GetPrescaler
2017                     	xdef	_TIM4_GetCounter
2018                     	xdef	_TIM4_SetAutoreload
2019                     	xdef	_TIM4_SetCounter
2020                     	xdef	_TIM4_PrescalerConfig
2021                     	xdef	_TIM4_TimeBaseInit
2022                     	xdef	_TIM4_DeInit
2041                     	end
