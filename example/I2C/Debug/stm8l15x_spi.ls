   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 135                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 135                     ; 129 {
 137                     	switch	.text
 138  0000               _SPI_DeInit:
 142                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 144  0000 7f            	clr	(x)
 145                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 147  0001 6f01          	clr	(1,x)
 148                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 150  0003 6f02          	clr	(2,x)
 151                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 153  0005 a602          	ld	a,#2
 154  0007 e703          	ld	(3,x),a
 155                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 157  0009 a607          	ld	a,#7
 158  000b e705          	ld	(5,x),a
 159                     ; 135 }
 162  000d 81            	ret
 488                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 488                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 488                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 488                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 488                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 488                     ; 182 {
 489                     	switch	.text
 490  000e               _SPI_Init:
 492  000e 89            	pushw	x
 493  000f 88            	push	a
 494       00000001      OFST:	set	1
 497                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 499                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 501                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 503                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 505                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 507                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 509                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 511                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 513                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 513                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 513                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 513                     ; 197                                   SPI_CPHA));
 515  0010 7b09          	ld	a,(OFST+8,sp)
 516  0012 1a0a          	or	a,(OFST+9,sp)
 517  0014 6b01          	ld	(OFST+0,sp),a
 519  0016 7b06          	ld	a,(OFST+5,sp)
 520  0018 1a07          	or	a,(OFST+6,sp)
 521  001a 1a01          	or	a,(OFST+0,sp)
 522  001c 1e02          	ldw	x,(OFST+1,sp)
 523  001e f7            	ld	(x),a
 524                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 526  001f 7b0b          	ld	a,(OFST+10,sp)
 527  0021 1a0c          	or	a,(OFST+11,sp)
 528  0023 1e02          	ldw	x,(OFST+1,sp)
 529  0025 e701          	ld	(1,x),a
 530                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 532  0027 7b08          	ld	a,(OFST+7,sp)
 533  0029 a104          	cp	a,#4
 534  002b 260a          	jrne	L562
 535                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 537  002d 1e02          	ldw	x,(OFST+1,sp)
 538  002f e601          	ld	a,(1,x)
 539  0031 aa01          	or	a,#1
 540  0033 e701          	ld	(1,x),a
 542  0035 2008          	jra	L762
 543  0037               L562:
 544                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 546  0037 1e02          	ldw	x,(OFST+1,sp)
 547  0039 e601          	ld	a,(1,x)
 548  003b a4fe          	and	a,#254
 549  003d e701          	ld	(1,x),a
 550  003f               L762:
 551                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 553  003f 1e02          	ldw	x,(OFST+1,sp)
 554  0041 f6            	ld	a,(x)
 555  0042 1a08          	or	a,(OFST+7,sp)
 556  0044 f7            	ld	(x),a
 557                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 559  0045 7b0d          	ld	a,(OFST+12,sp)
 560  0047 1e02          	ldw	x,(OFST+1,sp)
 561  0049 e705          	ld	(5,x),a
 562                     ; 216 }
 565  004b 5b03          	addw	sp,#3
 566  004d 81            	ret
 633                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 633                     ; 226 {
 634                     	switch	.text
 635  004e               _SPI_Cmd:
 637  004e 89            	pushw	x
 638       00000000      OFST:	set	0
 641                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 643                     ; 230   if (NewState != DISABLE)
 645  004f 0d05          	tnz	(OFST+5,sp)
 646  0051 2706          	jreq	L523
 647                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 649  0053 f6            	ld	a,(x)
 650  0054 aa40          	or	a,#64
 651  0056 f7            	ld	(x),a
 653  0057 2006          	jra	L723
 654  0059               L523:
 655                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 657  0059 1e01          	ldw	x,(OFST+1,sp)
 658  005b f6            	ld	a,(x)
 659  005c a4bf          	and	a,#191
 660  005e f7            	ld	(x),a
 661  005f               L723:
 662                     ; 238 }
 665  005f 85            	popw	x
 666  0060 81            	ret
 714                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 714                     ; 248 {
 715                     	switch	.text
 716  0061               _SPI_NSSInternalSoftwareCmd:
 718  0061 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 724                     ; 252   if (NewState != DISABLE)
 726  0062 0d05          	tnz	(OFST+5,sp)
 727  0064 2708          	jreq	L553
 728                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 730  0066 e601          	ld	a,(1,x)
 731  0068 aa01          	or	a,#1
 732  006a e701          	ld	(1,x),a
 734  006c 2008          	jra	L753
 735  006e               L553:
 736                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 738  006e 1e01          	ldw	x,(OFST+1,sp)
 739  0070 e601          	ld	a,(1,x)
 740  0072 a4fe          	and	a,#254
 741  0074 e701          	ld	(1,x),a
 742  0076               L753:
 743                     ; 260 }
 746  0076 85            	popw	x
 747  0077 81            	ret
 815                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 815                     ; 272 {
 816                     	switch	.text
 817  0078               _SPI_BiDirectionalLineConfig:
 819  0078 89            	pushw	x
 820       00000000      OFST:	set	0
 823                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 825                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 827  0079 0d05          	tnz	(OFST+5,sp)
 828  007b 2708          	jreq	L514
 829                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 831  007d e601          	ld	a,(1,x)
 832  007f aa40          	or	a,#64
 833  0081 e701          	ld	(1,x),a
 835  0083 2008          	jra	L714
 836  0085               L514:
 837                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 839  0085 1e01          	ldw	x,(OFST+1,sp)
 840  0087 e601          	ld	a,(1,x)
 841  0089 a4bf          	and	a,#191
 842  008b e701          	ld	(1,x),a
 843  008d               L714:
 844                     ; 284 }
 847  008d 85            	popw	x
 848  008e 81            	ret
 894                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 894                     ; 320 {
 895                     	switch	.text
 896  008f               _SPI_SendData:
 898  008f 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 904  0090 7b05          	ld	a,(OFST+5,sp)
 905  0092 1e01          	ldw	x,(OFST+1,sp)
 906  0094 e704          	ld	(4,x),a
 907                     ; 322 }
 910  0096 85            	popw	x
 911  0097 81            	ret
 948                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 948                     ; 330 {
 949                     	switch	.text
 950  0098               _SPI_ReceiveData:
 954                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 956  0098 e604          	ld	a,(4,x)
 959  009a 81            	ret
 996                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 996                     ; 415 {
 997                     	switch	.text
 998  009b               _SPI_TransmitCRC:
1002                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1004  009b e601          	ld	a,(1,x)
1005  009d aa10          	or	a,#16
1006  009f e701          	ld	(1,x),a
1007                     ; 417 }
1010  00a1 81            	ret
1059                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1059                     ; 427 {
1060                     	switch	.text
1061  00a2               _SPI_CalculateCRCCmd:
1063  00a2 89            	pushw	x
1064       00000000      OFST:	set	0
1067                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1069                     ; 432   SPI_Cmd(SPI1, DISABLE);
1071  00a3 4b00          	push	#0
1072  00a5 ae5200        	ldw	x,#20992
1073  00a8 ada4          	call	_SPI_Cmd
1075  00aa 84            	pop	a
1076                     ; 434   if (NewState != DISABLE)
1078  00ab 0d05          	tnz	(OFST+5,sp)
1079  00ad 270a          	jreq	L135
1080                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1082  00af 1e01          	ldw	x,(OFST+1,sp)
1083  00b1 e601          	ld	a,(1,x)
1084  00b3 aa20          	or	a,#32
1085  00b5 e701          	ld	(1,x),a
1087  00b7 2008          	jra	L335
1088  00b9               L135:
1089                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1091  00b9 1e01          	ldw	x,(OFST+1,sp)
1092  00bb e601          	ld	a,(1,x)
1093  00bd a4df          	and	a,#223
1094  00bf e701          	ld	(1,x),a
1095  00c1               L335:
1096                     ; 442 }
1099  00c1 85            	popw	x
1100  00c2 81            	ret
1176                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1176                     ; 454 {
1177                     	switch	.text
1178  00c3               _SPI_GetCRC:
1180  00c3 89            	pushw	x
1181  00c4 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 455   uint8_t crcreg = 0;
1187                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1189                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1191  00c5 0d06          	tnz	(OFST+5,sp)
1192  00c7 2706          	jreq	L575
1193                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1195  00c9 e607          	ld	a,(7,x)
1196  00cb 6b01          	ld	(OFST+0,sp),a
1199  00cd 2006          	jra	L775
1200  00cf               L575:
1201                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1203  00cf 1e02          	ldw	x,(OFST+1,sp)
1204  00d1 e606          	ld	a,(6,x)
1205  00d3 6b01          	ld	(OFST+0,sp),a
1207  00d5               L775:
1208                     ; 470   return crcreg;
1210  00d5 7b01          	ld	a,(OFST+0,sp)
1213  00d7 5b03          	addw	sp,#3
1214  00d9 81            	ret
1253                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1253                     ; 479 {
1254                     	switch	.text
1255  00da               _SPI_ResetCRC:
1257  00da 89            	pushw	x
1258       00000000      OFST:	set	0
1261                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1263  00db 4b01          	push	#1
1264  00dd adc3          	call	_SPI_CalculateCRCCmd
1266  00df 84            	pop	a
1267                     ; 485   SPI_Cmd(SPIx, ENABLE);
1269  00e0 4b01          	push	#1
1270  00e2 1e02          	ldw	x,(OFST+2,sp)
1271  00e4 cd004e        	call	_SPI_Cmd
1273  00e7 84            	pop	a
1274                     ; 486 }
1277  00e8 85            	popw	x
1278  00e9 81            	ret
1316                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1316                     ; 494 {
1317                     	switch	.text
1318  00ea               _SPI_GetCRCPolynomial:
1322                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1324  00ea e605          	ld	a,(5,x)
1327  00ec 81            	ret
1404                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1404                     ; 526 {
1405                     	switch	.text
1406  00ed               _SPI_DMACmd:
1408  00ed 89            	pushw	x
1409       00000000      OFST:	set	0
1412                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1414                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1416                     ; 531   if (NewState != DISABLE)
1418  00ee 0d06          	tnz	(OFST+6,sp)
1419  00f0 2708          	jreq	L107
1420                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1422  00f2 e602          	ld	a,(2,x)
1423  00f4 1a05          	or	a,(OFST+5,sp)
1424  00f6 e702          	ld	(2,x),a
1426  00f8 2009          	jra	L307
1427  00fa               L107:
1428                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1430  00fa 1e01          	ldw	x,(OFST+1,sp)
1431  00fc 7b05          	ld	a,(OFST+5,sp)
1432  00fe 43            	cpl	a
1433  00ff e402          	and	a,(2,x)
1434  0101 e702          	ld	(2,x),a
1435  0103               L307:
1436                     ; 541 }
1439  0103 85            	popw	x
1440  0104 81            	ret
1561                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1561                     ; 627 {
1562                     	switch	.text
1563  0105               _SPI_ITConfig:
1565  0105 89            	pushw	x
1566  0106 88            	push	a
1567       00000001      OFST:	set	1
1570                     ; 628   uint8_t itpos = 0;
1572                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1574                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1576                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1578  0107 7b06          	ld	a,(OFST+5,sp)
1579  0109 a40f          	and	a,#15
1580  010b 5f            	clrw	x
1581  010c 97            	ld	xl,a
1582  010d a601          	ld	a,#1
1583  010f 5d            	tnzw	x
1584  0110 2704          	jreq	L04
1585  0112               L24:
1586  0112 48            	sll	a
1587  0113 5a            	decw	x
1588  0114 26fc          	jrne	L24
1589  0116               L04:
1590  0116 6b01          	ld	(OFST+0,sp),a
1592                     ; 636   if (NewState != DISABLE)
1594  0118 0d07          	tnz	(OFST+6,sp)
1595  011a 270a          	jreq	L367
1596                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1598  011c 1e02          	ldw	x,(OFST+1,sp)
1599  011e e602          	ld	a,(2,x)
1600  0120 1a01          	or	a,(OFST+0,sp)
1601  0122 e702          	ld	(2,x),a
1603  0124 2009          	jra	L567
1604  0126               L367:
1605                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1607  0126 1e02          	ldw	x,(OFST+1,sp)
1608  0128 7b01          	ld	a,(OFST+0,sp)
1609  012a 43            	cpl	a
1610  012b e402          	and	a,(2,x)
1611  012d e702          	ld	(2,x),a
1612  012f               L567:
1613                     ; 644 }
1616  012f 5b03          	addw	sp,#3
1617  0131 81            	ret
1750                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1750                     ; 662 {
1751                     	switch	.text
1752  0132               _SPI_GetFlagStatus:
1754  0132 89            	pushw	x
1755  0133 88            	push	a
1756       00000001      OFST:	set	1
1759                     ; 663   FlagStatus status = RESET;
1761                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1763                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1765  0134 e603          	ld	a,(3,x)
1766  0136 1506          	bcp	a,(OFST+5,sp)
1767  0138 2706          	jreq	L1501
1768                     ; 670     status = SET; /* SPI_FLAG is set */
1770  013a a601          	ld	a,#1
1771  013c 6b01          	ld	(OFST+0,sp),a
1774  013e 2002          	jra	L3501
1775  0140               L1501:
1776                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1778  0140 0f01          	clr	(OFST+0,sp)
1780  0142               L3501:
1781                     ; 678   return status;
1783  0142 7b01          	ld	a,(OFST+0,sp)
1786  0144 5b03          	addw	sp,#3
1787  0146 81            	ret
1834                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1834                     ; 697 {
1835                     	switch	.text
1836  0147               _SPI_ClearFlag:
1838  0147 89            	pushw	x
1839       00000000      OFST:	set	0
1842                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1844                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1846  0148 7b05          	ld	a,(OFST+5,sp)
1847  014a 43            	cpl	a
1848  014b 1e01          	ldw	x,(OFST+1,sp)
1849  014d e703          	ld	(3,x),a
1850                     ; 701 }
1853  014f 85            	popw	x
1854  0150 81            	ret
1948                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1948                     ; 718 {
1949                     	switch	.text
1950  0151               _SPI_GetITStatus:
1952  0151 89            	pushw	x
1953  0152 5203          	subw	sp,#3
1954       00000003      OFST:	set	3
1957                     ; 719   ITStatus pendingbitstatus = RESET;
1959                     ; 720   uint8_t itpos = 0;
1961                     ; 721   uint8_t itmask1 = 0;
1963                     ; 722   uint8_t itmask2 = 0;
1965                     ; 723   __IO uint8_t enablestatus = 0;
1967  0154 0f02          	clr	(OFST-1,sp)
1969                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1971                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1973  0156 7b08          	ld	a,(OFST+5,sp)
1974  0158 a40f          	and	a,#15
1975  015a 5f            	clrw	x
1976  015b 97            	ld	xl,a
1977  015c a601          	ld	a,#1
1978  015e 5d            	tnzw	x
1979  015f 2704          	jreq	L25
1980  0161               L45:
1981  0161 48            	sll	a
1982  0162 5a            	decw	x
1983  0163 26fc          	jrne	L45
1984  0165               L25:
1985  0165 6b01          	ld	(OFST-2,sp),a
1987                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1989  0167 7b08          	ld	a,(OFST+5,sp)
1990  0169 4e            	swap	a
1991  016a a40f          	and	a,#15
1992  016c 6b03          	ld	(OFST+0,sp),a
1994                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1996  016e 7b03          	ld	a,(OFST+0,sp)
1997  0170 5f            	clrw	x
1998  0171 97            	ld	xl,a
1999  0172 a601          	ld	a,#1
2000  0174 5d            	tnzw	x
2001  0175 2704          	jreq	L65
2002  0177               L06:
2003  0177 48            	sll	a
2004  0178 5a            	decw	x
2005  0179 26fc          	jrne	L06
2006  017b               L65:
2007  017b 6b03          	ld	(OFST+0,sp),a
2009                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2011  017d 1e04          	ldw	x,(OFST+1,sp)
2012  017f e603          	ld	a,(3,x)
2013  0181 1403          	and	a,(OFST+0,sp)
2014  0183 6b02          	ld	(OFST-1,sp),a
2016                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2018  0185 1e04          	ldw	x,(OFST+1,sp)
2019  0187 e602          	ld	a,(2,x)
2020  0189 1501          	bcp	a,(OFST-2,sp)
2021  018b 270a          	jreq	L1511
2023  018d 0d02          	tnz	(OFST-1,sp)
2024  018f 2706          	jreq	L1511
2025                     ; 738     pendingbitstatus = SET;
2027  0191 a601          	ld	a,#1
2028  0193 6b03          	ld	(OFST+0,sp),a
2031  0195 2002          	jra	L3511
2032  0197               L1511:
2033                     ; 743     pendingbitstatus = RESET;
2035  0197 0f03          	clr	(OFST+0,sp)
2037  0199               L3511:
2038                     ; 746   return  pendingbitstatus;
2040  0199 7b03          	ld	a,(OFST+0,sp)
2043  019b 5b05          	addw	sp,#5
2044  019d 81            	ret
2101                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2101                     ; 765 {
2102                     	switch	.text
2103  019e               _SPI_ClearITPendingBit:
2105  019e 89            	pushw	x
2106  019f 88            	push	a
2107       00000001      OFST:	set	1
2110                     ; 766   uint8_t itpos = 0;
2112                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2114                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2116  01a0 7b06          	ld	a,(OFST+5,sp)
2117  01a2 a4f0          	and	a,#240
2118  01a4 4e            	swap	a
2119  01a5 a40f          	and	a,#15
2120  01a7 5f            	clrw	x
2121  01a8 97            	ld	xl,a
2122  01a9 a601          	ld	a,#1
2123  01ab 5d            	tnzw	x
2124  01ac 2704          	jreq	L46
2125  01ae               L66:
2126  01ae 48            	sll	a
2127  01af 5a            	decw	x
2128  01b0 26fc          	jrne	L66
2129  01b2               L46:
2130  01b2 6b01          	ld	(OFST+0,sp),a
2132                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2134  01b4 7b01          	ld	a,(OFST+0,sp)
2135  01b6 43            	cpl	a
2136  01b7 1e02          	ldw	x,(OFST+1,sp)
2137  01b9 e703          	ld	(3,x),a
2138                     ; 776 }
2141  01bb 5b03          	addw	sp,#3
2142  01bd 81            	ret
2155                     	xdef	_SPI_ClearITPendingBit
2156                     	xdef	_SPI_GetITStatus
2157                     	xdef	_SPI_ClearFlag
2158                     	xdef	_SPI_GetFlagStatus
2159                     	xdef	_SPI_ITConfig
2160                     	xdef	_SPI_DMACmd
2161                     	xdef	_SPI_GetCRCPolynomial
2162                     	xdef	_SPI_ResetCRC
2163                     	xdef	_SPI_GetCRC
2164                     	xdef	_SPI_CalculateCRCCmd
2165                     	xdef	_SPI_TransmitCRC
2166                     	xdef	_SPI_ReceiveData
2167                     	xdef	_SPI_SendData
2168                     	xdef	_SPI_BiDirectionalLineConfig
2169                     	xdef	_SPI_NSSInternalSoftwareCmd
2170                     	xdef	_SPI_Cmd
2171                     	xdef	_SPI_Init
2172                     	xdef	_SPI_DeInit
2191                     	end
