   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 142 void DAC_DeInit(void)
  42                     ; 143 {
  44                     	switch	.text
  45  0000               _DAC_DeInit:
  49                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  51  0000 725f5380      	clr	21376
  52                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  54  0004 725f5381      	clr	21377
  55                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  57  0008 725f5382      	clr	21378
  58                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  60  000c 725f5383      	clr	21379
  61                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  63  0010 725f5384      	clr	21380
  64                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  66  0014 35ff5385      	mov	21381,#255
  67                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  69  0018 725f5388      	clr	21384
  70                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  72  001c 725f5389      	clr	21385
  73                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  75  0020 725f538c      	clr	21388
  76                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  78  0024 725f538d      	clr	21389
  79                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  81  0028 725f5390      	clr	21392
  82                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  84  002c 725f5394      	clr	21396
  85                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  87  0030 725f5395      	clr	21397
  88                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  90  0034 725f5398      	clr	21400
  91                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  93  0038 725f5399      	clr	21401
  94                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  96  003c 725f539c      	clr	21404
  97                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  99  0040 725f53a0      	clr	21408
 100                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 102  0044 725f53a1      	clr	21409
 103                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 105  0048 725f53a2      	clr	21410
 106                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 108  004c 725f53a3      	clr	21411
 109                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 111  0050 725f53a4      	clr	21412
 112                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 114  0054 725f53a5      	clr	21413
 115                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 117  0058 725f53a6      	clr	21414
 118                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 120  005c 725f53a7      	clr	21415
 121                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 123  0060 725f53a8      	clr	21416
 124                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 126  0064 725f53a9      	clr	21417
 127                     ; 187 }
 130  0068 81            	ret
 289                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 289                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 289                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 289                     ; 211 {
 290                     	switch	.text
 291  0069               _DAC_Init:
 293  0069 89            	pushw	x
 294  006a 5203          	subw	sp,#3
 295       00000003      OFST:	set	3
 298                     ; 212   uint8_t tmpreg = 0;
 300                     ; 213   uint16_t tmpreg2 = 0;
 302                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 304                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 306                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 308                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 310  006c 9e            	ld	a,xh
 311  006d 48            	sll	a
 312  006e 5f            	clrw	x
 313  006f 97            	ld	xl,a
 314  0070 1f01          	ldw	(OFST-2,sp),x
 316                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 318  0072 1e01          	ldw	x,(OFST-2,sp)
 319  0074 d65380        	ld	a,(21376,x)
 320  0077 6b03          	ld	(OFST+0,sp),a
 322                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 324  0079 7b03          	ld	a,(OFST+0,sp)
 325  007b a4c1          	and	a,#193
 326  007d 6b03          	ld	(OFST+0,sp),a
 328                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 330  007f 7b03          	ld	a,(OFST+0,sp)
 331  0081 1a08          	or	a,(OFST+5,sp)
 332  0083 6b03          	ld	(OFST+0,sp),a
 334                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 336  0085 7b05          	ld	a,(OFST+2,sp)
 337  0087 a130          	cp	a,#48
 338  0089 2708          	jreq	L511
 339                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 341  008b 7b05          	ld	a,(OFST+2,sp)
 342  008d aa04          	or	a,#4
 343  008f 1a03          	or	a,(OFST+0,sp)
 344  0091 6b03          	ld	(OFST+0,sp),a
 346  0093               L511:
 347                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 349  0093 7b03          	ld	a,(OFST+0,sp)
 350  0095 1e01          	ldw	x,(OFST-2,sp)
 351  0097 d75380        	ld	(21376,x),a
 352                     ; 240 }
 355  009a 5b05          	addw	sp,#5
 356  009c 81            	ret
 430                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 430                     ; 255 {
 431                     	switch	.text
 432  009d               _DAC_Cmd:
 434  009d 89            	pushw	x
 435  009e 89            	pushw	x
 436       00000002      OFST:	set	2
 439                     ; 256   uint16_t cr1addr = 0;
 441                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 443                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 445                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 447  009f 9e            	ld	a,xh
 448  00a0 48            	sll	a
 449  00a1 5f            	clrw	x
 450  00a2 97            	ld	xl,a
 451  00a3 1c5380        	addw	x,#21376
 452  00a6 1f01          	ldw	(OFST-1,sp),x
 454                     ; 264   if (NewState != DISABLE)
 456  00a8 0d04          	tnz	(OFST+2,sp)
 457  00aa 2708          	jreq	L551
 458                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 460  00ac 1e01          	ldw	x,(OFST-1,sp)
 461  00ae f6            	ld	a,(x)
 462  00af aa01          	or	a,#1
 463  00b1 f7            	ld	(x),a
 465  00b2 2006          	jra	L751
 466  00b4               L551:
 467                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 469  00b4 1e01          	ldw	x,(OFST-1,sp)
 470  00b6 f6            	ld	a,(x)
 471  00b7 a4fe          	and	a,#254
 472  00b9 f7            	ld	(x),a
 473  00ba               L751:
 474                     ; 274 }
 477  00ba 5b04          	addw	sp,#4
 478  00bc 81            	ret
 524                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 524                     ; 287 {
 525                     	switch	.text
 526  00bd               _DAC_SoftwareTriggerCmd:
 528  00bd 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 534                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 536                     ; 292   if (NewState != DISABLE)
 538  00be 9f            	ld	a,xl
 539  00bf 4d            	tnz	a
 540  00c0 2714          	jreq	L302
 541                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 543  00c2 9e            	ld	a,xh
 544  00c3 5f            	clrw	x
 545  00c4 97            	ld	xl,a
 546  00c5 a601          	ld	a,#1
 547  00c7 5d            	tnzw	x
 548  00c8 2704          	jreq	L41
 549  00ca               L61:
 550  00ca 48            	sll	a
 551  00cb 5a            	decw	x
 552  00cc 26fc          	jrne	L61
 553  00ce               L41:
 554  00ce ca5384        	or	a,21380
 555  00d1 c75384        	ld	21380,a
 557  00d4 2014          	jra	L502
 558  00d6               L302:
 559                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 561  00d6 7b01          	ld	a,(OFST+1,sp)
 562  00d8 5f            	clrw	x
 563  00d9 97            	ld	xl,a
 564  00da a601          	ld	a,#1
 565  00dc 5d            	tnzw	x
 566  00dd 2704          	jreq	L02
 567  00df               L22:
 568  00df 48            	sll	a
 569  00e0 5a            	decw	x
 570  00e1 26fc          	jrne	L22
 571  00e3               L02:
 572  00e3 43            	cpl	a
 573  00e4 c45384        	and	a,21380
 574  00e7 c75384        	ld	21380,a
 575  00ea               L502:
 576                     ; 302 }
 579  00ea 85            	popw	x
 580  00eb 81            	ret
 616                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 616                     ; 312 {
 617                     	switch	.text
 618  00ec               _DAC_DualSoftwareTriggerCmd:
 622                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 624                     ; 316   if (NewState != DISABLE)
 626  00ec 4d            	tnz	a
 627  00ed 270a          	jreq	L522
 628                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 630  00ef c65384        	ld	a,21380
 631  00f2 aa03          	or	a,#3
 632  00f4 c75384        	ld	21380,a
 634  00f7 2008          	jra	L722
 635  00f9               L522:
 636                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 638  00f9 c65384        	ld	a,21380
 639  00fc a4fc          	and	a,#252
 640  00fe c75384        	ld	21380,a
 641  0101               L722:
 642                     ; 326 }
 645  0101 81            	ret
 730                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 730                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 730                     ; 344                            FunctionalState NewState)
 730                     ; 345 {
 731                     	switch	.text
 732  0102               _DAC_WaveGenerationCmd:
 734  0102 89            	pushw	x
 735  0103 88            	push	a
 736       00000001      OFST:	set	1
 739                     ; 346   uint8_t tmpreg = 0;
 741                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 743                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 745                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 747                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 749  0104 9e            	ld	a,xh
 750  0105 48            	sll	a
 751  0106 5f            	clrw	x
 752  0107 97            	ld	xl,a
 753  0108 d65380        	ld	a,(21376,x)
 754  010b a43f          	and	a,#63
 755  010d 6b01          	ld	(OFST+0,sp),a
 757                     ; 356   if (NewState != DISABLE)
 759  010f 0d06          	tnz	(OFST+5,sp)
 760  0111 2706          	jreq	L372
 761                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 763  0113 7b01          	ld	a,(OFST+0,sp)
 764  0115 1a03          	or	a,(OFST+2,sp)
 765  0117 6b01          	ld	(OFST+0,sp),a
 767  0119               L372:
 768                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 770  0119 7b02          	ld	a,(OFST+1,sp)
 771  011b 48            	sll	a
 772  011c 5f            	clrw	x
 773  011d 97            	ld	xl,a
 774  011e 7b01          	ld	a,(OFST+0,sp)
 775  0120 d75380        	ld	(21376,x),a
 776                     ; 364 }
 779  0123 5b03          	addw	sp,#3
 780  0125 81            	ret
 946                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 946                     ; 389 {
 947                     	switch	.text
 948  0126               _DAC_SetNoiseWaveLFSR:
 950  0126 89            	pushw	x
 951  0127 5203          	subw	sp,#3
 952       00000003      OFST:	set	3
 955                     ; 390   uint8_t tmpreg = 0;
 957                     ; 391   uint16_t cr2addr = 0;
 959                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 961                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 963                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 965  0129 9e            	ld	a,xh
 966  012a 48            	sll	a
 967  012b 5f            	clrw	x
 968  012c 97            	ld	xl,a
 969  012d 1c5381        	addw	x,#21377
 970  0130 1f02          	ldw	(OFST-1,sp),x
 972                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 974  0132 1e02          	ldw	x,(OFST-1,sp)
 975  0134 f6            	ld	a,(x)
 976  0135 a4f0          	and	a,#240
 977  0137 6b01          	ld	(OFST-2,sp),a
 979                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 981  0139 7b01          	ld	a,(OFST-2,sp)
 982  013b 1a05          	or	a,(OFST+2,sp)
 983  013d 1e02          	ldw	x,(OFST-1,sp)
 984  013f f7            	ld	(x),a
 985                     ; 403 }
 988  0140 5b05          	addw	sp,#5
 989  0142 81            	ret
1156                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1156                     ; 428 {
1157                     	switch	.text
1158  0143               _DAC_SetTriangleWaveAmplitude:
1160  0143 89            	pushw	x
1161  0144 5203          	subw	sp,#3
1162       00000003      OFST:	set	3
1165                     ; 429   uint8_t tmpreg = 0;
1167                     ; 430   uint16_t cr2addr = 0;
1169                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1171                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1173                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1175  0146 9e            	ld	a,xh
1176  0147 48            	sll	a
1177  0148 5f            	clrw	x
1178  0149 97            	ld	xl,a
1179  014a 1c5381        	addw	x,#21377
1180  014d 1f02          	ldw	(OFST-1,sp),x
1182                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1184  014f 1e02          	ldw	x,(OFST-1,sp)
1185  0151 f6            	ld	a,(x)
1186  0152 a4f0          	and	a,#240
1187  0154 6b01          	ld	(OFST-2,sp),a
1189                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1191  0156 7b01          	ld	a,(OFST-2,sp)
1192  0158 1a05          	or	a,(OFST+2,sp)
1193  015a 1e02          	ldw	x,(OFST-1,sp)
1194  015c f7            	ld	(x),a
1195                     ; 443 }
1198  015d 5b05          	addw	sp,#5
1199  015f 81            	ret
1271                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1271                     ; 456 {
1272                     	switch	.text
1273  0160               _DAC_SetChannel1Data:
1275  0160 88            	push	a
1276       00000000      OFST:	set	0
1279                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1281                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1283  0161 a108          	cp	a,#8
1284  0163 2712          	jreq	L505
1285                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1287  0165 5f            	clrw	x
1288  0166 97            	ld	xl,a
1289  0167 7b04          	ld	a,(OFST+4,sp)
1290  0169 d75388        	ld	(21384,x),a
1291                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1293  016c 7b01          	ld	a,(OFST+1,sp)
1294  016e 5f            	clrw	x
1295  016f 97            	ld	xl,a
1296  0170 7b05          	ld	a,(OFST+5,sp)
1297  0172 d75389        	ld	(21385,x),a
1299  0175 2005          	jra	L705
1300  0177               L505:
1301                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1303                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1305  0177 7b05          	ld	a,(OFST+5,sp)
1306  0179 c75390        	ld	21392,a
1307  017c               L705:
1308                     ; 474 }
1311  017c 84            	pop	a
1312  017d 81            	ret
1357                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1357                     ; 487 {
1358                     	switch	.text
1359  017e               _DAC_SetChannel2Data:
1361  017e 88            	push	a
1362       00000000      OFST:	set	0
1365                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1367                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1369  017f a108          	cp	a,#8
1370  0181 2712          	jreq	L335
1371                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1373  0183 5f            	clrw	x
1374  0184 97            	ld	xl,a
1375  0185 7b04          	ld	a,(OFST+4,sp)
1376  0187 d75394        	ld	(21396,x),a
1377                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1379  018a 7b01          	ld	a,(OFST+1,sp)
1380  018c 5f            	clrw	x
1381  018d 97            	ld	xl,a
1382  018e 7b05          	ld	a,(OFST+5,sp)
1383  0190 d75395        	ld	(21397,x),a
1385  0193 2005          	jra	L535
1386  0195               L335:
1387                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1389                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1391  0195 7b05          	ld	a,(OFST+5,sp)
1392  0197 c7539c        	ld	21404,a
1393  019a               L535:
1394                     ; 505 }
1397  019a 84            	pop	a
1398  019b 81            	ret
1461                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1461                     ; 523 {
1462                     	switch	.text
1463  019c               _DAC_SetDualChannelData:
1465  019c 88            	push	a
1466  019d 89            	pushw	x
1467       00000002      OFST:	set	2
1470                     ; 524   uint16_t dchxrdhrhaddr = 0;
1472                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1474                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1476  019e a108          	cp	a,#8
1477  01a0 2727          	jreq	L175
1478                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1480  01a2 a653          	ld	a,#83
1481  01a4 97            	ld	xl,a
1482  01a5 a6a0          	ld	a,#160
1483  01a7 1b03          	add	a,(OFST+1,sp)
1484  01a9 2401          	jrnc	L24
1485  01ab 5c            	incw	x
1486  01ac               L24:
1487  01ac 02            	rlwa	x,a
1488  01ad 1f01          	ldw	(OFST-1,sp),x
1489  01af 01            	rrwa	x,a
1491                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1493  01b0 7b08          	ld	a,(OFST+6,sp)
1494  01b2 1e01          	ldw	x,(OFST-1,sp)
1495  01b4 f7            	ld	(x),a
1496                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1498  01b5 7b09          	ld	a,(OFST+7,sp)
1499  01b7 1e01          	ldw	x,(OFST-1,sp)
1500  01b9 e701          	ld	(1,x),a
1501                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1503  01bb 7b06          	ld	a,(OFST+4,sp)
1504  01bd 1e01          	ldw	x,(OFST-1,sp)
1505  01bf e702          	ld	(2,x),a
1506                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1508  01c1 7b07          	ld	a,(OFST+5,sp)
1509  01c3 1e01          	ldw	x,(OFST-1,sp)
1510  01c5 e703          	ld	(3,x),a
1512  01c7 200a          	jra	L375
1513  01c9               L175:
1514                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1516                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1518  01c9 7b09          	ld	a,(OFST+7,sp)
1519  01cb c753a8        	ld	21416,a
1520                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1522  01ce 7b07          	ld	a,(OFST+5,sp)
1523  01d0 c753a9        	ld	21417,a
1524  01d3               L375:
1525                     ; 549 }
1528  01d3 5b03          	addw	sp,#3
1529  01d5 81            	ret
1583                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1583                     ; 560 {
1584                     	switch	.text
1585  01d6               _DAC_GetDataOutputValue:
1587  01d6 89            	pushw	x
1588       00000002      OFST:	set	2
1591                     ; 561   uint16_t outputdata = 0;
1593                     ; 562   uint16_t tmp = 0;
1595                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1597                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1599  01d7 4d            	tnz	a
1600  01d8 2619          	jrne	L326
1601                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1603  01da c653ac        	ld	a,21420
1604  01dd 5f            	clrw	x
1605  01de 97            	ld	xl,a
1606  01df 4f            	clr	a
1607  01e0 02            	rlwa	x,a
1608  01e1 1f01          	ldw	(OFST-1,sp),x
1610                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1612  01e3 c653ad        	ld	a,21421
1613  01e6 5f            	clrw	x
1614  01e7 97            	ld	xl,a
1615  01e8 01            	rrwa	x,a
1616  01e9 1a02          	or	a,(OFST+0,sp)
1617  01eb 01            	rrwa	x,a
1618  01ec 1a01          	or	a,(OFST-1,sp)
1619  01ee 01            	rrwa	x,a
1620  01ef 1f01          	ldw	(OFST-1,sp),x
1623  01f1 2017          	jra	L526
1624  01f3               L326:
1625                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1627  01f3 c653b0        	ld	a,21424
1628  01f6 5f            	clrw	x
1629  01f7 97            	ld	xl,a
1630  01f8 4f            	clr	a
1631  01f9 02            	rlwa	x,a
1632  01fa 1f01          	ldw	(OFST-1,sp),x
1634                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1636  01fc c653b1        	ld	a,21425
1637  01ff 5f            	clrw	x
1638  0200 97            	ld	xl,a
1639  0201 01            	rrwa	x,a
1640  0202 1a02          	or	a,(OFST+0,sp)
1641  0204 01            	rrwa	x,a
1642  0205 1a01          	or	a,(OFST-1,sp)
1643  0207 01            	rrwa	x,a
1644  0208 1f01          	ldw	(OFST-1,sp),x
1646  020a               L526:
1647                     ; 581   return (uint16_t)outputdata;
1649  020a 1e01          	ldw	x,(OFST-1,sp)
1652  020c 5b02          	addw	sp,#2
1653  020e 81            	ret
1707                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1707                     ; 614 {
1708                     	switch	.text
1709  020f               _DAC_DMACmd:
1711  020f 89            	pushw	x
1712  0210 89            	pushw	x
1713       00000002      OFST:	set	2
1716                     ; 615   uint16_t cr2addr = 0;
1718                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1720                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1722                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1724  0211 9e            	ld	a,xh
1725  0212 48            	sll	a
1726  0213 5f            	clrw	x
1727  0214 97            	ld	xl,a
1728  0215 1c5381        	addw	x,#21377
1729  0218 1f01          	ldw	(OFST-1,sp),x
1731                     ; 624   if (NewState != DISABLE)
1733  021a 0d04          	tnz	(OFST+2,sp)
1734  021c 2708          	jreq	L556
1735                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1737  021e 1e01          	ldw	x,(OFST-1,sp)
1738  0220 f6            	ld	a,(x)
1739  0221 aa10          	or	a,#16
1740  0223 f7            	ld	(x),a
1742  0224 2006          	jra	L756
1743  0226               L556:
1744                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1746  0226 1e01          	ldw	x,(OFST-1,sp)
1747  0228 f6            	ld	a,(x)
1748  0229 a4ef          	and	a,#239
1749  022b f7            	ld	(x),a
1750  022c               L756:
1751                     ; 634 }
1754  022c 5b04          	addw	sp,#4
1755  022e 81            	ret
1832                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1832                     ; 668 {
1833                     	switch	.text
1834  022f               _DAC_ITConfig:
1836  022f 89            	pushw	x
1837  0230 89            	pushw	x
1838       00000002      OFST:	set	2
1841                     ; 669   uint16_t cr2addr = 0;
1843                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1845                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1847                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1849                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1851  0231 9e            	ld	a,xh
1852  0232 48            	sll	a
1853  0233 5f            	clrw	x
1854  0234 97            	ld	xl,a
1855  0235 1c5381        	addw	x,#21377
1856  0238 1f01          	ldw	(OFST-1,sp),x
1858                     ; 679   if (NewState != DISABLE)
1860  023a 0d07          	tnz	(OFST+5,sp)
1861  023c 2708          	jreq	L127
1862                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1864  023e 1e01          	ldw	x,(OFST-1,sp)
1865  0240 f6            	ld	a,(x)
1866  0241 1a04          	or	a,(OFST+2,sp)
1867  0243 f7            	ld	(x),a
1869  0244 2007          	jra	L327
1870  0246               L127:
1871                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1873  0246 1e01          	ldw	x,(OFST-1,sp)
1874  0248 7b04          	ld	a,(OFST+2,sp)
1875  024a 43            	cpl	a
1876  024b f4            	and	a,(x)
1877  024c f7            	ld	(x),a
1878  024d               L327:
1879                     ; 689 }
1882  024d 5b04          	addw	sp,#4
1883  024f 81            	ret
1981                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1981                     ; 705 {
1982                     	switch	.text
1983  0250               _DAC_GetFlagStatus:
1985  0250 89            	pushw	x
1986  0251 88            	push	a
1987       00000001      OFST:	set	1
1990                     ; 706   FlagStatus flagstatus = RESET;
1992                     ; 707   uint8_t flag = 0;
1994                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1996                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1998                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2000  0252 9e            	ld	a,xh
2001  0253 5f            	clrw	x
2002  0254 97            	ld	xl,a
2003  0255 7b03          	ld	a,(OFST+2,sp)
2004  0257 5d            	tnzw	x
2005  0258 2704          	jreq	L45
2006  025a               L65:
2007  025a 48            	sll	a
2008  025b 5a            	decw	x
2009  025c 26fc          	jrne	L65
2010  025e               L45:
2011  025e 6b01          	ld	(OFST+0,sp),a
2013                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
2015  0260 c65385        	ld	a,21381
2016  0263 1501          	bcp	a,(OFST+0,sp)
2017  0265 2706          	jreq	L577
2018                     ; 719     flagstatus = SET;
2020  0267 a601          	ld	a,#1
2021  0269 6b01          	ld	(OFST+0,sp),a
2024  026b 2002          	jra	L777
2025  026d               L577:
2026                     ; 724     flagstatus = RESET;
2028  026d 0f01          	clr	(OFST+0,sp)
2030  026f               L777:
2031                     ; 728   return  flagstatus;
2033  026f 7b01          	ld	a,(OFST+0,sp)
2036  0271 5b03          	addw	sp,#3
2037  0273 81            	ret
2091                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2091                     ; 743 {
2092                     	switch	.text
2093  0274               _DAC_ClearFlag:
2095  0274 89            	pushw	x
2096  0275 88            	push	a
2097       00000001      OFST:	set	1
2100                     ; 744   uint8_t flag = 0;
2102                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2104                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2106                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2108  0276 9e            	ld	a,xh
2109  0277 5f            	clrw	x
2110  0278 97            	ld	xl,a
2111  0279 7b03          	ld	a,(OFST+2,sp)
2112  027b 5d            	tnzw	x
2113  027c 2704          	jreq	L26
2114  027e               L46:
2115  027e 48            	sll	a
2116  027f 5a            	decw	x
2117  0280 26fc          	jrne	L46
2118  0282               L26:
2119  0282 6b01          	ld	(OFST+0,sp),a
2121                     ; 754   DAC->SR = (uint8_t)(~flag);
2123  0284 7b01          	ld	a,(OFST+0,sp)
2124  0286 43            	cpl	a
2125  0287 c75385        	ld	21381,a
2126                     ; 755 }
2129  028a 5b03          	addw	sp,#3
2130  028c 81            	ret
2213                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2213                     ; 771 {
2214                     	switch	.text
2215  028d               _DAC_GetITStatus:
2217  028d 89            	pushw	x
2218  028e 89            	pushw	x
2219       00000002      OFST:	set	2
2222                     ; 772   ITStatus itstatus = RESET;
2224                     ; 773   uint8_t enablestatus = 0;
2226                     ; 774   uint8_t flagstatus = 0;
2228                     ; 775   uint8_t tempreg = 0;
2230                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2232                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2234                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2236  028f 9e            	ld	a,xh
2237  0290 48            	sll	a
2238  0291 48            	sll	a
2239  0292 5f            	clrw	x
2240  0293 97            	ld	xl,a
2241  0294 d65381        	ld	a,(21377,x)
2242  0297 6b02          	ld	(OFST+0,sp),a
2244                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2246  0299 7b03          	ld	a,(OFST+1,sp)
2247  029b 5f            	clrw	x
2248  029c 97            	ld	xl,a
2249  029d 7b04          	ld	a,(OFST+2,sp)
2250  029f 5d            	tnzw	x
2251  02a0 2704          	jreq	L07
2252  02a2               L27:
2253  02a2 48            	sll	a
2254  02a3 5a            	decw	x
2255  02a4 26fc          	jrne	L27
2256  02a6               L07:
2257  02a6 1402          	and	a,(OFST+0,sp)
2258  02a8 6b01          	ld	(OFST-1,sp),a
2260                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2262  02aa a605          	ld	a,#5
2263  02ac 1003          	sub	a,(OFST+1,sp)
2264  02ae 5f            	clrw	x
2265  02af 97            	ld	xl,a
2266  02b0 7b04          	ld	a,(OFST+2,sp)
2267  02b2 5d            	tnzw	x
2268  02b3 2704          	jreq	L47
2269  02b5               L67:
2270  02b5 44            	srl	a
2271  02b6 5a            	decw	x
2272  02b7 26fc          	jrne	L67
2273  02b9               L47:
2274  02b9 c45385        	and	a,21381
2275  02bc 6b02          	ld	(OFST+0,sp),a
2277                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2279  02be 0d02          	tnz	(OFST+0,sp)
2280  02c0 270a          	jreq	L1701
2282  02c2 0d01          	tnz	(OFST-1,sp)
2283  02c4 2706          	jreq	L1701
2284                     ; 790     itstatus = SET;
2286  02c6 a601          	ld	a,#1
2287  02c8 6b02          	ld	(OFST+0,sp),a
2290  02ca 2002          	jra	L3701
2291  02cc               L1701:
2292                     ; 795     itstatus = RESET;
2294  02cc 0f02          	clr	(OFST+0,sp)
2296  02ce               L3701:
2297                     ; 799   return  itstatus;
2299  02ce 7b02          	ld	a,(OFST+0,sp)
2302  02d0 5b04          	addw	sp,#4
2303  02d2 81            	ret
2349                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2349                     ; 814 {
2350                     	switch	.text
2351  02d3               _DAC_ClearITPendingBit:
2353  02d3 89            	pushw	x
2354       00000000      OFST:	set	0
2357                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2359                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2361                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2363  02d4 9e            	ld	a,xh
2364  02d5 a005          	sub	a,#5
2365  02d7 40            	neg	a
2366  02d8 5f            	clrw	x
2367  02d9 97            	ld	xl,a
2368  02da 7b02          	ld	a,(OFST+2,sp)
2369  02dc 5d            	tnzw	x
2370  02dd 2704          	jreq	L201
2371  02df               L401:
2372  02df 44            	srl	a
2373  02e0 5a            	decw	x
2374  02e1 26fc          	jrne	L401
2375  02e3               L201:
2376  02e3 43            	cpl	a
2377  02e4 c75385        	ld	21381,a
2378                     ; 821 }
2381  02e7 85            	popw	x
2382  02e8 81            	ret
2395                     	xdef	_DAC_ClearITPendingBit
2396                     	xdef	_DAC_GetITStatus
2397                     	xdef	_DAC_ClearFlag
2398                     	xdef	_DAC_GetFlagStatus
2399                     	xdef	_DAC_ITConfig
2400                     	xdef	_DAC_DMACmd
2401                     	xdef	_DAC_GetDataOutputValue
2402                     	xdef	_DAC_SetDualChannelData
2403                     	xdef	_DAC_SetChannel2Data
2404                     	xdef	_DAC_SetChannel1Data
2405                     	xdef	_DAC_SetTriangleWaveAmplitude
2406                     	xdef	_DAC_SetNoiseWaveLFSR
2407                     	xdef	_DAC_WaveGenerationCmd
2408                     	xdef	_DAC_DualSoftwareTriggerCmd
2409                     	xdef	_DAC_SoftwareTriggerCmd
2410                     	xdef	_DAC_Cmd
2411                     	xdef	_DAC_Init
2412                     	xdef	_DAC_DeInit
2431                     	end
