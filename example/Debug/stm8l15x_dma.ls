   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 140 void DMA_GlobalDeInit(void)
  42                     ; 141 {
  44                     	switch	.text
  45  0000               _DMA_GlobalDeInit:
  49                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  51  0000 72115070      	bres	20592,#0
  52                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  54  0004 35fc5070      	mov	20592,#252
  55                     ; 147 }
  58  0008 81            	ret
 174                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 174                     ; 156 {
 175                     	switch	.text
 176  0009               _DMA_DeInit:
 178  0009 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 184                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 186  000a f6            	ld	a,(x)
 187  000b a4fe          	and	a,#254
 188  000d f7            	ld	(x),a
 189                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 191  000e 7f            	clr	(x)
 192                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 194  000f 6f02          	clr	(2,x)
 195                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 197  0011 a35093        	cpw	x,#20627
 198  0014 2608          	jrne	L501
 199                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 201  0016 a640          	ld	a,#64
 202  0018 e703          	ld	(3,x),a
 203                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 205  001a 6f05          	clr	(5,x)
 207  001c 2006          	jra	L701
 208  001e               L501:
 209                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 211  001e 1e01          	ldw	x,(OFST+1,sp)
 212  0020 a652          	ld	a,#82
 213  0022 e703          	ld	(3,x),a
 214  0024               L701:
 215                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 217  0024 1e01          	ldw	x,(OFST+1,sp)
 218  0026 6f04          	clr	(4,x)
 219                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 221  0028 1e01          	ldw	x,(OFST+1,sp)
 222  002a 6f06          	clr	(6,x)
 223                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 225  002c 1e01          	ldw	x,(OFST+1,sp)
 226  002e 6f07          	clr	(7,x)
 227                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 229  0030 1e01          	ldw	x,(OFST+1,sp)
 230  0032 6f01          	clr	(1,x)
 231                     ; 187 }
 234  0034 85            	popw	x
 235  0035 81            	ret
 481                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 481                     ; 225               uint32_t DMA_Memory0BaseAddr,
 481                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 481                     ; 227               uint8_t DMA_BufferSize,
 481                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 481                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 481                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 481                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 481                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 481                     ; 233 {
 482                     	switch	.text
 483  0036               _DMA_Init:
 485  0036 89            	pushw	x
 486       00000000      OFST:	set	0
 489                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 491                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 493                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 495                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 497                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 499                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 501                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 503  0037 f6            	ld	a,(x)
 504  0038 a4fe          	and	a,#254
 505  003a f7            	ld	(x),a
 506                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 508  003b 7f            	clr	(x)
 509                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 509                     ; 251                                            (uint8_t)DMA_Mode) | \
 509                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 511  003c 7b0c          	ld	a,(OFST+12,sp)
 512  003e 1a0d          	or	a,(OFST+13,sp)
 513  0040 1a0e          	or	a,(OFST+14,sp)
 514  0042 fa            	or	a,(x)
 515  0043 f7            	ld	(x),a
 516                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 518  0044 e601          	ld	a,(1,x)
 519  0046 a4c7          	and	a,#199
 520  0048 e701          	ld	(1,x),a
 521                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 521                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 523  004a 7b0f          	ld	a,(OFST+15,sp)
 524  004c 1a10          	or	a,(OFST+16,sp)
 525  004e ea01          	or	a,(1,x)
 526  0050 e701          	ld	(1,x),a
 527                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 529  0052 7b0b          	ld	a,(OFST+11,sp)
 530  0054 1e01          	ldw	x,(OFST+1,sp)
 531  0056 e702          	ld	(2,x),a
 532                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 534  0058 7b09          	ld	a,(OFST+9,sp)
 535  005a 1e01          	ldw	x,(OFST+1,sp)
 536  005c e703          	ld	(3,x),a
 537                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 539  005e 7b0a          	ld	a,(OFST+10,sp)
 540  0060 1e01          	ldw	x,(OFST+1,sp)
 541  0062 e704          	ld	(4,x),a
 542                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 544  0064 1e01          	ldw	x,(OFST+1,sp)
 545  0066 a35093        	cpw	x,#20627
 546  0069 2606          	jrne	L742
 547                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 549  006b 7b06          	ld	a,(OFST+6,sp)
 550  006d 1e01          	ldw	x,(OFST+1,sp)
 551  006f e705          	ld	(5,x),a
 552  0071               L742:
 553                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 555  0071 7b07          	ld	a,(OFST+7,sp)
 556  0073 1e01          	ldw	x,(OFST+1,sp)
 557  0075 e706          	ld	(6,x),a
 558                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 560  0077 7b08          	ld	a,(OFST+8,sp)
 561  0079 1e01          	ldw	x,(OFST+1,sp)
 562  007b e707          	ld	(7,x),a
 563                     ; 280 }
 566  007d 85            	popw	x
 567  007e 81            	ret
 622                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 622                     ; 289 {
 623                     	switch	.text
 624  007f               _DMA_GlobalCmd:
 628                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 630                     ; 293   if (NewState != DISABLE)
 632  007f 4d            	tnz	a
 633  0080 2706          	jreq	L772
 634                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 636  0082 72105070      	bset	20592,#0
 638  0086 2004          	jra	L103
 639  0088               L772:
 640                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 642  0088 72115070      	bres	20592,#0
 643  008c               L103:
 644                     ; 303 }
 647  008c 81            	ret
 694                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 694                     ; 315 {
 695                     	switch	.text
 696  008d               _DMA_Cmd:
 698  008d 89            	pushw	x
 699       00000000      OFST:	set	0
 702                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 704                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 706                     ; 320   if (NewState != DISABLE)
 708  008e 0d05          	tnz	(OFST+5,sp)
 709  0090 2706          	jreq	L723
 710                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 712  0092 f6            	ld	a,(x)
 713  0093 aa01          	or	a,#1
 714  0095 f7            	ld	(x),a
 716  0096 2006          	jra	L133
 717  0098               L723:
 718                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 720  0098 1e01          	ldw	x,(OFST+1,sp)
 721  009a f6            	ld	a,(x)
 722  009b a4fe          	and	a,#254
 723  009d f7            	ld	(x),a
 724  009e               L133:
 725                     ; 330 }
 728  009e 85            	popw	x
 729  009f 81            	ret
 763                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 763                     ; 343 {
 764                     	switch	.text
 765  00a0               _DMA_SetTimeOut:
 769                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 771                     ; 348   DMA1->GCSR = 0;
 773  00a0 725f5070      	clr	20592
 774                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 776  00a4 48            	sll	a
 777  00a5 48            	sll	a
 778  00a6 c75070        	ld	20592,a
 779                     ; 351 }
 782  00a9 81            	ret
 829                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 829                     ; 402 {
 830                     	switch	.text
 831  00aa               _DMA_SetCurrDataCounter:
 833  00aa 89            	pushw	x
 834       00000000      OFST:	set	0
 837                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 839                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 841  00ab 7b05          	ld	a,(OFST+5,sp)
 842  00ad 1e01          	ldw	x,(OFST+1,sp)
 843  00af e702          	ld	(2,x),a
 844                     ; 408 }
 847  00b1 85            	popw	x
 848  00b2 81            	ret
 886                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 886                     ; 416 {
 887                     	switch	.text
 888  00b3               _DMA_GetCurrDataCounter:
 892                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 894                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 896  00b3 e602          	ld	a,(2,x)
 899  00b5 81            	ret
 976                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 976                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 976                     ; 484                   FunctionalState NewState)
 976                     ; 485 {
 977                     	switch	.text
 978  00b6               _DMA_ITConfig:
 980  00b6 89            	pushw	x
 981       00000000      OFST:	set	0
 984                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 986                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 988                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 990                     ; 491   if (NewState != DISABLE)
 992  00b7 0d06          	tnz	(OFST+6,sp)
 993  00b9 2706          	jreq	L554
 994                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 996  00bb f6            	ld	a,(x)
 997  00bc 1a05          	or	a,(OFST+5,sp)
 998  00be f7            	ld	(x),a
1000  00bf 2007          	jra	L754
1001  00c1               L554:
1002                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1004  00c1 1e01          	ldw	x,(OFST+1,sp)
1005  00c3 7b05          	ld	a,(OFST+5,sp)
1006  00c5 43            	cpl	a
1007  00c6 f4            	and	a,(x)
1008  00c7 f7            	ld	(x),a
1009  00c8               L754:
1010                     ; 501 }
1013  00c8 85            	popw	x
1014  00c9 81            	ret
1263                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1263                     ; 531 {
1264                     	switch	.text
1265  00ca               _DMA_GetFlagStatus:
1267  00ca 89            	pushw	x
1268  00cb 5204          	subw	sp,#4
1269       00000004      OFST:	set	4
1272                     ; 532   FlagStatus flagstatus = RESET;
1274                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1276                     ; 534   uint8_t tmpgir1 = 0;
1278                     ; 535   uint8_t tmpgcsr = 0;
1280                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1282                     ; 541   tmpgcsr = DMA1->GCSR;
1284  00cd c65070        	ld	a,20592
1285  00d0 6b04          	ld	(OFST+0,sp),a
1287                     ; 542   tmpgir1 = DMA1->GIR1;
1289  00d2 c65071        	ld	a,20593
1290  00d5 6b01          	ld	(OFST-3,sp),a
1292                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1294  00d7 01            	rrwa	x,a
1295  00d8 9f            	ld	a,xl
1296  00d9 a40f          	and	a,#15
1297  00db 97            	ld	xl,a
1298  00dc 4f            	clr	a
1299  00dd 02            	rlwa	x,a
1300  00de 5d            	tnzw	x
1301  00df 2736          	jreq	L706
1302                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1304  00e1 7b05          	ld	a,(OFST+1,sp)
1305  00e3 a501          	bcp	a,#1
1306  00e5 2707          	jreq	L116
1307                     ; 549       DMA_Channelx = DMA1_Channel0;
1309  00e7 ae5075        	ldw	x,#20597
1310  00ea 1f02          	ldw	(OFST-2,sp),x
1313  00ec 201f          	jra	L316
1314  00ee               L116:
1315                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1317  00ee 7b05          	ld	a,(OFST+1,sp)
1318  00f0 a502          	bcp	a,#2
1319  00f2 2707          	jreq	L516
1320                     ; 553       DMA_Channelx = DMA1_Channel1;
1322  00f4 ae507f        	ldw	x,#20607
1323  00f7 1f02          	ldw	(OFST-2,sp),x
1326  00f9 2012          	jra	L316
1327  00fb               L516:
1328                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1330  00fb 7b05          	ld	a,(OFST+1,sp)
1331  00fd a504          	bcp	a,#4
1332  00ff 2707          	jreq	L126
1333                     ; 557       DMA_Channelx = DMA1_Channel2;
1335  0101 ae5089        	ldw	x,#20617
1336  0104 1f02          	ldw	(OFST-2,sp),x
1339  0106 2005          	jra	L316
1340  0108               L126:
1341                     ; 561       DMA_Channelx = DMA1_Channel3;
1343  0108 ae5093        	ldw	x,#20627
1344  010b 1f02          	ldw	(OFST-2,sp),x
1346  010d               L316:
1347                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1349  010d 1e02          	ldw	x,(OFST-2,sp)
1350  010f e601          	ld	a,(1,x)
1351  0111 1406          	and	a,(OFST+2,sp)
1352  0113 6b04          	ld	(OFST+0,sp),a
1355  0115 2014          	jra	L526
1356  0117               L706:
1357                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1359  0117 7b05          	ld	a,(OFST+1,sp)
1360  0119 a510          	bcp	a,#16
1361  011b 2708          	jreq	L726
1362                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1364  011d 7b06          	ld	a,(OFST+2,sp)
1365  011f 1401          	and	a,(OFST-3,sp)
1366  0121 6b04          	ld	(OFST+0,sp),a
1369  0123 2006          	jra	L526
1370  0125               L726:
1371                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1373  0125 7b04          	ld	a,(OFST+0,sp)
1374  0127 a402          	and	a,#2
1375  0129 6b04          	ld	(OFST+0,sp),a
1377  012b               L526:
1378                     ; 579   return (flagstatus);
1380  012b 7b04          	ld	a,(OFST+0,sp)
1383  012d 5b06          	addw	sp,#6
1384  012f 81            	ret
1431                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1431                     ; 598 {
1432                     	switch	.text
1433  0130               _DMA_ClearFlag:
1435  0130 89            	pushw	x
1436  0131 89            	pushw	x
1437       00000002      OFST:	set	2
1440                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1442                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1444                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1446  0132 01            	rrwa	x,a
1447  0133 9f            	ld	a,xl
1448  0134 a401          	and	a,#1
1449  0136 97            	ld	xl,a
1450  0137 4f            	clr	a
1451  0138 02            	rlwa	x,a
1452  0139 5d            	tnzw	x
1453  013a 2707          	jreq	L756
1454                     ; 607     DMA_Channelx = DMA1_Channel0;
1456  013c ae5075        	ldw	x,#20597
1457  013f 1f01          	ldw	(OFST-1,sp),x
1460  0141 201f          	jra	L166
1461  0143               L756:
1462                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1464  0143 7b03          	ld	a,(OFST+1,sp)
1465  0145 a502          	bcp	a,#2
1466  0147 2707          	jreq	L366
1467                     ; 613       DMA_Channelx = DMA1_Channel1;
1469  0149 ae507f        	ldw	x,#20607
1470  014c 1f01          	ldw	(OFST-1,sp),x
1473  014e 2012          	jra	L166
1474  0150               L366:
1475                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1477  0150 7b03          	ld	a,(OFST+1,sp)
1478  0152 a504          	bcp	a,#4
1479  0154 2707          	jreq	L766
1480                     ; 619         DMA_Channelx = DMA1_Channel2;
1482  0156 ae5089        	ldw	x,#20617
1483  0159 1f01          	ldw	(OFST-1,sp),x
1486  015b 2005          	jra	L166
1487  015d               L766:
1488                     ; 623         DMA_Channelx = DMA1_Channel3;
1490  015d ae5093        	ldw	x,#20627
1491  0160 1f01          	ldw	(OFST-1,sp),x
1493  0162               L166:
1494                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1496  0162 1e01          	ldw	x,(OFST-1,sp)
1497  0164 7b04          	ld	a,(OFST+2,sp)
1498  0166 a406          	and	a,#6
1499  0168 43            	cpl	a
1500  0169 e401          	and	a,(1,x)
1501  016b e701          	ld	(1,x),a
1502                     ; 630 }
1505  016d 5b04          	addw	sp,#4
1506  016f 81            	ret
1644                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1644                     ; 647 {
1645                     	switch	.text
1646  0170               _DMA_GetITStatus:
1648  0170 88            	push	a
1649  0171 5204          	subw	sp,#4
1650       00000004      OFST:	set	4
1653                     ; 648   ITStatus itstatus = RESET;
1655                     ; 649   uint8_t tmpreg = 0;
1657                     ; 650   uint8_t tmp2 = 0;
1659                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1661                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1663                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1665  0173 a510          	bcp	a,#16
1666  0175 2707          	jreq	L757
1667                     ; 659     DMA_Channelx = DMA1_Channel0;
1669  0177 ae5075        	ldw	x,#20597
1670  017a 1f03          	ldw	(OFST-1,sp),x
1673  017c 201f          	jra	L167
1674  017e               L757:
1675                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1677  017e 7b05          	ld	a,(OFST+1,sp)
1678  0180 a520          	bcp	a,#32
1679  0182 2707          	jreq	L367
1680                     ; 665       DMA_Channelx = DMA1_Channel1;
1682  0184 ae507f        	ldw	x,#20607
1683  0187 1f03          	ldw	(OFST-1,sp),x
1686  0189 2012          	jra	L167
1687  018b               L367:
1688                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1690  018b 7b05          	ld	a,(OFST+1,sp)
1691  018d a540          	bcp	a,#64
1692  018f 2707          	jreq	L767
1693                     ; 671         DMA_Channelx = DMA1_Channel2;
1695  0191 ae5089        	ldw	x,#20617
1696  0194 1f03          	ldw	(OFST-1,sp),x
1699  0196 2005          	jra	L167
1700  0198               L767:
1701                     ; 675         DMA_Channelx = DMA1_Channel3;
1703  0198 ae5093        	ldw	x,#20627
1704  019b 1f03          	ldw	(OFST-1,sp),x
1706  019d               L167:
1707                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1709  019d 1e03          	ldw	x,(OFST-1,sp)
1710  019f e601          	ld	a,(1,x)
1711  01a1 6b01          	ld	(OFST-3,sp),a
1713                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1715  01a3 1e03          	ldw	x,(OFST-1,sp)
1716  01a5 7b01          	ld	a,(OFST-3,sp)
1717  01a7 f4            	and	a,(x)
1718  01a8 6b01          	ld	(OFST-3,sp),a
1720                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1722  01aa 7b05          	ld	a,(OFST+1,sp)
1723  01ac a406          	and	a,#6
1724  01ae 6b02          	ld	(OFST-2,sp),a
1726                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1728  01b0 7b01          	ld	a,(OFST-3,sp)
1729  01b2 1402          	and	a,(OFST-2,sp)
1730  01b4 6b02          	ld	(OFST-2,sp),a
1732                     ; 686   return (itstatus);
1734  01b6 7b02          	ld	a,(OFST-2,sp)
1737  01b8 5b05          	addw	sp,#5
1738  01ba 81            	ret
1786                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1786                     ; 705 {
1787                     	switch	.text
1788  01bb               _DMA_ClearITPendingBit:
1790  01bb 88            	push	a
1791  01bc 89            	pushw	x
1792       00000002      OFST:	set	2
1795                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1797                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1799                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1801  01bd a510          	bcp	a,#16
1802  01bf 2707          	jreq	L7101
1803                     ; 713     DMA_Channelx = DMA1_Channel0;
1805  01c1 ae5075        	ldw	x,#20597
1806  01c4 1f01          	ldw	(OFST-1,sp),x
1809  01c6 201f          	jra	L1201
1810  01c8               L7101:
1811                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1813  01c8 7b03          	ld	a,(OFST+1,sp)
1814  01ca a520          	bcp	a,#32
1815  01cc 2707          	jreq	L3201
1816                     ; 719       DMA_Channelx = DMA1_Channel1;
1818  01ce ae507f        	ldw	x,#20607
1819  01d1 1f01          	ldw	(OFST-1,sp),x
1822  01d3 2012          	jra	L1201
1823  01d5               L3201:
1824                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1826  01d5 7b03          	ld	a,(OFST+1,sp)
1827  01d7 a540          	bcp	a,#64
1828  01d9 2707          	jreq	L7201
1829                     ; 725         DMA_Channelx = DMA1_Channel2;
1831  01db ae5089        	ldw	x,#20617
1832  01de 1f01          	ldw	(OFST-1,sp),x
1835  01e0 2005          	jra	L1201
1836  01e2               L7201:
1837                     ; 729         DMA_Channelx = DMA1_Channel3;
1839  01e2 ae5093        	ldw	x,#20627
1840  01e5 1f01          	ldw	(OFST-1,sp),x
1842  01e7               L1201:
1843                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1845  01e7 1e01          	ldw	x,(OFST-1,sp)
1846  01e9 7b03          	ld	a,(OFST+1,sp)
1847  01eb a406          	and	a,#6
1848  01ed 43            	cpl	a
1849  01ee e401          	and	a,(1,x)
1850  01f0 e701          	ld	(1,x),a
1851                     ; 735 }
1854  01f2 5b03          	addw	sp,#3
1855  01f4 81            	ret
1868                     	xdef	_DMA_ClearITPendingBit
1869                     	xdef	_DMA_GetITStatus
1870                     	xdef	_DMA_ClearFlag
1871                     	xdef	_DMA_GetFlagStatus
1872                     	xdef	_DMA_ITConfig
1873                     	xdef	_DMA_GetCurrDataCounter
1874                     	xdef	_DMA_SetCurrDataCounter
1875                     	xdef	_DMA_SetTimeOut
1876                     	xdef	_DMA_Cmd
1877                     	xdef	_DMA_GlobalCmd
1878                     	xdef	_DMA_Init
1879                     	xdef	_DMA_DeInit
1880                     	xdef	_DMA_GlobalDeInit
1899                     	end
