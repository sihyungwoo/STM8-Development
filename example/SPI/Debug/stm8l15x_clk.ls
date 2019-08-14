   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  14                     .const:	section	.text
  15  0000               _SYSDivFactor:
  16  0000 01            	dc.b	1
  17  0001 02            	dc.b	2
  18  0002 04            	dc.b	4
  19  0003 08            	dc.b	8
  20  0004 10            	dc.b	16
  49                     ; 120 void CLK_DeInit(void)
  49                     ; 121 {
  51                     	switch	.text
  52  0000               _CLK_DeInit:
  56                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  58  0000 351150c2      	mov	20674,#17
  59                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  61  0004 725f50c6      	clr	20678
  62                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  64  0008 725f50c1      	clr	20673
  65                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  67  000c 725f50cb      	clr	20683
  68                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  70  0010 350150c8      	mov	20680,#1
  71                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  73  0014 725f50c9      	clr	20681
  74                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  76  0018 350350c0      	mov	20672,#3
  77                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  79  001c 725f50c3      	clr	20675
  80                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  82  0020 358050c4      	mov	20676,#128
  83                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  85  0024 725f50d0      	clr	20688
  86                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  88  0028 725f50ca      	clr	20682
  89                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  002c 725f50c5      	clr	20677
  92                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  94  0030 725f50cd      	clr	20685
  95                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  97  0034 725f50cc      	clr	20684
  98                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 100  0038 725f50ce      	clr	20686
 101                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 103  003c 35b950cf      	mov	20687,#185
 104                     ; 138 }
 107  0040 81            	ret
 162                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 162                     ; 161 {
 163                     	switch	.text
 164  0041               _CLK_HSICmd:
 168                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 165   if (NewState != DISABLE)
 172  0041 4d            	tnz	a
 173  0042 2706          	jreq	L74
 174                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 176  0044 721050c2      	bset	20674,#0
 178  0048 2004          	jra	L15
 179  004a               L74:
 180                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 182  004a 721150c2      	bres	20674,#0
 183  004e               L15:
 184                     ; 175 }
 187  004e 81            	ret
 223                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 223                     ; 189 {
 224                     	switch	.text
 225  004f               _CLK_AdjustHSICalibrationValue:
 229                     ; 191   CLK->HSIUNLCKR = 0xAC;
 231  004f 35ac50ce      	mov	20686,#172
 232                     ; 192   CLK->HSIUNLCKR = 0x35;
 234  0053 353550ce      	mov	20686,#53
 235                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 237  0057 c750cd        	ld	20685,a
 238                     ; 196 }
 241  005a 81            	ret
 276                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 276                     ; 213 {
 277                     	switch	.text
 278  005b               _CLK_LSICmd:
 282                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 284                     ; 218   if (NewState != DISABLE)
 286  005b 4d            	tnz	a
 287  005c 2706          	jreq	L701
 288                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 290  005e 721450c2      	bset	20674,#2
 292  0062 2004          	jra	L111
 293  0064               L701:
 294                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 296  0064 721550c2      	bres	20674,#2
 297  0068               L111:
 298                     ; 228 }
 301  0068 81            	ret
 363                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 363                     ; 250 {
 364                     	switch	.text
 365  0069               _CLK_HSEConfig:
 369                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 371                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 373  0069 721150c6      	bres	20678,#0
 374                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 376  006d 721950c6      	bres	20678,#4
 377                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 379  0071 ca50c6        	or	a,20678
 380  0074 c750c6        	ld	20678,a
 381                     ; 263 }
 384  0077 81            	ret
 446                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 446                     ; 281 {
 447                     	switch	.text
 448  0078               _CLK_LSEConfig:
 452                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 454                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 456  0078 721550c6      	bres	20678,#2
 457                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 459  007c 721b50c6      	bres	20678,#5
 460                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 462  0080 ca50c6        	or	a,20678
 463  0083 c750c6        	ld	20678,a
 464                     ; 295 }
 467  0086 81            	ret
 491                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 491                     ; 307 {
 492                     	switch	.text
 493  0087               _CLK_ClockSecuritySystemEnable:
 497                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 499  0087 721050ca      	bset	20682,#0
 500                     ; 310 }
 503  008b 81            	ret
 539                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 539                     ; 318 {
 540                     	switch	.text
 541  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 545                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 547                     ; 322   if (NewState != DISABLE)
 549  008c 4d            	tnz	a
 550  008d 2706          	jreq	L122
 551                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 553  008f 721850ca      	bset	20682,#4
 555  0093 2004          	jra	L322
 556  0095               L122:
 557                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 559  0095 721950ca      	bres	20682,#4
 560  0099               L322:
 561                     ; 332 }
 564  0099 81            	ret
 705                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 705                     ; 357 {
 706                     	switch	.text
 707  009a               _CLK_CCOConfig:
 709  009a 89            	pushw	x
 710       00000000      OFST:	set	0
 713                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 715                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 717                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 719  009b 9f            	ld	a,xl
 720  009c 1a01          	or	a,(OFST+1,sp)
 721  009e c750c5        	ld	20677,a
 722                     ; 364 }
 725  00a1 85            	popw	x
 726  00a2 81            	ret
 800                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 800                     ; 417 {
 801                     	switch	.text
 802  00a3               _CLK_SYSCLKSourceConfig:
 806                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 808                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 810  00a3 c750c8        	ld	20680,a
 811                     ; 423 }
 814  00a6 81            	ret
 839                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 839                     ; 436 {
 840                     	switch	.text
 841  00a7               _CLK_GetSYSCLKSource:
 845                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 847  00a7 c650c7        	ld	a,20679
 850  00aa 81            	ret
 922                     ; 478 uint32_t CLK_GetClockFreq(void)
 922                     ; 479 {
 923                     	switch	.text
 924  00ab               _CLK_GetClockFreq:
 926  00ab 5209          	subw	sp,#9
 927       00000009      OFST:	set	9
 930                     ; 480   uint32_t clockfrequency = 0;
 932                     ; 481   uint32_t sourcefrequency = 0;
 934  00ad ae0000        	ldw	x,#0
 935  00b0 1f07          	ldw	(OFST-2,sp),x
 936  00b2 ae0000        	ldw	x,#0
 937  00b5 1f05          	ldw	(OFST-4,sp),x
 939                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 941                     ; 483   uint8_t tmp = 0, presc = 0;
 945                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 947  00b7 c650c7        	ld	a,20679
 948  00ba 6b09          	ld	(OFST+0,sp),a
 950                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 952  00bc 7b09          	ld	a,(OFST+0,sp)
 953  00be a101          	cp	a,#1
 954  00c0 260c          	jrne	L704
 955                     ; 490     sourcefrequency = HSI_VALUE;
 957  00c2 ae2400        	ldw	x,#9216
 958  00c5 1f07          	ldw	(OFST-2,sp),x
 959  00c7 ae00f4        	ldw	x,#244
 960  00ca 1f05          	ldw	(OFST-4,sp),x
 963  00cc 2022          	jra	L114
 964  00ce               L704:
 965                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 967  00ce 7b09          	ld	a,(OFST+0,sp)
 968  00d0 a102          	cp	a,#2
 969  00d2 260c          	jrne	L314
 970                     ; 494     sourcefrequency = LSI_VALUE;
 972  00d4 ae9470        	ldw	x,#38000
 973  00d7 1f07          	ldw	(OFST-2,sp),x
 974  00d9 ae0000        	ldw	x,#0
 975  00dc 1f05          	ldw	(OFST-4,sp),x
 978  00de 2010          	jra	L114
 979  00e0               L314:
 980                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 982  00e0 7b09          	ld	a,(OFST+0,sp)
 983  00e2 a104          	cp	a,#4
 984  00e4 260a          	jrne	L714
 985                     ; 498     sourcefrequency = HSE_VALUE;
 987  00e6 ae2400        	ldw	x,#9216
 988  00e9 1f07          	ldw	(OFST-2,sp),x
 989  00eb ae00f4        	ldw	x,#244
 990  00ee 1f05          	ldw	(OFST-4,sp),x
 993  00f0               L714:
 994                     ; 502     clockfrequency = LSE_VALUE;
 996  00f0               L114:
 997                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 999  00f0 c650c0        	ld	a,20672
1000  00f3 a407          	and	a,#7
1001  00f5 6b09          	ld	(OFST+0,sp),a
1003                     ; 507   presc = SYSDivFactor[tmp];
1005  00f7 7b09          	ld	a,(OFST+0,sp)
1006  00f9 5f            	clrw	x
1007  00fa 97            	ld	xl,a
1008  00fb d60000        	ld	a,(_SYSDivFactor,x)
1009  00fe 6b09          	ld	(OFST+0,sp),a
1011                     ; 510   clockfrequency = sourcefrequency / presc;
1013  0100 7b09          	ld	a,(OFST+0,sp)
1014  0102 b703          	ld	c_lreg+3,a
1015  0104 3f02          	clr	c_lreg+2
1016  0106 3f01          	clr	c_lreg+1
1017  0108 3f00          	clr	c_lreg
1018  010a 96            	ldw	x,sp
1019  010b 1c0001        	addw	x,#OFST-8
1020  010e cd0000        	call	c_rtol
1023  0111 96            	ldw	x,sp
1024  0112 1c0005        	addw	x,#OFST-4
1025  0115 cd0000        	call	c_ltor
1027  0118 96            	ldw	x,sp
1028  0119 1c0001        	addw	x,#OFST-8
1029  011c cd0000        	call	c_ludv
1031  011f 96            	ldw	x,sp
1032  0120 1c0005        	addw	x,#OFST-4
1033  0123 cd0000        	call	c_rtol
1036                     ; 512   return((uint32_t)clockfrequency);
1038  0126 96            	ldw	x,sp
1039  0127 1c0005        	addw	x,#OFST-4
1040  012a cd0000        	call	c_ltor
1044  012d 5b09          	addw	sp,#9
1045  012f 81            	ret
1143                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1143                     ; 529 {
1144                     	switch	.text
1145  0130               _CLK_SYSCLKDivConfig:
1149                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1151                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1153  0130 c750c0        	ld	20672,a
1154                     ; 534 }
1157  0133 81            	ret
1193                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1193                     ; 542 {
1194                     	switch	.text
1195  0134               _CLK_SYSCLKSourceSwitchCmd:
1199                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1201                     ; 546   if (NewState != DISABLE)
1203  0134 4d            	tnz	a
1204  0135 2706          	jreq	L305
1205                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1207  0137 721250c9      	bset	20681,#1
1209  013b 2004          	jra	L505
1210  013d               L305:
1211                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1213  013d 721350c9      	bres	20681,#1
1214  0141               L505:
1215                     ; 556 }
1218  0141 81            	ret
1364                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1364                     ; 617 {
1365                     	switch	.text
1366  0142               _CLK_RTCClockConfig:
1368  0142 89            	pushw	x
1369       00000000      OFST:	set	0
1372                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1374                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1376                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1378  0143 9f            	ld	a,xl
1379  0144 1a01          	or	a,(OFST+1,sp)
1380  0146 c750c1        	ld	20673,a
1381                     ; 624 }
1384  0149 85            	popw	x
1385  014a 81            	ret
1451                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1451                     ; 636 {
1452                     	switch	.text
1453  014b               _CLK_BEEPClockConfig:
1457                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1459                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1461  014b c750cb        	ld	20683,a
1462                     ; 643 }
1465  014e 81            	ret
1690                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1690                     ; 678 {
1691                     	switch	.text
1692  014f               _CLK_PeripheralClockConfig:
1694  014f 89            	pushw	x
1695  0150 88            	push	a
1696       00000001      OFST:	set	1
1699                     ; 679   uint8_t reg = 0;
1701                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1703                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1705                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1707  0151 9e            	ld	a,xh
1708  0152 a4f0          	and	a,#240
1709  0154 6b01          	ld	(OFST+0,sp),a
1711                     ; 688   if ( reg == 0x00)
1713  0156 0d01          	tnz	(OFST+0,sp)
1714  0158 2635          	jrne	L527
1715                     ; 690     if (NewState != DISABLE)
1717  015a 0d03          	tnz	(OFST+2,sp)
1718  015c 2719          	jreq	L727
1719                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1721  015e 7b02          	ld	a,(OFST+1,sp)
1722  0160 a40f          	and	a,#15
1723  0162 5f            	clrw	x
1724  0163 97            	ld	xl,a
1725  0164 a601          	ld	a,#1
1726  0166 5d            	tnzw	x
1727  0167 2704          	jreq	L64
1728  0169               L05:
1729  0169 48            	sll	a
1730  016a 5a            	decw	x
1731  016b 26fc          	jrne	L05
1732  016d               L64:
1733  016d ca50c3        	or	a,20675
1734  0170 c750c3        	ld	20675,a
1736  0173 acf901f9      	jpf	L337
1737  0177               L727:
1738                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1740  0177 7b02          	ld	a,(OFST+1,sp)
1741  0179 a40f          	and	a,#15
1742  017b 5f            	clrw	x
1743  017c 97            	ld	xl,a
1744  017d a601          	ld	a,#1
1745  017f 5d            	tnzw	x
1746  0180 2704          	jreq	L25
1747  0182               L45:
1748  0182 48            	sll	a
1749  0183 5a            	decw	x
1750  0184 26fc          	jrne	L45
1751  0186               L25:
1752  0186 43            	cpl	a
1753  0187 c450c3        	and	a,20675
1754  018a c750c3        	ld	20675,a
1755  018d 206a          	jra	L337
1756  018f               L527:
1757                     ; 701   else if (reg == 0x10)
1759  018f 7b01          	ld	a,(OFST+0,sp)
1760  0191 a110          	cp	a,#16
1761  0193 2633          	jrne	L537
1762                     ; 703     if (NewState != DISABLE)
1764  0195 0d03          	tnz	(OFST+2,sp)
1765  0197 2717          	jreq	L737
1766                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1768  0199 7b02          	ld	a,(OFST+1,sp)
1769  019b a40f          	and	a,#15
1770  019d 5f            	clrw	x
1771  019e 97            	ld	xl,a
1772  019f a601          	ld	a,#1
1773  01a1 5d            	tnzw	x
1774  01a2 2704          	jreq	L65
1775  01a4               L06:
1776  01a4 48            	sll	a
1777  01a5 5a            	decw	x
1778  01a6 26fc          	jrne	L06
1779  01a8               L65:
1780  01a8 ca50c4        	or	a,20676
1781  01ab c750c4        	ld	20676,a
1783  01ae 2049          	jra	L337
1784  01b0               L737:
1785                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1787  01b0 7b02          	ld	a,(OFST+1,sp)
1788  01b2 a40f          	and	a,#15
1789  01b4 5f            	clrw	x
1790  01b5 97            	ld	xl,a
1791  01b6 a601          	ld	a,#1
1792  01b8 5d            	tnzw	x
1793  01b9 2704          	jreq	L26
1794  01bb               L46:
1795  01bb 48            	sll	a
1796  01bc 5a            	decw	x
1797  01bd 26fc          	jrne	L46
1798  01bf               L26:
1799  01bf 43            	cpl	a
1800  01c0 c450c4        	and	a,20676
1801  01c3 c750c4        	ld	20676,a
1802  01c6 2031          	jra	L337
1803  01c8               L537:
1804                     ; 716     if (NewState != DISABLE)
1806  01c8 0d03          	tnz	(OFST+2,sp)
1807  01ca 2717          	jreq	L547
1808                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1810  01cc 7b02          	ld	a,(OFST+1,sp)
1811  01ce a40f          	and	a,#15
1812  01d0 5f            	clrw	x
1813  01d1 97            	ld	xl,a
1814  01d2 a601          	ld	a,#1
1815  01d4 5d            	tnzw	x
1816  01d5 2704          	jreq	L66
1817  01d7               L07:
1818  01d7 48            	sll	a
1819  01d8 5a            	decw	x
1820  01d9 26fc          	jrne	L07
1821  01db               L66:
1822  01db ca50d0        	or	a,20688
1823  01de c750d0        	ld	20688,a
1825  01e1 2016          	jra	L337
1826  01e3               L547:
1827                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1829  01e3 7b02          	ld	a,(OFST+1,sp)
1830  01e5 a40f          	and	a,#15
1831  01e7 5f            	clrw	x
1832  01e8 97            	ld	xl,a
1833  01e9 a601          	ld	a,#1
1834  01eb 5d            	tnzw	x
1835  01ec 2704          	jreq	L27
1836  01ee               L47:
1837  01ee 48            	sll	a
1838  01ef 5a            	decw	x
1839  01f0 26fc          	jrne	L47
1840  01f2               L27:
1841  01f2 43            	cpl	a
1842  01f3 c450d0        	and	a,20688
1843  01f6 c750d0        	ld	20688,a
1844  01f9               L337:
1845                     ; 727 }
1848  01f9 5b03          	addw	sp,#3
1849  01fb 81            	ret
1873                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1873                     ; 766 {
1874                     	switch	.text
1875  01fc               _CLK_LSEClockSecuritySystemEnable:
1879                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1881  01fc 72105190      	bset	20880,#0
1882                     ; 769 }
1885  0200 81            	ret
1909                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1909                     ; 778 {
1910                     	switch	.text
1911  0201               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1915                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1917  0201 72125190      	bset	20880,#1
1918                     ; 781 }
1921  0205 81            	ret
1996                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1996                     ; 808 {
1997                     	switch	.text
1998  0206               _CLK_HaltConfig:
2000  0206 89            	pushw	x
2001       00000000      OFST:	set	0
2004                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
2006                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
2008                     ; 813   if (NewState != DISABLE)
2010  0207 9f            	ld	a,xl
2011  0208 4d            	tnz	a
2012  0209 2709          	jreq	L5201
2013                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2015  020b 9e            	ld	a,xh
2016  020c ca50c2        	or	a,20674
2017  020f c750c2        	ld	20674,a
2019  0212 2009          	jra	L7201
2020  0214               L5201:
2021                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2023  0214 7b01          	ld	a,(OFST+1,sp)
2024  0216 43            	cpl	a
2025  0217 c450c2        	and	a,20674
2026  021a c750c2        	ld	20674,a
2027  021d               L7201:
2028                     ; 821 }
2031  021d 85            	popw	x
2032  021e 81            	ret
2068                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2068                     ; 832 {
2069                     	switch	.text
2070  021f               _CLK_MainRegulatorCmd:
2074                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2076                     ; 836   if (NewState != DISABLE)
2078  021f 4d            	tnz	a
2079  0220 2706          	jreq	L7401
2080                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2082  0222 721350cf      	bres	20687,#1
2084  0226 2004          	jra	L1501
2085  0228               L7401:
2086                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2088  0228 721250cf      	bset	20687,#1
2089  022c               L1501:
2090                     ; 846 }
2093  022c 81            	ret
2165                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2165                     ; 876 {
2166                     	switch	.text
2167  022d               _CLK_ITConfig:
2169  022d 89            	pushw	x
2170       00000000      OFST:	set	0
2173                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2175                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2177                     ; 882   if (NewState != DISABLE)
2179  022e 9f            	ld	a,xl
2180  022f 4d            	tnz	a
2181  0230 271d          	jreq	L7011
2182                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2184  0232 9e            	ld	a,xh
2185  0233 a11c          	cp	a,#28
2186  0235 2606          	jrne	L1111
2187                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2189  0237 721450c9      	bset	20681,#2
2191  023b 202e          	jra	L1211
2192  023d               L1111:
2193                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2195  023d 7b01          	ld	a,(OFST+1,sp)
2196  023f a12c          	cp	a,#44
2197  0241 2606          	jrne	L5111
2198                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2200  0243 72145190      	bset	20880,#2
2202  0247 2022          	jra	L1211
2203  0249               L5111:
2204                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2206  0249 721450ca      	bset	20682,#2
2207  024d 201c          	jra	L1211
2208  024f               L7011:
2209                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2211  024f 7b01          	ld	a,(OFST+1,sp)
2212  0251 a11c          	cp	a,#28
2213  0253 2606          	jrne	L3211
2214                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2216  0255 721550c9      	bres	20681,#2
2218  0259 2010          	jra	L1211
2219  025b               L3211:
2220                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2222  025b 7b01          	ld	a,(OFST+1,sp)
2223  025d a12c          	cp	a,#44
2224  025f 2606          	jrne	L7211
2225                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2227  0261 72155190      	bres	20880,#2
2229  0265 2004          	jra	L1211
2230  0267               L7211:
2231                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2233  0267 721550ca      	bres	20682,#2
2234  026b               L1211:
2235                     ; 918 }
2238  026b 85            	popw	x
2239  026c 81            	ret
2462                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2462                     ; 946 {
2463                     	switch	.text
2464  026d               _CLK_GetFlagStatus:
2466  026d 88            	push	a
2467  026e 89            	pushw	x
2468       00000002      OFST:	set	2
2471                     ; 947   uint8_t reg = 0;
2473                     ; 948   uint8_t pos = 0;
2475                     ; 949   FlagStatus bitstatus = RESET;
2477                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2479                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2481  026f a4f0          	and	a,#240
2482  0271 6b02          	ld	(OFST+0,sp),a
2484                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2486  0273 7b03          	ld	a,(OFST+1,sp)
2487  0275 a40f          	and	a,#15
2488  0277 6b01          	ld	(OFST-1,sp),a
2490                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2492  0279 0d02          	tnz	(OFST+0,sp)
2493  027b 2607          	jrne	L7421
2494                     ; 962     reg = CLK->CRTCR;
2496  027d c650c1        	ld	a,20673
2497  0280 6b02          	ld	(OFST+0,sp),a
2500  0282 2060          	jra	L1521
2501  0284               L7421:
2502                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2504  0284 7b02          	ld	a,(OFST+0,sp)
2505  0286 a110          	cp	a,#16
2506  0288 2607          	jrne	L3521
2507                     ; 966     reg = CLK->ICKCR;
2509  028a c650c2        	ld	a,20674
2510  028d 6b02          	ld	(OFST+0,sp),a
2513  028f 2053          	jra	L1521
2514  0291               L3521:
2515                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2517  0291 7b02          	ld	a,(OFST+0,sp)
2518  0293 a120          	cp	a,#32
2519  0295 2607          	jrne	L7521
2520                     ; 970     reg = CLK->CCOR;
2522  0297 c650c5        	ld	a,20677
2523  029a 6b02          	ld	(OFST+0,sp),a
2526  029c 2046          	jra	L1521
2527  029e               L7521:
2528                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2530  029e 7b02          	ld	a,(OFST+0,sp)
2531  02a0 a130          	cp	a,#48
2532  02a2 2607          	jrne	L3621
2533                     ; 974     reg = CLK->ECKCR;
2535  02a4 c650c6        	ld	a,20678
2536  02a7 6b02          	ld	(OFST+0,sp),a
2539  02a9 2039          	jra	L1521
2540  02ab               L3621:
2541                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2543  02ab 7b02          	ld	a,(OFST+0,sp)
2544  02ad a140          	cp	a,#64
2545  02af 2607          	jrne	L7621
2546                     ; 978     reg = CLK->SWCR;
2548  02b1 c650c9        	ld	a,20681
2549  02b4 6b02          	ld	(OFST+0,sp),a
2552  02b6 202c          	jra	L1521
2553  02b8               L7621:
2554                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2556  02b8 7b02          	ld	a,(OFST+0,sp)
2557  02ba a150          	cp	a,#80
2558  02bc 2607          	jrne	L3721
2559                     ; 982     reg = CLK->CSSR;
2561  02be c650ca        	ld	a,20682
2562  02c1 6b02          	ld	(OFST+0,sp),a
2565  02c3 201f          	jra	L1521
2566  02c5               L3721:
2567                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2569  02c5 7b02          	ld	a,(OFST+0,sp)
2570  02c7 a170          	cp	a,#112
2571  02c9 2607          	jrne	L7721
2572                     ; 986     reg = CLK->REGCSR;
2574  02cb c650cf        	ld	a,20687
2575  02ce 6b02          	ld	(OFST+0,sp),a
2578  02d0 2012          	jra	L1521
2579  02d2               L7721:
2580                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2582  02d2 7b02          	ld	a,(OFST+0,sp)
2583  02d4 a180          	cp	a,#128
2584  02d6 2607          	jrne	L3031
2585                     ; 990     reg = CSSLSE->CSR;
2587  02d8 c65190        	ld	a,20880
2588  02db 6b02          	ld	(OFST+0,sp),a
2591  02dd 2005          	jra	L1521
2592  02df               L3031:
2593                     ; 994     reg = CLK->CBEEPR;
2595  02df c650cb        	ld	a,20683
2596  02e2 6b02          	ld	(OFST+0,sp),a
2598  02e4               L1521:
2599                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2601  02e4 7b01          	ld	a,(OFST-1,sp)
2602  02e6 5f            	clrw	x
2603  02e7 97            	ld	xl,a
2604  02e8 a601          	ld	a,#1
2605  02ea 5d            	tnzw	x
2606  02eb 2704          	jreq	L211
2607  02ed               L411:
2608  02ed 48            	sll	a
2609  02ee 5a            	decw	x
2610  02ef 26fc          	jrne	L411
2611  02f1               L211:
2612  02f1 1402          	and	a,(OFST+0,sp)
2613  02f3 2706          	jreq	L7031
2614                     ; 1000     bitstatus = SET;
2616  02f5 a601          	ld	a,#1
2617  02f7 6b02          	ld	(OFST+0,sp),a
2620  02f9 2002          	jra	L1131
2621  02fb               L7031:
2622                     ; 1004     bitstatus = RESET;
2624  02fb 0f02          	clr	(OFST+0,sp)
2626  02fd               L1131:
2627                     ; 1008   return((FlagStatus)bitstatus);
2629  02fd 7b02          	ld	a,(OFST+0,sp)
2632  02ff 5b03          	addw	sp,#3
2633  0301 81            	ret
2656                     ; 1016 void CLK_ClearFlag(void)
2656                     ; 1017 {
2657                     	switch	.text
2658  0302               _CLK_ClearFlag:
2662                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2664  0302 72175190      	bres	20880,#3
2665                     ; 1021 }
2668  0306 81            	ret
2714                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2714                     ; 1033 {
2715                     	switch	.text
2716  0307               _CLK_GetITStatus:
2718  0307 88            	push	a
2719  0308 88            	push	a
2720       00000001      OFST:	set	1
2723                     ; 1035   ITStatus bitstatus = RESET;
2725                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2727                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2729  0309 a11c          	cp	a,#28
2730  030b 2611          	jrne	L5431
2731                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2733  030d c450c9        	and	a,20681
2734  0310 a10c          	cp	a,#12
2735  0312 2606          	jrne	L7431
2736                     ; 1045       bitstatus = SET;
2738  0314 a601          	ld	a,#1
2739  0316 6b01          	ld	(OFST+0,sp),a
2742  0318 202e          	jra	L3531
2743  031a               L7431:
2744                     ; 1049       bitstatus = RESET;
2746  031a 0f01          	clr	(OFST+0,sp)
2748  031c 202a          	jra	L3531
2749  031e               L5431:
2750                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2752  031e 7b02          	ld	a,(OFST+1,sp)
2753  0320 a12c          	cp	a,#44
2754  0322 2613          	jrne	L5531
2755                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2757  0324 c65190        	ld	a,20880
2758  0327 1402          	and	a,(OFST+1,sp)
2759  0329 a10c          	cp	a,#12
2760  032b 2606          	jrne	L7531
2761                     ; 1057       bitstatus = SET;
2763  032d a601          	ld	a,#1
2764  032f 6b01          	ld	(OFST+0,sp),a
2767  0331 2015          	jra	L3531
2768  0333               L7531:
2769                     ; 1061       bitstatus = RESET;
2771  0333 0f01          	clr	(OFST+0,sp)
2773  0335 2011          	jra	L3531
2774  0337               L5531:
2775                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2777  0337 c650ca        	ld	a,20682
2778  033a 1402          	and	a,(OFST+1,sp)
2779  033c a10c          	cp	a,#12
2780  033e 2606          	jrne	L5631
2781                     ; 1069       bitstatus = SET;
2783  0340 a601          	ld	a,#1
2784  0342 6b01          	ld	(OFST+0,sp),a
2787  0344 2002          	jra	L3531
2788  0346               L5631:
2789                     ; 1073       bitstatus = RESET;
2791  0346 0f01          	clr	(OFST+0,sp)
2793  0348               L3531:
2794                     ; 1078   return bitstatus;
2796  0348 7b01          	ld	a,(OFST+0,sp)
2799  034a 85            	popw	x
2800  034b 81            	ret
2836                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2836                     ; 1090 {
2837                     	switch	.text
2838  034c               _CLK_ClearITPendingBit:
2842                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2844                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2846  034c a4f0          	and	a,#240
2847  034e a120          	cp	a,#32
2848  0350 2606          	jrne	L7041
2849                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2851  0352 72175190      	bres	20880,#3
2853  0356 2004          	jra	L1141
2854  0358               L7041:
2855                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2857  0358 721750c9      	bres	20681,#3
2858  035c               L1141:
2859                     ; 1105 }
2862  035c 81            	ret
2887                     	xdef	_SYSDivFactor
2888                     	xdef	_CLK_ClearITPendingBit
2889                     	xdef	_CLK_GetITStatus
2890                     	xdef	_CLK_ClearFlag
2891                     	xdef	_CLK_GetFlagStatus
2892                     	xdef	_CLK_ITConfig
2893                     	xdef	_CLK_MainRegulatorCmd
2894                     	xdef	_CLK_HaltConfig
2895                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2896                     	xdef	_CLK_LSEClockSecuritySystemEnable
2897                     	xdef	_CLK_PeripheralClockConfig
2898                     	xdef	_CLK_BEEPClockConfig
2899                     	xdef	_CLK_RTCClockConfig
2900                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2901                     	xdef	_CLK_SYSCLKDivConfig
2902                     	xdef	_CLK_GetClockFreq
2903                     	xdef	_CLK_GetSYSCLKSource
2904                     	xdef	_CLK_SYSCLKSourceConfig
2905                     	xdef	_CLK_CCOConfig
2906                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2907                     	xdef	_CLK_ClockSecuritySystemEnable
2908                     	xdef	_CLK_LSEConfig
2909                     	xdef	_CLK_HSEConfig
2910                     	xdef	_CLK_LSICmd
2911                     	xdef	_CLK_AdjustHSICalibrationValue
2912                     	xdef	_CLK_HSICmd
2913                     	xdef	_CLK_DeInit
2914                     	xref.b	c_lreg
2915                     	xref.b	c_x
2934                     	xref	c_ludv
2935                     	xref	c_rtol
2936                     	xref	c_ltor
2937                     	end
