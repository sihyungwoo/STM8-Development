   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 173                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 173                     ; 136 {
 175                     	switch	.text
 176  0000               _ADC_DeInit:
 180                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 182  0000 7f            	clr	(x)
 183                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 185  0001 6f01          	clr	(1,x)
 186                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 188  0003 a61f          	ld	a,#31
 189  0005 e702          	ld	(2,x),a
 190                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 192  0007 a6ff          	ld	a,#255
 193  0009 e703          	ld	(3,x),a
 194                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 196  000b a60f          	ld	a,#15
 197  000d e706          	ld	(6,x),a
 198                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 200  000f a6ff          	ld	a,#255
 201  0011 e707          	ld	(7,x),a
 202                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 204  0013 6f08          	clr	(8,x)
 205                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 207  0015 6f09          	clr	(9,x)
 208                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 210  0017 6f0a          	clr	(10,x)
 211                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 213  0019 6f0b          	clr	(11,x)
 214                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 216  001b 6f0c          	clr	(12,x)
 217                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 219  001d 6f0d          	clr	(13,x)
 220                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 222  001f 6f0e          	clr	(14,x)
 223                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 225  0021 6f0f          	clr	(15,x)
 226                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 228  0023 6f10          	clr	(16,x)
 229                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 231  0025 6f11          	clr	(17,x)
 232                     ; 164 }
 235  0027 81            	ret
 382                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 382                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 382                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 382                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 382                     ; 190 {
 383                     	switch	.text
 384  0028               _ADC_Init:
 386  0028 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 392                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 394                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 396                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 398  0029 f6            	ld	a,(x)
 399  002a a49b          	and	a,#155
 400  002c f7            	ld	(x),a
 401                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 403  002d 7b05          	ld	a,(OFST+5,sp)
 404  002f 1a06          	or	a,(OFST+6,sp)
 405  0031 fa            	or	a,(x)
 406  0032 f7            	ld	(x),a
 407                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 409  0033 e601          	ld	a,(1,x)
 410  0035 a47f          	and	a,#127
 411  0037 e701          	ld	(1,x),a
 412                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 414  0039 e601          	ld	a,(1,x)
 415  003b 1a07          	or	a,(OFST+7,sp)
 416  003d e701          	ld	(1,x),a
 417                     ; 207 }
 420  003f 85            	popw	x
 421  0040 81            	ret
 488                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 488                     ; 217              FunctionalState NewState)
 488                     ; 218 {
 489                     	switch	.text
 490  0041               _ADC_Cmd:
 492  0041 89            	pushw	x
 493       00000000      OFST:	set	0
 496                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 498                     ; 222   if (NewState != DISABLE)
 500  0042 0d05          	tnz	(OFST+5,sp)
 501  0044 2706          	jreq	L142
 502                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 504  0046 f6            	ld	a,(x)
 505  0047 aa01          	or	a,#1
 506  0049 f7            	ld	(x),a
 508  004a 2006          	jra	L342
 509  004c               L142:
 510                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 512  004c 1e01          	ldw	x,(OFST+1,sp)
 513  004e f6            	ld	a,(x)
 514  004f a4fe          	and	a,#254
 515  0051 f7            	ld	(x),a
 516  0052               L342:
 517                     ; 232 }
 520  0052 85            	popw	x
 521  0053 81            	ret
 559                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 559                     ; 240 {
 560                     	switch	.text
 561  0054               _ADC_SoftwareStartConv:
 565                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 567  0054 f6            	ld	a,(x)
 568  0055 aa02          	or	a,#2
 569  0057 f7            	ld	(x),a
 570                     ; 243 }
 573  0058 81            	ret
 701                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 701                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 701                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 701                     ; 264 {
 702                     	switch	.text
 703  0059               _ADC_ExternalTrigConfig:
 705  0059 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 711                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 713                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 715  005a e601          	ld	a,(1,x)
 716  005c a487          	and	a,#135
 717  005e e701          	ld	(1,x),a
 718                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 718                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 720  0060 7b06          	ld	a,(OFST+6,sp)
 721  0062 1a05          	or	a,(OFST+5,sp)
 722  0064 ea01          	or	a,(1,x)
 723  0066 e701          	ld	(1,x),a
 724                     ; 276 }
 727  0068 85            	popw	x
 728  0069 81            	ret
1042                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1042                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1042                     ; 341 {
1043                     	switch	.text
1044  006a               _ADC_AnalogWatchdogChannelSelect:
1046  006a 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1052                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1054  006b e602          	ld	a,(2,x)
1055  006d a4e0          	and	a,#224
1056  006f e702          	ld	(2,x),a
1057                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1059  0071 e602          	ld	a,(2,x)
1060  0073 1a05          	or	a,(OFST+5,sp)
1061  0075 e702          	ld	(2,x),a
1062                     ; 350 }
1065  0077 85            	popw	x
1066  0078 81            	ret
1122                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1122                     ; 362 {
1123                     	switch	.text
1124  0079               _ADC_AnalogWatchdogThresholdsConfig:
1126  0079 89            	pushw	x
1127       00000000      OFST:	set	0
1130                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1132                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1134                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1136  007a 7b05          	ld	a,(OFST+5,sp)
1137  007c 1e01          	ldw	x,(OFST+1,sp)
1138  007e e706          	ld	(6,x),a
1139                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1141  0080 7b06          	ld	a,(OFST+6,sp)
1142  0082 1e01          	ldw	x,(OFST+1,sp)
1143  0084 e707          	ld	(7,x),a
1144                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1146  0086 7b07          	ld	a,(OFST+7,sp)
1147  0088 1e01          	ldw	x,(OFST+1,sp)
1148  008a e708          	ld	(8,x),a
1149                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1151  008c 7b08          	ld	a,(OFST+8,sp)
1152  008e 1e01          	ldw	x,(OFST+1,sp)
1153  0090 e709          	ld	(9,x),a
1154                     ; 374 }
1157  0092 85            	popw	x
1158  0093 81            	ret
1225                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1225                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1225                     ; 414                               uint16_t HighThreshold,
1225                     ; 415                               uint16_t LowThreshold)
1225                     ; 416 {
1226                     	switch	.text
1227  0094               _ADC_AnalogWatchdogConfig:
1229  0094 89            	pushw	x
1230       00000000      OFST:	set	0
1233                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1235                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1237                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1239                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1241  0095 e602          	ld	a,(2,x)
1242  0097 a4e0          	and	a,#224
1243  0099 e702          	ld	(2,x),a
1244                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1246  009b e602          	ld	a,(2,x)
1247  009d 1a05          	or	a,(OFST+5,sp)
1248  009f e702          	ld	(2,x),a
1249                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1251  00a1 7b06          	ld	a,(OFST+6,sp)
1252  00a3 1e01          	ldw	x,(OFST+1,sp)
1253  00a5 e706          	ld	(6,x),a
1254                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1256  00a7 7b07          	ld	a,(OFST+7,sp)
1257  00a9 1e01          	ldw	x,(OFST+1,sp)
1258  00ab e707          	ld	(7,x),a
1259                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1261  00ad 7b08          	ld	a,(OFST+8,sp)
1262  00af 1e01          	ldw	x,(OFST+1,sp)
1263  00b1 e708          	ld	(8,x),a
1264                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1266  00b3 7b09          	ld	a,(OFST+9,sp)
1267  00b5 1e01          	ldw	x,(OFST+1,sp)
1268  00b7 e709          	ld	(9,x),a
1269                     ; 435 }
1272  00b9 85            	popw	x
1273  00ba 81            	ret
1308                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1308                     ; 475 {
1309                     	switch	.text
1310  00bb               _ADC_TempSensorCmd:
1314                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1316                     ; 479   if (NewState != DISABLE)
1318  00bb 4d            	tnz	a
1319  00bc 2706          	jreq	L175
1320                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1322  00be 721a534e      	bset	21326,#5
1324  00c2 2004          	jra	L375
1325  00c4               L175:
1326                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1328  00c4 721b534e      	bres	21326,#5
1329  00c8               L375:
1330                     ; 489 }
1333  00c8 81            	ret
1368                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1368                     ; 498 {
1369                     	switch	.text
1370  00c9               _ADC_VrefintCmd:
1374                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1376                     ; 502   if (NewState != DISABLE)
1378  00c9 4d            	tnz	a
1379  00ca 2706          	jreq	L316
1380                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1382  00cc 7218534e      	bset	21326,#4
1384  00d0 2004          	jra	L516
1385  00d2               L316:
1386                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1388  00d2 7219534e      	bres	21326,#4
1389  00d6               L516:
1390                     ; 512 }
1393  00d6 81            	ret
1705                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1705                     ; 584 {
1706                     	switch	.text
1707  00d7               _ADC_ChannelCmd:
1709  00d7 89            	pushw	x
1710  00d8 88            	push	a
1711       00000001      OFST:	set	1
1714                     ; 585   uint8_t regindex = 0;
1716                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1718                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1720  00d9 7b06          	ld	a,(OFST+5,sp)
1721  00db 6b01          	ld	(OFST+0,sp),a
1723                     ; 591   if (NewState != DISABLE)
1725  00dd 0d08          	tnz	(OFST+7,sp)
1726  00df 270f          	jreq	L367
1727                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1729  00e1 01            	rrwa	x,a
1730  00e2 1b01          	add	a,(OFST+0,sp)
1731  00e4 2401          	jrnc	L23
1732  00e6 5c            	incw	x
1733  00e7               L23:
1734  00e7 02            	rlwa	x,a
1735  00e8 e60a          	ld	a,(10,x)
1736  00ea 1a07          	or	a,(OFST+6,sp)
1737  00ec e70a          	ld	(10,x),a
1739  00ee 2012          	jra	L567
1740  00f0               L367:
1741                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1743  00f0 7b02          	ld	a,(OFST+1,sp)
1744  00f2 97            	ld	xl,a
1745  00f3 7b03          	ld	a,(OFST+2,sp)
1746  00f5 1b01          	add	a,(OFST+0,sp)
1747  00f7 2401          	jrnc	L43
1748  00f9 5c            	incw	x
1749  00fa               L43:
1750  00fa 02            	rlwa	x,a
1751  00fb 7b07          	ld	a,(OFST+6,sp)
1752  00fd 43            	cpl	a
1753  00fe e40a          	and	a,(10,x)
1754  0100 e70a          	ld	(10,x),a
1755  0102               L567:
1756                     ; 601 }
1759  0102 5b03          	addw	sp,#3
1760  0104 81            	ret
1910                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1910                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1910                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1910                     ; 628 {
1911                     	switch	.text
1912  0105               _ADC_SamplingTimeConfig:
1914  0105 89            	pushw	x
1915       00000000      OFST:	set	0
1918                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1920                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1922                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1924  0106 0d05          	tnz	(OFST+5,sp)
1925  0108 2712          	jreq	L3501
1926                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1928  010a e602          	ld	a,(2,x)
1929  010c a41f          	and	a,#31
1930  010e e702          	ld	(2,x),a
1931                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1933  0110 7b06          	ld	a,(OFST+6,sp)
1934  0112 4e            	swap	a
1935  0113 48            	sll	a
1936  0114 a4e0          	and	a,#224
1937  0116 ea02          	or	a,(2,x)
1938  0118 e702          	ld	(2,x),a
1940  011a 2010          	jra	L5501
1941  011c               L3501:
1942                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1944  011c 1e01          	ldw	x,(OFST+1,sp)
1945  011e e601          	ld	a,(1,x)
1946  0120 a4f8          	and	a,#248
1947  0122 e701          	ld	(1,x),a
1948                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1950  0124 1e01          	ldw	x,(OFST+1,sp)
1951  0126 e601          	ld	a,(1,x)
1952  0128 1a06          	or	a,(OFST+6,sp)
1953  012a e701          	ld	(1,x),a
1954  012c               L5501:
1955                     ; 645 }
1958  012c 85            	popw	x
1959  012d 81            	ret
2026                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2026                     ; 692                               FunctionalState NewState)
2026                     ; 693 {
2027                     	switch	.text
2028  012e               _ADC_SchmittTriggerConfig:
2030  012e 89            	pushw	x
2031  012f 88            	push	a
2032       00000001      OFST:	set	1
2035                     ; 694   uint8_t regindex = 0;
2037                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2039                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2041  0130 7b06          	ld	a,(OFST+5,sp)
2042  0132 6b01          	ld	(OFST+0,sp),a
2044                     ; 700   if (NewState != DISABLE)
2046  0134 0d08          	tnz	(OFST+7,sp)
2047  0136 2710          	jreq	L3111
2048                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2050  0138 01            	rrwa	x,a
2051  0139 1b01          	add	a,(OFST+0,sp)
2052  013b 2401          	jrnc	L24
2053  013d 5c            	incw	x
2054  013e               L24:
2055  013e 02            	rlwa	x,a
2056  013f 7b07          	ld	a,(OFST+6,sp)
2057  0141 43            	cpl	a
2058  0142 e40e          	and	a,(14,x)
2059  0144 e70e          	ld	(14,x),a
2061  0146 2011          	jra	L5111
2062  0148               L3111:
2063                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2065  0148 7b02          	ld	a,(OFST+1,sp)
2066  014a 97            	ld	xl,a
2067  014b 7b03          	ld	a,(OFST+2,sp)
2068  014d 1b01          	add	a,(OFST+0,sp)
2069  014f 2401          	jrnc	L44
2070  0151 5c            	incw	x
2071  0152               L44:
2072  0152 02            	rlwa	x,a
2073  0153 e60e          	ld	a,(14,x)
2074  0155 1a07          	or	a,(OFST+6,sp)
2075  0157 e70e          	ld	(14,x),a
2076  0159               L5111:
2077                     ; 710 }
2080  0159 5b03          	addw	sp,#3
2081  015b 81            	ret
2128                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2128                     ; 718 {
2129                     	switch	.text
2130  015c               _ADC_GetConversionValue:
2132  015c 89            	pushw	x
2133  015d 89            	pushw	x
2134       00000002      OFST:	set	2
2137                     ; 719   uint16_t tmpreg = 0;
2139                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2141  015e e604          	ld	a,(4,x)
2142  0160 5f            	clrw	x
2143  0161 97            	ld	xl,a
2144  0162 1f01          	ldw	(OFST-1,sp),x
2146                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2148  0164 1e01          	ldw	x,(OFST-1,sp)
2149  0166 1603          	ldw	y,(OFST+1,sp)
2150  0168 90e605        	ld	a,(5,y)
2151  016b 02            	rlwa	x,a
2152  016c 1f01          	ldw	(OFST-1,sp),x
2154                     ; 726   return (uint16_t)(tmpreg) ;
2156  016e 1e01          	ldw	x,(OFST-1,sp)
2159  0170 5b04          	addw	sp,#4
2160  0172 81            	ret
2207                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2207                     ; 761 {
2208                     	switch	.text
2209  0173               _ADC_DMACmd:
2211  0173 89            	pushw	x
2212       00000000      OFST:	set	0
2215                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2217                     ; 765   if (NewState != DISABLE)
2219  0174 0d05          	tnz	(OFST+5,sp)
2220  0176 2708          	jreq	L7611
2221                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2223  0178 e60a          	ld	a,(10,x)
2224  017a a47f          	and	a,#127
2225  017c e70a          	ld	(10,x),a
2227  017e 2008          	jra	L1711
2228  0180               L7611:
2229                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2231  0180 1e01          	ldw	x,(OFST+1,sp)
2232  0182 e60a          	ld	a,(10,x)
2233  0184 aa80          	or	a,#128
2234  0186 e70a          	ld	(10,x),a
2235  0188               L1711:
2236                     ; 775 }
2239  0188 85            	popw	x
2240  0189 81            	ret
2324                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2324                     ; 832 {
2325                     	switch	.text
2326  018a               _ADC_ITConfig:
2328  018a 89            	pushw	x
2329       00000000      OFST:	set	0
2332                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2334                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2336                     ; 837   if (NewState != DISABLE)
2338  018b 0d06          	tnz	(OFST+6,sp)
2339  018d 2706          	jreq	L5321
2340                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2342  018f f6            	ld	a,(x)
2343  0190 1a05          	or	a,(OFST+5,sp)
2344  0192 f7            	ld	(x),a
2346  0193 2007          	jra	L7321
2347  0195               L5321:
2348                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2350  0195 1e01          	ldw	x,(OFST+1,sp)
2351  0197 7b05          	ld	a,(OFST+5,sp)
2352  0199 43            	cpl	a
2353  019a f4            	and	a,(x)
2354  019b f7            	ld	(x),a
2355  019c               L7321:
2356                     ; 847 }
2359  019c 85            	popw	x
2360  019d 81            	ret
2465                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2465                     ; 860 {
2466                     	switch	.text
2467  019e               _ADC_GetFlagStatus:
2469  019e 89            	pushw	x
2470  019f 88            	push	a
2471       00000001      OFST:	set	1
2474                     ; 861   FlagStatus flagstatus = RESET;
2476                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2478                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2480  01a0 e603          	ld	a,(3,x)
2481  01a2 1506          	bcp	a,(OFST+5,sp)
2482  01a4 2706          	jreq	L3131
2483                     ; 870     flagstatus = SET;
2485  01a6 a601          	ld	a,#1
2486  01a8 6b01          	ld	(OFST+0,sp),a
2489  01aa 2002          	jra	L5131
2490  01ac               L3131:
2491                     ; 875     flagstatus = RESET;
2493  01ac 0f01          	clr	(OFST+0,sp)
2495  01ae               L5131:
2496                     ; 879   return  flagstatus;
2498  01ae 7b01          	ld	a,(OFST+0,sp)
2501  01b0 5b03          	addw	sp,#3
2502  01b2 81            	ret
2549                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2549                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2549                     ; 894 {
2550                     	switch	.text
2551  01b3               _ADC_ClearFlag:
2553  01b3 89            	pushw	x
2554       00000000      OFST:	set	0
2557                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2559                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2561  01b4 7b05          	ld	a,(OFST+5,sp)
2562  01b6 43            	cpl	a
2563  01b7 1e01          	ldw	x,(OFST+1,sp)
2564  01b9 e703          	ld	(3,x),a
2565                     ; 900 }
2568  01bb 85            	popw	x
2569  01bc 81            	ret
2645                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2645                     ; 913                          ADC_IT_TypeDef ADC_IT)
2645                     ; 914 {
2646                     	switch	.text
2647  01bd               _ADC_GetITStatus:
2649  01bd 89            	pushw	x
2650  01be 5203          	subw	sp,#3
2651       00000003      OFST:	set	3
2654                     ; 915   ITStatus itstatus = RESET;
2656                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2660                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2662                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2664  01c0 7b08          	ld	a,(OFST+5,sp)
2665  01c2 44            	srl	a
2666  01c3 44            	srl	a
2667  01c4 44            	srl	a
2668  01c5 6b03          	ld	(OFST+0,sp),a
2670                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2670                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2672  01c7 7b03          	ld	a,(OFST+0,sp)
2673  01c9 a403          	and	a,#3
2674  01cb 6b01          	ld	(OFST-2,sp),a
2676  01cd 7b03          	ld	a,(OFST+0,sp)
2677  01cf a410          	and	a,#16
2678  01d1 44            	srl	a
2679  01d2 44            	srl	a
2680  01d3 1a01          	or	a,(OFST-2,sp)
2681  01d5 6b03          	ld	(OFST+0,sp),a
2683                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2685  01d7 f6            	ld	a,(x)
2686  01d8 1408          	and	a,(OFST+5,sp)
2687  01da 6b02          	ld	(OFST-1,sp),a
2689                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2691  01dc e603          	ld	a,(3,x)
2692  01de 1503          	bcp	a,(OFST+0,sp)
2693  01e0 270a          	jreq	L3041
2695  01e2 0d02          	tnz	(OFST-1,sp)
2696  01e4 2706          	jreq	L3041
2697                     ; 933     itstatus = SET;
2699  01e6 a601          	ld	a,#1
2700  01e8 6b03          	ld	(OFST+0,sp),a
2703  01ea 2002          	jra	L5041
2704  01ec               L3041:
2705                     ; 938     itstatus = RESET;
2707  01ec 0f03          	clr	(OFST+0,sp)
2709  01ee               L5041:
2710                     ; 942   return  itstatus;
2712  01ee 7b03          	ld	a,(OFST+0,sp)
2715  01f0 5b05          	addw	sp,#5
2716  01f2 81            	ret
2773                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2773                     ; 956                            ADC_IT_TypeDef ADC_IT)
2773                     ; 957 {
2774                     	switch	.text
2775  01f3               _ADC_ClearITPendingBit:
2777  01f3 89            	pushw	x
2778  01f4 89            	pushw	x
2779       00000002      OFST:	set	2
2782                     ; 958   uint8_t itmask = 0;
2784                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2786                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2788  01f5 7b07          	ld	a,(OFST+5,sp)
2789  01f7 44            	srl	a
2790  01f8 44            	srl	a
2791  01f9 44            	srl	a
2792  01fa 6b02          	ld	(OFST+0,sp),a
2794                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2794                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2796  01fc 7b02          	ld	a,(OFST+0,sp)
2797  01fe a403          	and	a,#3
2798  0200 6b01          	ld	(OFST-1,sp),a
2800  0202 7b02          	ld	a,(OFST+0,sp)
2801  0204 a410          	and	a,#16
2802  0206 44            	srl	a
2803  0207 44            	srl	a
2804  0208 1a01          	or	a,(OFST-1,sp)
2805  020a 6b02          	ld	(OFST+0,sp),a
2807                     ; 969   ADCx->SR = (uint8_t)~itmask;
2809  020c 7b02          	ld	a,(OFST+0,sp)
2810  020e 43            	cpl	a
2811  020f 1e03          	ldw	x,(OFST+1,sp)
2812  0211 e703          	ld	(3,x),a
2813                     ; 970 }
2816  0213 5b04          	addw	sp,#4
2817  0215 81            	ret
2830                     	xdef	_ADC_ClearITPendingBit
2831                     	xdef	_ADC_GetITStatus
2832                     	xdef	_ADC_ClearFlag
2833                     	xdef	_ADC_GetFlagStatus
2834                     	xdef	_ADC_ITConfig
2835                     	xdef	_ADC_DMACmd
2836                     	xdef	_ADC_GetConversionValue
2837                     	xdef	_ADC_SchmittTriggerConfig
2838                     	xdef	_ADC_SamplingTimeConfig
2839                     	xdef	_ADC_ChannelCmd
2840                     	xdef	_ADC_VrefintCmd
2841                     	xdef	_ADC_TempSensorCmd
2842                     	xdef	_ADC_AnalogWatchdogConfig
2843                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2844                     	xdef	_ADC_AnalogWatchdogChannelSelect
2845                     	xdef	_ADC_ExternalTrigConfig
2846                     	xdef	_ADC_SoftwareStartConv
2847                     	xdef	_ADC_Cmd
2848                     	xdef	_ADC_Init
2849                     	xdef	_ADC_DeInit
2868                     	end
