   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  95                     ; 232 ErrorStatus RTC_DeInit(void)
  95                     ; 233 {
  97                     	switch	.text
  98  0000               _RTC_DeInit:
 100  0000 5205          	subw	sp,#5
 101       00000005      OFST:	set	5
 104                     ; 234   ErrorStatus status = ERROR;
 106                     ; 235   uint16_t wutwfcount = 0;
 108  0002 5f            	clrw	x
 109  0003 1f02          	ldw	(OFST-3,sp),x
 111                     ; 236   uint16_t recalpfcount = 0;
 113  0005 5f            	clrw	x
 114  0006 1f04          	ldw	(OFST-1,sp),x
 116                     ; 239   RTC->WPR = 0xCA;
 118  0008 35ca5159      	mov	20825,#202
 119                     ; 240   RTC->WPR = 0x53;
 121  000c 35535159      	mov	20825,#83
 122                     ; 243   if (RTC_EnterInitMode() == ERROR)
 124  0010 cd0161        	call	_RTC_EnterInitMode
 126  0013 4d            	tnz	a
 127  0014 260b          	jrne	L35
 128                     ; 245     status = ERROR;
 130  0016 0f01          	clr	(OFST-4,sp)
 132                     ; 247     RTC->WPR = 0xFF; 
 134  0018 35ff5159      	mov	20825,#255
 136  001c               L55:
 137                     ; 343   return (ErrorStatus)status;
 139  001c 7b01          	ld	a,(OFST-4,sp)
 142  001e 5b05          	addw	sp,#5
 143  0020 81            	ret
 144  0021               L35:
 145                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 147  0021 725f5140      	clr	20800
 148                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 150  0025 725f5141      	clr	20801
 151                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 153  0029 725f5142      	clr	20802
 154                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 156  002d 35015144      	mov	20804,#1
 157                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 159  0031 35215145      	mov	20805,#33
 160                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 162  0035 725f5146      	clr	20806
 163                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 165  0039 725f5150      	clr	20816
 166                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 168  003d 35ff5151      	mov	20817,#255
 169                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 171  0041 357f5152      	mov	20818,#127
 172                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 174  0045 725f516c      	clr	20844
 175                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 177  0049 725f516d      	clr	20845
 178                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 180  004d 725f5148      	clr	20808
 181                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 183  0051 725f5149      	clr	20809
 184                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 186  0055 725f514a      	clr	20810
 188  0059 200b          	jra	L36
 189  005b               L75:
 190                     ; 278       wutwfcount++;
 192  005b 1e02          	ldw	x,(OFST-3,sp)
 193  005d 1c0001        	addw	x,#1
 194  0060 1f02          	ldw	(OFST-3,sp),x
 196                     ; 279       RTC->ISR1 = 0;
 198  0062 725f514c      	clr	20812
 199  0066               L36:
 200                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 202  0066 c6514c        	ld	a,20812
 203  0069 a504          	bcp	a,#4
 204  006b 2607          	jrne	L76
 206  006d 1e02          	ldw	x,(OFST-3,sp)
 207  006f a3ffff        	cpw	x,#65535
 208  0072 26e7          	jrne	L75
 209  0074               L76:
 210                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 212  0074 c6514c        	ld	a,20812
 213  0077 a504          	bcp	a,#4
 214  0079 2608          	jrne	L17
 215                     ; 284       status = ERROR;
 217  007b 0f01          	clr	(OFST-4,sp)
 219                     ; 286       RTC->WPR = 0xFF; 
 221  007d 35ff5159      	mov	20825,#255
 223  0081 2099          	jra	L55
 224  0083               L17:
 225                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 227  0083 725f5148      	clr	20808
 228                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 230  0087 35ff5154      	mov	20820,#255
 231                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 233  008b 35ff5155      	mov	20821,#255
 234                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 236  008f 725f515c      	clr	20828
 237                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 239  0093 725f515d      	clr	20829
 240                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 242  0097 725f515e      	clr	20830
 243                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 245  009b 725f515f      	clr	20831
 246                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 248  009f 725f5164      	clr	20836
 249                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 251  00a3 725f5165      	clr	20837
 252                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 254  00a7 725f5166      	clr	20838
 255                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 257  00ab 725f514c      	clr	20812
 258                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 260  00af 725f514d      	clr	20813
 261                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 263  00b3 c6514c        	ld	a,20812
 264  00b6 a502          	bcp	a,#2
 265  00b8 2717          	jreq	L57
 267  00ba 2007          	jra	L101
 268  00bc               L77:
 269                     ; 315           recalpfcount++;
 271  00bc 1e04          	ldw	x,(OFST-1,sp)
 272  00be 1c0001        	addw	x,#1
 273  00c1 1f04          	ldw	(OFST-1,sp),x
 275  00c3               L101:
 276                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 278  00c3 c6514c        	ld	a,20812
 279  00c6 a502          	bcp	a,#2
 280  00c8 2707          	jreq	L57
 282  00ca 1e04          	ldw	x,(OFST-1,sp)
 283  00cc a3ffff        	cpw	x,#65535
 284  00cf 26eb          	jrne	L77
 285  00d1               L57:
 286                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 288  00d1 c6514c        	ld	a,20812
 289  00d4 a502          	bcp	a,#2
 290  00d6 2618          	jrne	L701
 291                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 293  00d8 725f516a      	clr	20842
 294                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 296  00dc 725f516b      	clr	20843
 297                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 299  00e0 cd01a1        	call	_RTC_WaitForSynchro
 301  00e3 4d            	tnz	a
 302  00e4 2604          	jrne	L111
 303                     ; 325           status = ERROR;
 305  00e6 0f01          	clr	(OFST-4,sp)
 308  00e8 2008          	jra	L511
 309  00ea               L111:
 310                     ; 329           status = SUCCESS;
 312  00ea a601          	ld	a,#1
 313  00ec 6b01          	ld	(OFST-4,sp),a
 315  00ee 2002          	jra	L511
 316  00f0               L701:
 317                     ; 334         status = ERROR;
 319  00f0 0f01          	clr	(OFST-4,sp)
 321  00f2               L511:
 322                     ; 338       RTC->WPR = 0xFF; 
 324  00f2 35ff5159      	mov	20825,#255
 325  00f6 ac1c001c      	jpf	L55
 425                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 425                     ; 360 {
 426                     	switch	.text
 427  00fa               _RTC_Init:
 429  00fa 89            	pushw	x
 430  00fb 88            	push	a
 431       00000001      OFST:	set	1
 434                     ; 361   ErrorStatus status = ERROR;
 436                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 438                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 440                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 442                     ; 369   RTC->WPR = 0xCA;
 444  00fc 35ca5159      	mov	20825,#202
 445                     ; 370   RTC->WPR = 0x53;
 447  0100 35535159      	mov	20825,#83
 448                     ; 373   if (RTC_EnterInitMode() == ERROR)
 450  0104 ad5b          	call	_RTC_EnterInitMode
 452  0106 4d            	tnz	a
 453  0107 2604          	jrne	L761
 454                     ; 375     status = ERROR;
 456  0109 0f01          	clr	(OFST+0,sp)
 459  010b 202d          	jra	L171
 460  010d               L761:
 461                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 463  010d 721d5148      	bres	20808,#6
 464                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 466  0111 1e02          	ldw	x,(OFST+1,sp)
 467  0113 c65148        	ld	a,20808
 468  0116 fa            	or	a,(x)
 469  0117 c75148        	ld	20808,a
 470                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 472  011a 1e02          	ldw	x,(OFST+1,sp)
 473  011c ee02          	ldw	x,(2,x)
 474  011e 4f            	clr	a
 475  011f 01            	rrwa	x,a
 476  0120 9f            	ld	a,xl
 477  0121 c75150        	ld	20816,a
 478                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 480  0124 1e02          	ldw	x,(OFST+1,sp)
 481  0126 e603          	ld	a,(3,x)
 482  0128 c75151        	ld	20817,a
 483                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 485  012b 1e02          	ldw	x,(OFST+1,sp)
 486  012d e601          	ld	a,(1,x)
 487  012f c75152        	ld	20818,a
 488                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 490  0132 721f514c      	bres	20812,#7
 491                     ; 393     status = SUCCESS;
 493  0136 a601          	ld	a,#1
 494  0138 6b01          	ld	(OFST+0,sp),a
 496  013a               L171:
 497                     ; 397   RTC->WPR = 0xFF; 
 499  013a 35ff5159      	mov	20825,#255
 500                     ; 400   return (ErrorStatus)(status);
 502  013e 7b01          	ld	a,(OFST+0,sp)
 505  0140 5b03          	addw	sp,#3
 506  0142 81            	ret
 543                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 543                     ; 411 {
 544                     	switch	.text
 545  0143               _RTC_StructInit:
 549                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 551  0143 7f            	clr	(x)
 552                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 554  0144 a67f          	ld	a,#127
 555  0146 e701          	ld	(1,x),a
 556                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 558  0148 90ae00ff      	ldw	y,#255
 559  014c ef02          	ldw	(2,x),y
 560                     ; 420 }
 563  014e 81            	ret
 619                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 619                     ; 431 {
 620                     	switch	.text
 621  014f               _RTC_WriteProtectionCmd:
 625                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 627                     ; 435   if (NewState != DISABLE)
 629  014f 4d            	tnz	a
 630  0150 2706          	jreq	L142
 631                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 633  0152 35ff5159      	mov	20825,#255
 635  0156 2008          	jra	L342
 636  0158               L142:
 637                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 639  0158 35ca5159      	mov	20825,#202
 640                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 642  015c 35535159      	mov	20825,#83
 643  0160               L342:
 644                     ; 446 }
 647  0160 81            	ret
 692                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 692                     ; 459 {
 693                     	switch	.text
 694  0161               _RTC_EnterInitMode:
 696  0161 5203          	subw	sp,#3
 697       00000003      OFST:	set	3
 700                     ; 460   ErrorStatus status = ERROR;
 702                     ; 461   uint16_t initfcount = 0;
 704  0163 5f            	clrw	x
 705  0164 1f02          	ldw	(OFST-1,sp),x
 707                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 709  0166 c6514c        	ld	a,20812
 710  0169 a540          	bcp	a,#64
 711  016b 261b          	jrne	L762
 712                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 714  016d 3580514c      	mov	20812,#128
 716  0171 2007          	jra	L572
 717  0173               L172:
 718                     ; 472       initfcount++;
 720  0173 1e02          	ldw	x,(OFST-1,sp)
 721  0175 1c0001        	addw	x,#1
 722  0178 1f02          	ldw	(OFST-1,sp),x
 724  017a               L572:
 725                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 727  017a c6514c        	ld	a,20812
 728  017d a540          	bcp	a,#64
 729  017f 2607          	jrne	L762
 731  0181 1e02          	ldw	x,(OFST-1,sp)
 732  0183 a3ffff        	cpw	x,#65535
 733  0186 26eb          	jrne	L172
 734  0188               L762:
 735                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 737  0188 c6514c        	ld	a,20812
 738  018b a540          	bcp	a,#64
 739  018d 2604          	jrne	L303
 740                     ; 478     status = ERROR;
 742  018f 0f01          	clr	(OFST-2,sp)
 745  0191 2004          	jra	L503
 746  0193               L303:
 747                     ; 482     status = SUCCESS;
 749  0193 a601          	ld	a,#1
 750  0195 6b01          	ld	(OFST-2,sp),a
 752  0197               L503:
 753                     ; 485   return (ErrorStatus)status;
 755  0197 7b01          	ld	a,(OFST-2,sp)
 758  0199 5b03          	addw	sp,#3
 759  019b 81            	ret
 782                     ; 498 void RTC_ExitInitMode(void)
 782                     ; 499 {
 783                     	switch	.text
 784  019c               _RTC_ExitInitMode:
 788                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 790  019c 721f514c      	bres	20812,#7
 791                     ; 502 }
 794  01a0 81            	ret
 839                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 839                     ; 528 {
 840                     	switch	.text
 841  01a1               _RTC_WaitForSynchro:
 843  01a1 5203          	subw	sp,#3
 844       00000003      OFST:	set	3
 847                     ; 529   uint16_t rsfcount = 0;
 849  01a3 5f            	clrw	x
 850  01a4 1f02          	ldw	(OFST-1,sp),x
 852                     ; 530   ErrorStatus status = ERROR;
 854                     ; 533   RTC->WPR = 0xCA;
 856  01a6 35ca5159      	mov	20825,#202
 857                     ; 534   RTC->WPR = 0x53;
 859  01aa 35535159      	mov	20825,#83
 860                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 862  01ae c6514c        	ld	a,20812
 863  01b1 a45f          	and	a,#95
 864  01b3 c7514c        	ld	20812,a
 866  01b6 2007          	jra	L343
 867  01b8               L143:
 868                     ; 542     rsfcount++;
 870  01b8 1e02          	ldw	x,(OFST-1,sp)
 871  01ba 1c0001        	addw	x,#1
 872  01bd 1f02          	ldw	(OFST-1,sp),x
 874  01bf               L343:
 875                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 877  01bf c6514c        	ld	a,20812
 878  01c2 a520          	bcp	a,#32
 879  01c4 2607          	jrne	L743
 881  01c6 1e02          	ldw	x,(OFST-1,sp)
 882  01c8 a3ffff        	cpw	x,#65535
 883  01cb 26eb          	jrne	L143
 884  01cd               L743:
 885                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 887  01cd c6514c        	ld	a,20812
 888  01d0 a520          	bcp	a,#32
 889  01d2 2706          	jreq	L153
 890                     ; 548     status = SUCCESS;
 892  01d4 a601          	ld	a,#1
 893  01d6 6b01          	ld	(OFST-2,sp),a
 896  01d8 2002          	jra	L353
 897  01da               L153:
 898                     ; 552     status = ERROR;
 900  01da 0f01          	clr	(OFST-2,sp)
 902  01dc               L353:
 903                     ; 556   RTC->WPR = 0xFF; 
 905  01dc 35ff5159      	mov	20825,#255
 906                     ; 558   return (ErrorStatus)status;
 908  01e0 7b01          	ld	a,(OFST-2,sp)
 911  01e2 5b03          	addw	sp,#3
 912  01e4 81            	ret
 947                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 947                     ; 569 {
 948                     	switch	.text
 949  01e5               _RTC_RatioCmd:
 953                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 955                     ; 574   RTC->WPR = 0xCA;
 957  01e5 35ca5159      	mov	20825,#202
 958                     ; 575   RTC->WPR = 0x53;
 960  01e9 35535159      	mov	20825,#83
 961                     ; 577   if (NewState != DISABLE)
 963  01ed 4d            	tnz	a
 964  01ee 2706          	jreq	L373
 965                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 967  01f0 721a5148      	bset	20808,#5
 969  01f4 2004          	jra	L573
 970  01f6               L373:
 971                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 973  01f6 721b5148      	bres	20808,#5
 974  01fa               L573:
 975                     ; 589   RTC->WPR = 0xFF; 
 977  01fa 35ff5159      	mov	20825,#255
 978                     ; 590 }
 981  01fe 81            	ret
1017                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1017                     ; 599 {
1018                     	switch	.text
1019  01ff               _RTC_BypassShadowCmd:
1023                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1025                     ; 604   RTC->WPR = 0xCA;
1027  01ff 35ca5159      	mov	20825,#202
1028                     ; 605   RTC->WPR = 0x53;
1030  0203 35535159      	mov	20825,#83
1031                     ; 607   if (NewState != DISABLE)
1033  0207 4d            	tnz	a
1034  0208 2706          	jreq	L514
1035                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1037  020a 72185148      	bset	20808,#4
1039  020e 2004          	jra	L714
1040  0210               L514:
1041                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1043  0210 72195148      	bres	20808,#4
1044  0214               L714:
1045                     ; 619   RTC->WPR = 0xFF; 
1047  0214 35ff5159      	mov	20825,#255
1048                     ; 620 }
1051  0218 81            	ret
1199                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1199                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1199                     ; 661 {
1200                     	switch	.text
1201  0219               _RTC_SetTime:
1203  0219 88            	push	a
1204  021a 88            	push	a
1205       00000001      OFST:	set	1
1208                     ; 662   ErrorStatus status = ERROR;
1210                     ; 663   uint8_t temp = 0;
1212                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1214                     ; 668   if (RTC_Format == RTC_Format_BIN)
1216  021b 4d            	tnz	a
1217  021c 2609          	jrne	L315
1218                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1220  021e c65148        	ld	a,20808
1221  0221 a540          	bcp	a,#64
1222  0223 2700          	jreq	L515
1223                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1225                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1228  0225               L515:
1229                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1231                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1233                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1236  0225 2007          	jra	L125
1237  0227               L315:
1238                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1240  0227 c65148        	ld	a,20808
1241  022a a540          	bcp	a,#64
1242  022c 2700          	jreq	L325
1243                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1245                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1248  022e               L325:
1249                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1251                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1253                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1255  022e               L125:
1256                     ; 701   RTC->WPR = 0xCA;
1258  022e 35ca5159      	mov	20825,#202
1259                     ; 702   RTC->WPR = 0x53;
1261  0232 35535159      	mov	20825,#83
1262                     ; 705   if (RTC_EnterInitMode() == ERROR)
1264  0236 cd0161        	call	_RTC_EnterInitMode
1266  0239 4d            	tnz	a
1267  023a 2608          	jrne	L725
1268                     ; 707     status = ERROR;
1270  023c 0f01          	clr	(OFST+0,sp)
1272                     ; 709     RTC->WPR = 0xFF; 
1274  023e 35ff5159      	mov	20825,#255
1276  0242 2072          	jra	L135
1277  0244               L725:
1278                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1280  0244 c65148        	ld	a,20808
1281  0247 a540          	bcp	a,#64
1282  0249 2708          	jreq	L335
1283                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1285                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1287  024b 1e05          	ldw	x,(OFST+4,sp)
1288  024d e603          	ld	a,(3,x)
1289  024f 6b01          	ld	(OFST+0,sp),a
1292  0251 2002          	jra	L535
1293  0253               L335:
1294                     ; 721       temp = 0;
1296  0253 0f01          	clr	(OFST+0,sp)
1298  0255               L535:
1299                     ; 724     if (RTC_Format != RTC_Format_BIN)
1301  0255 0d02          	tnz	(OFST+1,sp)
1302  0257 2718          	jreq	L735
1303                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1305  0259 1e05          	ldw	x,(OFST+4,sp)
1306  025b e602          	ld	a,(2,x)
1307  025d c75140        	ld	20800,a
1308                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1310  0260 1e05          	ldw	x,(OFST+4,sp)
1311  0262 e601          	ld	a,(1,x)
1312  0264 c75141        	ld	20801,a
1313                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1315  0267 1e05          	ldw	x,(OFST+4,sp)
1316  0269 f6            	ld	a,(x)
1317  026a 1a01          	or	a,(OFST+0,sp)
1318  026c c75142        	ld	20802,a
1320  026f 201f          	jra	L145
1321  0271               L735:
1322                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1324  0271 1e05          	ldw	x,(OFST+4,sp)
1325  0273 e602          	ld	a,(2,x)
1326  0275 cd0994        	call	L3_ByteToBcd2
1328  0278 c75140        	ld	20800,a
1329                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1331  027b 1e05          	ldw	x,(OFST+4,sp)
1332  027d e601          	ld	a,(1,x)
1333  027f cd0994        	call	L3_ByteToBcd2
1335  0282 c75141        	ld	20801,a
1336                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1338  0285 1e05          	ldw	x,(OFST+4,sp)
1339  0287 f6            	ld	a,(x)
1340  0288 cd0994        	call	L3_ByteToBcd2
1342  028b 1a01          	or	a,(OFST+0,sp)
1343  028d c75142        	ld	20802,a
1344  0290               L145:
1345                     ; 737     (void)(RTC->DR3);
1347  0290 c65146        	ld	a,20806
1348                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1350  0293 721f514c      	bres	20812,#7
1351                     ; 743     RTC->WPR = 0xFF; 
1353  0297 35ff5159      	mov	20825,#255
1354                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1356  029b c65148        	ld	a,20808
1357  029e a510          	bcp	a,#16
1358  02a0 2610          	jrne	L345
1359                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1361  02a2 cd01a1        	call	_RTC_WaitForSynchro
1363  02a5 4d            	tnz	a
1364  02a6 2604          	jrne	L545
1365                     ; 750         status = ERROR;
1367  02a8 0f01          	clr	(OFST+0,sp)
1370  02aa 200a          	jra	L135
1371  02ac               L545:
1372                     ; 754         status = SUCCESS;
1374  02ac a601          	ld	a,#1
1375  02ae 6b01          	ld	(OFST+0,sp),a
1377  02b0 2004          	jra	L135
1378  02b2               L345:
1379                     ; 759       status = SUCCESS;
1381  02b2 a601          	ld	a,#1
1382  02b4 6b01          	ld	(OFST+0,sp),a
1384  02b6               L135:
1385                     ; 763   return (ErrorStatus)status;
1387  02b6 7b01          	ld	a,(OFST+0,sp)
1390  02b8 85            	popw	x
1391  02b9 81            	ret
1428                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1428                     ; 776 {
1429                     	switch	.text
1430  02ba               _RTC_TimeStructInit:
1434                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1436  02ba 6f03          	clr	(3,x)
1437                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1439  02bc 7f            	clr	(x)
1440                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1442  02bd 6f01          	clr	(1,x)
1443                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1445  02bf 6f02          	clr	(2,x)
1446                     ; 782 }
1449  02c1 81            	ret
1506                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1506                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1506                     ; 800 {
1507                     	switch	.text
1508  02c2               _RTC_GetTime:
1510  02c2 88            	push	a
1511  02c3 88            	push	a
1512       00000001      OFST:	set	1
1515                     ; 801   uint8_t  tmpreg = 0;
1517                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1519                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1521  02c4 1e05          	ldw	x,(OFST+4,sp)
1522  02c6 c65140        	ld	a,20800
1523  02c9 e702          	ld	(2,x),a
1524                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1526  02cb 1e05          	ldw	x,(OFST+4,sp)
1527  02cd c65141        	ld	a,20801
1528  02d0 e701          	ld	(1,x),a
1529                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1531  02d2 c65142        	ld	a,20802
1532  02d5 6b01          	ld	(OFST+0,sp),a
1534                     ; 817   (void) (RTC->DR3) ;
1536  02d7 c65146        	ld	a,20806
1537                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1539  02da 7b01          	ld	a,(OFST+0,sp)
1540  02dc a4bf          	and	a,#191
1541  02de 1e05          	ldw	x,(OFST+4,sp)
1542  02e0 f7            	ld	(x),a
1543                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1545  02e1 7b01          	ld	a,(OFST+0,sp)
1546  02e3 a440          	and	a,#64
1547  02e5 1e05          	ldw	x,(OFST+4,sp)
1548  02e7 e703          	ld	(3,x),a
1549                     ; 827   if (RTC_Format == RTC_Format_BIN)
1551  02e9 0d02          	tnz	(OFST+1,sp)
1552  02eb 261f          	jrne	L326
1553                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1555  02ed 1e05          	ldw	x,(OFST+4,sp)
1556  02ef f6            	ld	a,(x)
1557  02f0 cd09b3        	call	L5_Bcd2ToByte
1559  02f3 1e05          	ldw	x,(OFST+4,sp)
1560  02f5 f7            	ld	(x),a
1561                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1563  02f6 1e05          	ldw	x,(OFST+4,sp)
1564  02f8 e601          	ld	a,(1,x)
1565  02fa cd09b3        	call	L5_Bcd2ToByte
1567  02fd 1e05          	ldw	x,(OFST+4,sp)
1568  02ff e701          	ld	(1,x),a
1569                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1571  0301 1e05          	ldw	x,(OFST+4,sp)
1572  0303 e602          	ld	a,(2,x)
1573  0305 cd09b3        	call	L5_Bcd2ToByte
1575  0308 1e05          	ldw	x,(OFST+4,sp)
1576  030a e702          	ld	(2,x),a
1577  030c               L326:
1578                     ; 834 }
1581  030c 85            	popw	x
1582  030d 81            	ret
1634                     ; 845 uint16_t RTC_GetSubSecond(void)
1634                     ; 846 {
1635                     	switch	.text
1636  030e               _RTC_GetSubSecond:
1638  030e 5206          	subw	sp,#6
1639       00000006      OFST:	set	6
1642                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1646                     ; 848   uint16_t ssrreg = 0;
1648                     ; 851   ssrhreg = RTC->SSRH;
1650  0310 c65157        	ld	a,20823
1651  0313 6b03          	ld	(OFST-3,sp),a
1653                     ; 852   ssrlreg = RTC->SSRL;
1655  0315 c65158        	ld	a,20824
1656  0318 6b04          	ld	(OFST-2,sp),a
1658                     ; 855   (void) (RTC->DR3);
1660  031a c65146        	ld	a,20806
1661                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1663  031d 7b04          	ld	a,(OFST-2,sp)
1664  031f 5f            	clrw	x
1665  0320 97            	ld	xl,a
1666  0321 1f01          	ldw	(OFST-5,sp),x
1668  0323 7b03          	ld	a,(OFST-3,sp)
1669  0325 5f            	clrw	x
1670  0326 97            	ld	xl,a
1671  0327 4f            	clr	a
1672  0328 02            	rlwa	x,a
1673  0329 01            	rrwa	x,a
1674  032a 1a02          	or	a,(OFST-4,sp)
1675  032c 01            	rrwa	x,a
1676  032d 1a01          	or	a,(OFST-5,sp)
1677  032f 01            	rrwa	x,a
1678  0330 1f05          	ldw	(OFST-1,sp),x
1680                     ; 859   return (uint16_t)(ssrreg);
1682  0332 1e05          	ldw	x,(OFST-1,sp)
1685  0334 5b06          	addw	sp,#6
1686  0336 81            	ret
1938                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1938                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1938                     ; 878 {
1939                     	switch	.text
1940  0337               _RTC_SetDate:
1942  0337 88            	push	a
1943  0338 89            	pushw	x
1944       00000002      OFST:	set	2
1947                     ; 879   ErrorStatus status = ERROR;
1949                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1951  0339 4d            	tnz	a
1952  033a 2616          	jrne	L1001
1954  033c 1e06          	ldw	x,(OFST+4,sp)
1955  033e e601          	ld	a,(1,x)
1956  0340 a410          	and	a,#16
1957  0342 a110          	cp	a,#16
1958  0344 260c          	jrne	L1001
1959                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1961  0346 1e06          	ldw	x,(OFST+4,sp)
1962  0348 e601          	ld	a,(1,x)
1963  034a a4ef          	and	a,#239
1964  034c ab0a          	add	a,#10
1965  034e 1e06          	ldw	x,(OFST+4,sp)
1966  0350 e701          	ld	(1,x),a
1967  0352               L1001:
1968                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1970                     ; 888   if (RTC_Format == RTC_Format_BIN)
1972  0352 0d03          	tnz	(OFST+1,sp)
1973  0354 2600          	jrne	L3001
1974                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1976                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1978                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1980                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1982                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1985  0356               L3001:
1986                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1988                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1990                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1992                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1994                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1996                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1998                     ; 907   RTC->WPR = 0xCA;
2000  0356 35ca5159      	mov	20825,#202
2001                     ; 908   RTC->WPR = 0x53;
2003  035a 35535159      	mov	20825,#83
2004                     ; 911   if (RTC_EnterInitMode() == ERROR)
2006  035e cd0161        	call	_RTC_EnterInitMode
2008  0361 4d            	tnz	a
2009  0362 2608          	jrne	L7001
2010                     ; 913     status = ERROR;
2012  0364 0f02          	clr	(OFST+0,sp)
2014                     ; 915     RTC->WPR = 0xFF; 
2016  0366 35ff5159      	mov	20825,#255
2018  036a 2073          	jra	L1101
2019  036c               L7001:
2020                     ; 919     (void)(RTC->TR1);
2022  036c c65140        	ld	a,20800
2023                     ; 922     if (RTC_Format != RTC_Format_BIN)
2025  036f 0d03          	tnz	(OFST+1,sp)
2026  0371 271f          	jreq	L3101
2027                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2029  0373 1e06          	ldw	x,(OFST+4,sp)
2030  0375 e602          	ld	a,(2,x)
2031  0377 c75144        	ld	20804,a
2032                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2034  037a 1e06          	ldw	x,(OFST+4,sp)
2035  037c f6            	ld	a,(x)
2036  037d 97            	ld	xl,a
2037  037e a620          	ld	a,#32
2038  0380 42            	mul	x,a
2039  0381 9f            	ld	a,xl
2040  0382 1e06          	ldw	x,(OFST+4,sp)
2041  0384 ea01          	or	a,(1,x)
2042  0386 c75145        	ld	20805,a
2043                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2045  0389 1e06          	ldw	x,(OFST+4,sp)
2046  038b e603          	ld	a,(3,x)
2047  038d c75146        	ld	20806,a
2049  0390 202a          	jra	L5101
2050  0392               L3101:
2051                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2053  0392 1e06          	ldw	x,(OFST+4,sp)
2054  0394 e602          	ld	a,(2,x)
2055  0396 cd0994        	call	L3_ByteToBcd2
2057  0399 c75144        	ld	20804,a
2058                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2060  039c 1e06          	ldw	x,(OFST+4,sp)
2061  039e f6            	ld	a,(x)
2062  039f 97            	ld	xl,a
2063  03a0 a620          	ld	a,#32
2064  03a2 42            	mul	x,a
2065  03a3 9f            	ld	a,xl
2066  03a4 6b01          	ld	(OFST-1,sp),a
2068  03a6 1e06          	ldw	x,(OFST+4,sp)
2069  03a8 e601          	ld	a,(1,x)
2070  03aa cd0994        	call	L3_ByteToBcd2
2072  03ad 1a01          	or	a,(OFST-1,sp)
2073  03af c75145        	ld	20805,a
2074                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2076  03b2 1e06          	ldw	x,(OFST+4,sp)
2077  03b4 e603          	ld	a,(3,x)
2078  03b6 cd0994        	call	L3_ByteToBcd2
2080  03b9 c75146        	ld	20806,a
2081  03bc               L5101:
2082                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2084  03bc 721f514c      	bres	20812,#7
2085                     ; 939     RTC->WPR = 0xFF; 
2087  03c0 35ff5159      	mov	20825,#255
2088                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2090  03c4 c65148        	ld	a,20808
2091  03c7 a510          	bcp	a,#16
2092  03c9 2610          	jrne	L7101
2093                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2095  03cb cd01a1        	call	_RTC_WaitForSynchro
2097  03ce 4d            	tnz	a
2098  03cf 2604          	jrne	L1201
2099                     ; 946         status = ERROR;
2101  03d1 0f02          	clr	(OFST+0,sp)
2104  03d3 200a          	jra	L1101
2105  03d5               L1201:
2106                     ; 950         status = SUCCESS;
2108  03d5 a601          	ld	a,#1
2109  03d7 6b02          	ld	(OFST+0,sp),a
2111  03d9 2004          	jra	L1101
2112  03db               L7101:
2113                     ; 955       status = SUCCESS;
2115  03db a601          	ld	a,#1
2116  03dd 6b02          	ld	(OFST+0,sp),a
2118  03df               L1101:
2119                     ; 959   return (ErrorStatus)status;
2121  03df 7b02          	ld	a,(OFST+0,sp)
2124  03e1 5b03          	addw	sp,#3
2125  03e3 81            	ret
2162                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2162                     ; 969 {
2163                     	switch	.text
2164  03e4               _RTC_DateStructInit:
2168                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2170  03e4 a601          	ld	a,#1
2171  03e6 f7            	ld	(x),a
2172                     ; 972   RTC_DateStruct->RTC_Date = 1;
2174  03e7 a601          	ld	a,#1
2175  03e9 e702          	ld	(2,x),a
2176                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2178  03eb a601          	ld	a,#1
2179  03ed e701          	ld	(1,x),a
2180                     ; 974   RTC_DateStruct->RTC_Year = 0;
2182  03ef 6f03          	clr	(3,x)
2183                     ; 975 }
2186  03f1 81            	ret
2243                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2243                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2243                     ; 990 {
2244                     	switch	.text
2245  03f2               _RTC_GetDate:
2247  03f2 88            	push	a
2248  03f3 88            	push	a
2249       00000001      OFST:	set	1
2252                     ; 991   uint8_t tmpreg = 0;
2254                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2256                     ; 997   (void) (RTC->TR1) ;
2258  03f4 c65140        	ld	a,20800
2259                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2261  03f7 1e05          	ldw	x,(OFST+4,sp)
2262  03f9 c65144        	ld	a,20804
2263  03fc e702          	ld	(2,x),a
2264                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2266  03fe c65145        	ld	a,20805
2267  0401 6b01          	ld	(OFST+0,sp),a
2269                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2271  0403 1e05          	ldw	x,(OFST+4,sp)
2272  0405 c65146        	ld	a,20806
2273  0408 e703          	ld	(3,x),a
2274                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2276  040a 7b01          	ld	a,(OFST+0,sp)
2277  040c a41f          	and	a,#31
2278  040e 1e05          	ldw	x,(OFST+4,sp)
2279  0410 e701          	ld	(1,x),a
2280                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2282  0412 7b01          	ld	a,(OFST+0,sp)
2283  0414 a4e0          	and	a,#224
2284  0416 4e            	swap	a
2285  0417 44            	srl	a
2286  0418 a407          	and	a,#7
2287  041a 1e05          	ldw	x,(OFST+4,sp)
2288  041c f7            	ld	(x),a
2289                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2291  041d 0d02          	tnz	(OFST+1,sp)
2292  041f 2621          	jrne	L7701
2293                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2295  0421 1e05          	ldw	x,(OFST+4,sp)
2296  0423 e603          	ld	a,(3,x)
2297  0425 cd09b3        	call	L5_Bcd2ToByte
2299  0428 1e05          	ldw	x,(OFST+4,sp)
2300  042a e703          	ld	(3,x),a
2301                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2303  042c 1e05          	ldw	x,(OFST+4,sp)
2304  042e e601          	ld	a,(1,x)
2305  0430 cd09b3        	call	L5_Bcd2ToByte
2307  0433 1e05          	ldw	x,(OFST+4,sp)
2308  0435 e701          	ld	(1,x),a
2309                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2311  0437 1e05          	ldw	x,(OFST+4,sp)
2312  0439 e602          	ld	a,(2,x)
2313  043b cd09b3        	call	L5_Bcd2ToByte
2315  043e 1e05          	ldw	x,(OFST+4,sp)
2316  0440 e702          	ld	(2,x),a
2317  0442               L7701:
2318                     ; 1014 }
2321  0442 85            	popw	x
2322  0443 81            	ret
2471                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2471                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2471                     ; 1046 {
2472                     	switch	.text
2473  0444               _RTC_SetAlarm:
2475  0444 88            	push	a
2476  0445 5205          	subw	sp,#5
2477       00000005      OFST:	set	5
2480                     ; 1047   uint8_t tmpreg1 = 0;
2482                     ; 1048   uint8_t tmpreg2 = 0;
2484                     ; 1049   uint8_t tmpreg3 = 0;
2486                     ; 1050   uint8_t tmpreg4 = 0;
2488                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2490                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2492                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2494                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2496                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2498  0447 4d            	tnz	a
2499  0448 2609          	jrne	L5711
2500                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2502  044a c65148        	ld	a,20808
2503  044d a540          	bcp	a,#64
2504  044f 2700          	jreq	L7711
2505                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2507                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2510  0451               L7711:
2511                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2513                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2515                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2518  0451 2007          	jra	L3021
2519  0453               L5711:
2520                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2522  0453 c65148        	ld	a,20808
2523  0456 a540          	bcp	a,#64
2524  0458 2700          	jreq	L5021
2525                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2527                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2530  045a               L5021:
2531                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2533                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2535                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2537  045a               L3021:
2538                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2540  045a 1e09          	ldw	x,(OFST+4,sp)
2541  045c e604          	ld	a,(4,x)
2542  045e a510          	bcp	a,#16
2543  0460 2608          	jrne	L1121
2544                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2546  0462 1e09          	ldw	x,(OFST+4,sp)
2547  0464 e605          	ld	a,(5,x)
2548  0466 a140          	cp	a,#64
2549  0468 2600          	jrne	L3121
2550                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2553  046a               L3121:
2554                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2556                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2558  046a               L1121:
2559                     ; 1108   RTC->WPR = 0xCA;
2561  046a 35ca5159      	mov	20825,#202
2562                     ; 1109   RTC->WPR = 0x53;
2564  046e 35535159      	mov	20825,#83
2565                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2567  0472 0d06          	tnz	(OFST+1,sp)
2568  0474 2747          	jreq	L7121
2569                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2569                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2571  0476 1e09          	ldw	x,(OFST+4,sp)
2572  0478 e604          	ld	a,(4,x)
2573  047a a480          	and	a,#128
2574  047c 1e09          	ldw	x,(OFST+4,sp)
2575  047e ea02          	or	a,(2,x)
2576  0480 6b02          	ld	(OFST-3,sp),a
2578                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2578                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2580  0482 1e09          	ldw	x,(OFST+4,sp)
2581  0484 e604          	ld	a,(4,x)
2582  0486 48            	sll	a
2583  0487 a480          	and	a,#128
2584  0489 1e09          	ldw	x,(OFST+4,sp)
2585  048b ea01          	or	a,(1,x)
2586  048d 6b03          	ld	(OFST-2,sp),a
2588                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2588                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2588                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2590  048f 1e09          	ldw	x,(OFST+4,sp)
2591  0491 e604          	ld	a,(4,x)
2592  0493 48            	sll	a
2593  0494 48            	sll	a
2594  0495 a480          	and	a,#128
2595  0497 6b01          	ld	(OFST-4,sp),a
2597  0499 1e09          	ldw	x,(OFST+4,sp)
2598  049b e603          	ld	a,(3,x)
2599  049d 1e09          	ldw	x,(OFST+4,sp)
2600  049f fa            	or	a,(x)
2601  04a0 1a01          	or	a,(OFST-4,sp)
2602  04a2 6b04          	ld	(OFST-1,sp),a
2604                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2604                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2604                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2606  04a4 1e09          	ldw	x,(OFST+4,sp)
2607  04a6 e604          	ld	a,(4,x)
2608  04a8 48            	sll	a
2609  04a9 48            	sll	a
2610  04aa 48            	sll	a
2611  04ab a480          	and	a,#128
2612  04ad 6b01          	ld	(OFST-4,sp),a
2614  04af 1e09          	ldw	x,(OFST+4,sp)
2615  04b1 e605          	ld	a,(5,x)
2616  04b3 1e09          	ldw	x,(OFST+4,sp)
2617  04b5 ea06          	or	a,(6,x)
2618  04b7 1a01          	or	a,(OFST-4,sp)
2619  04b9 6b05          	ld	(OFST+0,sp),a
2622  04bb 2059          	jra	L1221
2623  04bd               L7121:
2624                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2624                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2626  04bd 1e09          	ldw	x,(OFST+4,sp)
2627  04bf e604          	ld	a,(4,x)
2628  04c1 a480          	and	a,#128
2629  04c3 6b01          	ld	(OFST-4,sp),a
2631  04c5 1e09          	ldw	x,(OFST+4,sp)
2632  04c7 e602          	ld	a,(2,x)
2633  04c9 cd0994        	call	L3_ByteToBcd2
2635  04cc 1a01          	or	a,(OFST-4,sp)
2636  04ce 6b02          	ld	(OFST-3,sp),a
2638                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2638                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2640  04d0 1e09          	ldw	x,(OFST+4,sp)
2641  04d2 e604          	ld	a,(4,x)
2642  04d4 48            	sll	a
2643  04d5 a480          	and	a,#128
2644  04d7 6b01          	ld	(OFST-4,sp),a
2646  04d9 1e09          	ldw	x,(OFST+4,sp)
2647  04db e601          	ld	a,(1,x)
2648  04dd cd0994        	call	L3_ByteToBcd2
2650  04e0 1a01          	or	a,(OFST-4,sp)
2651  04e2 6b03          	ld	(OFST-2,sp),a
2653                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2653                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2653                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2655  04e4 1e09          	ldw	x,(OFST+4,sp)
2656  04e6 e604          	ld	a,(4,x)
2657  04e8 48            	sll	a
2658  04e9 48            	sll	a
2659  04ea a480          	and	a,#128
2660  04ec 6b01          	ld	(OFST-4,sp),a
2662  04ee 1e09          	ldw	x,(OFST+4,sp)
2663  04f0 f6            	ld	a,(x)
2664  04f1 cd0994        	call	L3_ByteToBcd2
2666  04f4 1e09          	ldw	x,(OFST+4,sp)
2667  04f6 ea03          	or	a,(3,x)
2668  04f8 1a01          	or	a,(OFST-4,sp)
2669  04fa 6b04          	ld	(OFST-1,sp),a
2671                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2671                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2671                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2673  04fc 1e09          	ldw	x,(OFST+4,sp)
2674  04fe e604          	ld	a,(4,x)
2675  0500 48            	sll	a
2676  0501 48            	sll	a
2677  0502 48            	sll	a
2678  0503 a480          	and	a,#128
2679  0505 6b01          	ld	(OFST-4,sp),a
2681  0507 1e09          	ldw	x,(OFST+4,sp)
2682  0509 e606          	ld	a,(6,x)
2683  050b cd0994        	call	L3_ByteToBcd2
2685  050e 1e09          	ldw	x,(OFST+4,sp)
2686  0510 ea05          	or	a,(5,x)
2687  0512 1a01          	or	a,(OFST-4,sp)
2688  0514 6b05          	ld	(OFST+0,sp),a
2690  0516               L1221:
2691                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2693  0516 7b02          	ld	a,(OFST-3,sp)
2694  0518 c7515c        	ld	20828,a
2695                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2697  051b 7b03          	ld	a,(OFST-2,sp)
2698  051d c7515d        	ld	20829,a
2699                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2701  0520 7b04          	ld	a,(OFST-1,sp)
2702  0522 c7515e        	ld	20830,a
2703                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2705  0525 7b05          	ld	a,(OFST+0,sp)
2706  0527 c7515f        	ld	20831,a
2707                     ; 1154   RTC->WPR = 0xFF; 
2709  052a 35ff5159      	mov	20825,#255
2710                     ; 1155 }
2713  052e 5b06          	addw	sp,#6
2714  0530 81            	ret
2752                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2752                     ; 1166 {
2753                     	switch	.text
2754  0531               _RTC_AlarmStructInit:
2758                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2760  0531 6f03          	clr	(3,x)
2761                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2763  0533 7f            	clr	(x)
2764                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2766  0534 6f01          	clr	(1,x)
2767                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2769  0536 6f02          	clr	(2,x)
2770                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2772  0538 6f05          	clr	(5,x)
2773                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2775  053a a601          	ld	a,#1
2776  053c e706          	ld	(6,x),a
2777                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2779  053e a6f0          	ld	a,#240
2780  0540 e704          	ld	(4,x),a
2781                     ; 1179 }
2784  0542 81            	ret
2877                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2877                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2877                     ; 1190 {
2878                     	switch	.text
2879  0543               _RTC_GetAlarm:
2881  0543 88            	push	a
2882  0544 5204          	subw	sp,#4
2883       00000004      OFST:	set	4
2886                     ; 1191   uint8_t tmpreg1 = 0;
2888                     ; 1192   uint8_t tmpreg2 = 0;
2890                     ; 1193   uint8_t tmpreg3 = 0;
2892                     ; 1194   uint8_t tmpreg4 = 0;
2894                     ; 1195   uint8_t alarmmask = 0;
2896                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2898                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2900  0546 c6515c        	ld	a,20828
2901  0549 6b04          	ld	(OFST+0,sp),a
2903                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2905  054b c6515d        	ld	a,20829
2906  054e 6b01          	ld	(OFST-3,sp),a
2908                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2910  0550 c6515e        	ld	a,20830
2911  0553 6b02          	ld	(OFST-2,sp),a
2913                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2915  0555 c6515f        	ld	a,20831
2916  0558 6b03          	ld	(OFST-1,sp),a
2918                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2920  055a 7b04          	ld	a,(OFST+0,sp)
2921  055c a47f          	and	a,#127
2922  055e 1e08          	ldw	x,(OFST+4,sp)
2923  0560 e702          	ld	(2,x),a
2924                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2926  0562 7b04          	ld	a,(OFST+0,sp)
2927  0564 a480          	and	a,#128
2928  0566 6b04          	ld	(OFST+0,sp),a
2930                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2932  0568 7b01          	ld	a,(OFST-3,sp)
2933  056a a47f          	and	a,#127
2934  056c 1e08          	ldw	x,(OFST+4,sp)
2935  056e e701          	ld	(1,x),a
2936                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2938  0570 7b01          	ld	a,(OFST-3,sp)
2939  0572 a480          	and	a,#128
2940  0574 44            	srl	a
2941  0575 1a04          	or	a,(OFST+0,sp)
2942  0577 6b04          	ld	(OFST+0,sp),a
2944                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2946  0579 7b02          	ld	a,(OFST-2,sp)
2947  057b a43f          	and	a,#63
2948  057d 1e08          	ldw	x,(OFST+4,sp)
2949  057f f7            	ld	(x),a
2950                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2952  0580 7b02          	ld	a,(OFST-2,sp)
2953  0582 a440          	and	a,#64
2954  0584 1e08          	ldw	x,(OFST+4,sp)
2955  0586 e703          	ld	(3,x),a
2956                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2958  0588 7b02          	ld	a,(OFST-2,sp)
2959  058a a480          	and	a,#128
2960  058c 44            	srl	a
2961  058d 44            	srl	a
2962  058e 1a04          	or	a,(OFST+0,sp)
2963  0590 6b04          	ld	(OFST+0,sp),a
2965                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2967  0592 7b03          	ld	a,(OFST-1,sp)
2968  0594 a43f          	and	a,#63
2969  0596 1e08          	ldw	x,(OFST+4,sp)
2970  0598 e706          	ld	(6,x),a
2971                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2973  059a 7b03          	ld	a,(OFST-1,sp)
2974  059c a440          	and	a,#64
2975  059e 1e08          	ldw	x,(OFST+4,sp)
2976  05a0 e705          	ld	(5,x),a
2977                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2979  05a2 7b03          	ld	a,(OFST-1,sp)
2980  05a4 a480          	and	a,#128
2981  05a6 44            	srl	a
2982  05a7 44            	srl	a
2983  05a8 44            	srl	a
2984  05a9 1a04          	or	a,(OFST+0,sp)
2985  05ab 6b04          	ld	(OFST+0,sp),a
2987                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2989  05ad 7b04          	ld	a,(OFST+0,sp)
2990  05af 1e08          	ldw	x,(OFST+4,sp)
2991  05b1 e704          	ld	(4,x),a
2992                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2994  05b3 0d05          	tnz	(OFST+1,sp)
2995  05b5 262a          	jrne	L3131
2996                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2998  05b7 1e08          	ldw	x,(OFST+4,sp)
2999  05b9 f6            	ld	a,(x)
3000  05ba cd09b3        	call	L5_Bcd2ToByte
3002  05bd 1e08          	ldw	x,(OFST+4,sp)
3003  05bf f7            	ld	(x),a
3004                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
3006  05c0 1e08          	ldw	x,(OFST+4,sp)
3007  05c2 e601          	ld	a,(1,x)
3008  05c4 cd09b3        	call	L5_Bcd2ToByte
3010  05c7 1e08          	ldw	x,(OFST+4,sp)
3011  05c9 e701          	ld	(1,x),a
3012                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
3014  05cb 1e08          	ldw	x,(OFST+4,sp)
3015  05cd e602          	ld	a,(2,x)
3016  05cf cd09b3        	call	L5_Bcd2ToByte
3018  05d2 1e08          	ldw	x,(OFST+4,sp)
3019  05d4 e702          	ld	(2,x),a
3020                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
3022  05d6 1e08          	ldw	x,(OFST+4,sp)
3023  05d8 e606          	ld	a,(6,x)
3024  05da cd09b3        	call	L5_Bcd2ToByte
3026  05dd 1e08          	ldw	x,(OFST+4,sp)
3027  05df e706          	ld	(6,x),a
3028  05e1               L3131:
3029                     ; 1233 }
3032  05e1 5b05          	addw	sp,#5
3033  05e3 81            	ret
3097                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3097                     ; 1243 {
3098                     	switch	.text
3099  05e4               _RTC_AlarmCmd:
3101  05e4 5203          	subw	sp,#3
3102       00000003      OFST:	set	3
3105                     ; 1244   __IO uint16_t alrawfcount = 0;
3107  05e6 5f            	clrw	x
3108  05e7 1f01          	ldw	(OFST-2,sp),x
3110                     ; 1245   ErrorStatus status = ERROR;
3112                     ; 1246   uint8_t temp1 = 0;
3114                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3116                     ; 1252   RTC->WPR = 0xCA;
3118  05e9 35ca5159      	mov	20825,#202
3119                     ; 1253   RTC->WPR = 0x53;
3121  05ed 35535159      	mov	20825,#83
3122                     ; 1256   if (NewState != DISABLE)
3124  05f1 4d            	tnz	a
3125  05f2 2711          	jreq	L7431
3126                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3128  05f4 72105149      	bset	20809,#0
3129                     ; 1259     status = SUCCESS;
3131  05f8 a601          	ld	a,#1
3132  05fa 6b03          	ld	(OFST+0,sp),a
3135  05fc               L1531:
3136                     ; 1283   RTC->WPR = 0xFF; 
3138  05fc 35ff5159      	mov	20825,#255
3139                     ; 1286   return (ErrorStatus)status;
3141  0600 7b03          	ld	a,(OFST+0,sp)
3144  0602 5b03          	addw	sp,#3
3145  0604 81            	ret
3146  0605               L7431:
3147                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3149  0605 72115149      	bres	20809,#0
3150                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3152  0609 c6514c        	ld	a,20812
3153  060c a401          	and	a,#1
3154  060e 6b03          	ld	(OFST+0,sp),a
3157  0610 2007          	jra	L7531
3158  0612               L3531:
3159                     ; 1269       alrawfcount++;
3161  0612 1e01          	ldw	x,(OFST-2,sp)
3162  0614 1c0001        	addw	x,#1
3163  0617 1f01          	ldw	(OFST-2,sp),x
3165  0619               L7531:
3166                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3168  0619 1e01          	ldw	x,(OFST-2,sp)
3169  061b a3ffff        	cpw	x,#65535
3170  061e 2704          	jreq	L3631
3172  0620 0d03          	tnz	(OFST+0,sp)
3173  0622 27ee          	jreq	L3531
3174  0624               L3631:
3175                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3177  0624 c6514c        	ld	a,20812
3178  0627 a501          	bcp	a,#1
3179  0629 2604          	jrne	L5631
3180                     ; 1274       status = ERROR;
3182  062b 0f03          	clr	(OFST+0,sp)
3185  062d 20cd          	jra	L1531
3186  062f               L5631:
3187                     ; 1278       status = SUCCESS;
3189  062f a601          	ld	a,#1
3190  0631 6b03          	ld	(OFST+0,sp),a
3192  0633 20c7          	jra	L1531
3393                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3393                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3393                     ; 1300 {
3394                     	switch	.text
3395  0635               _RTC_AlarmSubSecondConfig:
3397  0635 89            	pushw	x
3398  0636 88            	push	a
3399       00000001      OFST:	set	1
3402                     ; 1301   uint8_t alarmstatus = 0;
3404                     ; 1302   ErrorStatus status = ERROR;
3406                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3408                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3410                     ; 1309   RTC->WPR = 0xCA;
3412  0637 35ca5159      	mov	20825,#202
3413                     ; 1310   RTC->WPR = 0x53;
3415  063b 35535159      	mov	20825,#83
3416                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3418  063f c6514c        	ld	a,20812
3419  0642 a540          	bcp	a,#64
3420  0644 2626          	jrne	L7641
3421                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3423  0646 c65149        	ld	a,20809
3424  0649 aa01          	or	a,#1
3425  064b 6b01          	ld	(OFST+0,sp),a
3427                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3429  064d 72115149      	bres	20809,#0
3430                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3432  0651 9e            	ld	a,xh
3433  0652 c75164        	ld	20836,a
3434                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3436  0655 9f            	ld	a,xl
3437  0656 c75165        	ld	20837,a
3438                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3440  0659 7b06          	ld	a,(OFST+5,sp)
3441  065b c75166        	ld	20838,a
3442                     ; 1327     RTC->CR2 |= alarmstatus;
3444  065e c65149        	ld	a,20809
3445  0661 1a01          	or	a,(OFST+0,sp)
3446  0663 c75149        	ld	20809,a
3447                     ; 1329     status = SUCCESS;
3449  0666 a601          	ld	a,#1
3450  0668 6b01          	ld	(OFST+0,sp),a
3453  066a 2002          	jra	L1741
3454  066c               L7641:
3455                     ; 1333     status = ERROR;
3457  066c 0f01          	clr	(OFST+0,sp)
3459  066e               L1741:
3460                     ; 1337   RTC->WPR = 0xFF; 
3462  066e 35ff5159      	mov	20825,#255
3463                     ; 1339   return (ErrorStatus)status;
3465  0672 7b01          	ld	a,(OFST+0,sp)
3468  0674 5b03          	addw	sp,#3
3469  0676 81            	ret
3559                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3559                     ; 1370 {
3560                     	switch	.text
3561  0677               _RTC_WakeUpClockConfig:
3563  0677 88            	push	a
3564       00000000      OFST:	set	0
3567                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3569                     ; 1376   RTC->WPR = 0xCA;
3571  0678 35ca5159      	mov	20825,#202
3572                     ; 1377   RTC->WPR = 0x53;
3574  067c 35535159      	mov	20825,#83
3575                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3577  0680 72155149      	bres	20809,#2
3578                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3580  0684 c65148        	ld	a,20808
3581  0687 a4f8          	and	a,#248
3582  0689 c75148        	ld	20808,a
3583                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3585  068c c65148        	ld	a,20808
3586  068f 1a01          	or	a,(OFST+1,sp)
3587  0691 c75148        	ld	20808,a
3588                     ; 1389   RTC->WPR = 0xFF; 
3590  0694 35ff5159      	mov	20825,#255
3591                     ; 1390 }
3594  0698 84            	pop	a
3595  0699 81            	ret
3630                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3630                     ; 1401 {
3631                     	switch	.text
3632  069a               _RTC_SetWakeUpCounter:
3636                     ; 1403   RTC->WPR = 0xCA;
3638  069a 35ca5159      	mov	20825,#202
3639                     ; 1404   RTC->WPR = 0x53;
3641  069e 35535159      	mov	20825,#83
3642                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3644  06a2 9e            	ld	a,xh
3645  06a3 c75154        	ld	20820,a
3646                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3648  06a6 9f            	ld	a,xl
3649  06a7 c75155        	ld	20821,a
3650                     ; 1412   RTC->WPR = 0xFF; 
3652  06aa 35ff5159      	mov	20825,#255
3653                     ; 1413 }
3656  06ae 81            	ret
3691                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3691                     ; 1421 {
3692                     	switch	.text
3693  06af               _RTC_GetWakeUpCounter:
3695  06af 89            	pushw	x
3696       00000002      OFST:	set	2
3699                     ; 1422   uint16_t tmpreg = 0;
3701                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3703  06b0 c65154        	ld	a,20820
3704  06b3 5f            	clrw	x
3705  06b4 97            	ld	xl,a
3706  06b5 4f            	clr	a
3707  06b6 02            	rlwa	x,a
3708  06b7 1f01          	ldw	(OFST-1,sp),x
3710                     ; 1426   tmpreg |= RTC->WUTRL;
3712  06b9 c65155        	ld	a,20821
3713  06bc 5f            	clrw	x
3714  06bd 97            	ld	xl,a
3715  06be 01            	rrwa	x,a
3716  06bf 1a02          	or	a,(OFST+0,sp)
3717  06c1 01            	rrwa	x,a
3718  06c2 1a01          	or	a,(OFST-1,sp)
3719  06c4 01            	rrwa	x,a
3720  06c5 1f01          	ldw	(OFST-1,sp),x
3722                     ; 1429   return (uint16_t)tmpreg;
3724  06c7 1e01          	ldw	x,(OFST-1,sp)
3727  06c9 5b02          	addw	sp,#2
3728  06cb 81            	ret
3783                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3783                     ; 1441 {
3784                     	switch	.text
3785  06cc               _RTC_WakeUpCmd:
3787  06cc 5203          	subw	sp,#3
3788       00000003      OFST:	set	3
3791                     ; 1442   ErrorStatus status = ERROR;
3793                     ; 1443   uint16_t wutwfcount = 0;
3795  06ce 5f            	clrw	x
3796  06cf 1f02          	ldw	(OFST-1,sp),x
3798                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3800                     ; 1449   RTC->WPR = 0xCA;
3802  06d1 35ca5159      	mov	20825,#202
3803                     ; 1450   RTC->WPR = 0x53;
3805  06d5 35535159      	mov	20825,#83
3806                     ; 1452   if (NewState != DISABLE)
3808  06d9 4d            	tnz	a
3809  06da 2711          	jreq	L3161
3810                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3812  06dc 72145149      	bset	20809,#2
3813                     ; 1457     status = SUCCESS;
3815  06e0 a601          	ld	a,#1
3816  06e2 6b01          	ld	(OFST-2,sp),a
3819  06e4               L5161:
3820                     ; 1482   RTC->WPR = 0xFF; 
3822  06e4 35ff5159      	mov	20825,#255
3823                     ; 1485   return (ErrorStatus)status;
3825  06e8 7b01          	ld	a,(OFST-2,sp)
3828  06ea 5b03          	addw	sp,#3
3829  06ec 81            	ret
3830  06ed               L3161:
3831                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3833  06ed 72155149      	bres	20809,#2
3835  06f1 2007          	jra	L1261
3836  06f3               L7161:
3837                     ; 1467       wutwfcount++;
3839  06f3 1e02          	ldw	x,(OFST-1,sp)
3840  06f5 1c0001        	addw	x,#1
3841  06f8 1f02          	ldw	(OFST-1,sp),x
3843  06fa               L1261:
3844                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3846  06fa c6514c        	ld	a,20812
3847  06fd a504          	bcp	a,#4
3848  06ff 2607          	jrne	L5261
3850  0701 1e02          	ldw	x,(OFST-1,sp)
3851  0703 a3ffff        	cpw	x,#65535
3852  0706 26eb          	jrne	L7161
3853  0708               L5261:
3854                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3856  0708 c6514c        	ld	a,20812
3857  070b a504          	bcp	a,#4
3858  070d 2604          	jrne	L7261
3859                     ; 1473       status = ERROR;
3861  070f 0f01          	clr	(OFST-2,sp)
3864  0711 20d1          	jra	L5161
3865  0713               L7261:
3866                     ; 1477       status = SUCCESS;
3868  0713 a601          	ld	a,#1
3869  0715 6b01          	ld	(OFST-2,sp),a
3871  0717 20cb          	jra	L5161
3961                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3961                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3961                     ; 1524 {
3962                     	switch	.text
3963  0719               _RTC_DayLightSavingConfig:
3965  0719 89            	pushw	x
3966       00000000      OFST:	set	0
3969                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3971                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3973                     ; 1530   RTC->WPR = 0xCA;
3975  071a 35ca5159      	mov	20825,#202
3976                     ; 1531   RTC->WPR = 0x53;
3978  071e 35535159      	mov	20825,#83
3979                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3981  0722 7215514a      	bres	20810,#2
3982                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3984  0726 9f            	ld	a,xl
3985  0727 1a01          	or	a,(OFST+1,sp)
3986  0729 ca514a        	or	a,20810
3987  072c c7514a        	ld	20810,a
3988                     ; 1540   RTC->WPR = 0xFF; 
3990  072f 35ff5159      	mov	20825,#255
3991                     ; 1541 }
3994  0733 85            	popw	x
3995  0734 81            	ret
4020                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
4020                     ; 1550 {
4021                     	switch	.text
4022  0735               _RTC_GetStoreOperation:
4026                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4028  0735 c6514a        	ld	a,20810
4029  0738 a404          	and	a,#4
4032  073a 81            	ret
4126                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4126                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4126                     ; 1589 {
4127                     	switch	.text
4128  073b               _RTC_OutputConfig:
4130  073b 89            	pushw	x
4131       00000000      OFST:	set	0
4134                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4136                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4138                     ; 1595   RTC->WPR = 0xCA;
4140  073c 35ca5159      	mov	20825,#202
4141                     ; 1596   RTC->WPR = 0x53;
4143  0740 35535159      	mov	20825,#83
4144                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4146  0744 c6514a        	ld	a,20810
4147  0747 a48f          	and	a,#143
4148  0749 c7514a        	ld	20810,a
4149                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4151  074c 9f            	ld	a,xl
4152  074d 1a01          	or	a,(OFST+1,sp)
4153  074f ca514a        	or	a,20810
4154  0752 c7514a        	ld	20810,a
4155                     ; 1605   RTC->WPR = 0xFF; 
4157  0755 35ff5159      	mov	20825,#255
4158                     ; 1606 }
4161  0759 85            	popw	x
4162  075a 81            	ret
4257                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4257                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4257                     ; 1641 {
4258                     	switch	.text
4259  075b               _RTC_SynchroShiftConfig:
4261  075b 88            	push	a
4262  075c 5203          	subw	sp,#3
4263       00000003      OFST:	set	3
4266                     ; 1642   uint8_t shiftrhreg = 0;
4268                     ; 1643   ErrorStatus status = ERROR;
4270                     ; 1644   uint16_t shpfcount = 0;
4272  075e 5f            	clrw	x
4273  075f 1f02          	ldw	(OFST-1,sp),x
4275                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4277                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4279                     ; 1651   RTC->WPR = 0xCA;
4281  0761 35ca5159      	mov	20825,#202
4282                     ; 1652   RTC->WPR = 0x53;
4284  0765 35535159      	mov	20825,#83
4285                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4287  0769 c6514c        	ld	a,20812
4288  076c a508          	bcp	a,#8
4289  076e 2717          	jreq	L7102
4291  0770 2007          	jra	L3202
4292  0772               L1202:
4293                     ; 1660       shpfcount++;
4295  0772 1e02          	ldw	x,(OFST-1,sp)
4296  0774 1c0001        	addw	x,#1
4297  0777 1f02          	ldw	(OFST-1,sp),x
4299  0779               L3202:
4300                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4302  0779 c6514c        	ld	a,20812
4303  077c a508          	bcp	a,#8
4304  077e 2707          	jreq	L7102
4306  0780 1e02          	ldw	x,(OFST-1,sp)
4307  0782 a3ffff        	cpw	x,#65535
4308  0785 26eb          	jrne	L1202
4309  0787               L7102:
4310                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4312  0787 c6514c        	ld	a,20812
4313  078a a508          	bcp	a,#8
4314  078c 2616          	jrne	L1302
4315                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4317  078e 7b07          	ld	a,(OFST+4,sp)
4318  0790 1a04          	or	a,(OFST+1,sp)
4319  0792 6b01          	ld	(OFST-2,sp),a
4321                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4323  0794 7b01          	ld	a,(OFST-2,sp)
4324  0796 c7515a        	ld	20826,a
4325                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4327  0799 7b08          	ld	a,(OFST+5,sp)
4328  079b c7515b        	ld	20827,a
4329                     ; 1672     status = SUCCESS;
4331  079e a601          	ld	a,#1
4332  07a0 6b01          	ld	(OFST-2,sp),a
4335  07a2 2002          	jra	L3302
4336  07a4               L1302:
4337                     ; 1676     status = ERROR;
4339  07a4 0f01          	clr	(OFST-2,sp)
4341  07a6               L3302:
4342                     ; 1680   RTC->WPR = 0xFF; 
4344  07a6 35ff5159      	mov	20825,#255
4345                     ; 1682   return (ErrorStatus)(status);
4347  07aa 7b01          	ld	a,(OFST-2,sp)
4350  07ac 5b04          	addw	sp,#4
4351  07ae 81            	ret
4481                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4481                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4481                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4481                     ; 1721 {
4482                     	switch	.text
4483  07af               _RTC_SmoothCalibConfig:
4485  07af 89            	pushw	x
4486  07b0 5203          	subw	sp,#3
4487       00000003      OFST:	set	3
4490                     ; 1722   ErrorStatus status = ERROR;
4492                     ; 1723   uint16_t recalpfcount = 0;
4494  07b2 5f            	clrw	x
4495  07b3 1f02          	ldw	(OFST-1,sp),x
4497                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4499                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4501                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4503                     ; 1731   RTC->WPR = 0xCA;
4505  07b5 35ca5159      	mov	20825,#202
4506                     ; 1732   RTC->WPR = 0x53;
4508  07b9 35535159      	mov	20825,#83
4509                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4511  07bd c6514c        	ld	a,20812
4512  07c0 a502          	bcp	a,#2
4513  07c2 2717          	jreq	L5112
4515  07c4 2007          	jra	L1212
4516  07c6               L7112:
4517                     ; 1740       recalpfcount++;
4519  07c6 1e02          	ldw	x,(OFST-1,sp)
4520  07c8 1c0001        	addw	x,#1
4521  07cb 1f02          	ldw	(OFST-1,sp),x
4523  07cd               L1212:
4524                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4526  07cd c6514c        	ld	a,20812
4527  07d0 a502          	bcp	a,#2
4528  07d2 2707          	jreq	L5112
4530  07d4 1e02          	ldw	x,(OFST-1,sp)
4531  07d6 a3ffff        	cpw	x,#65535
4532  07d9 26eb          	jrne	L7112
4533  07db               L5112:
4534                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4536  07db c6514c        	ld	a,20812
4537  07de a502          	bcp	a,#2
4538  07e0 2614          	jrne	L7212
4539                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4539                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4539                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4541  07e2 7b04          	ld	a,(OFST+1,sp)
4542  07e4 1a05          	or	a,(OFST+2,sp)
4543  07e6 1a08          	or	a,(OFST+5,sp)
4544  07e8 c7516a        	ld	20842,a
4545                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4547  07eb 7b09          	ld	a,(OFST+6,sp)
4548  07ed c7516b        	ld	20843,a
4549                     ; 1754     status = SUCCESS;
4551  07f0 a601          	ld	a,#1
4552  07f2 6b01          	ld	(OFST-2,sp),a
4555  07f4 2002          	jra	L1312
4556  07f6               L7212:
4557                     ; 1758     status = ERROR;
4559  07f6 0f01          	clr	(OFST-2,sp)
4561  07f8               L1312:
4562                     ; 1762   RTC->WPR = 0xFF; 
4564  07f8 35ff5159      	mov	20825,#255
4565                     ; 1764   return (ErrorStatus)(status);
4567  07fc 7b01          	ld	a,(OFST-2,sp)
4570  07fe 5b05          	addw	sp,#5
4571  0800 81            	ret
4629                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4629                     ; 1791 {
4630                     	switch	.text
4631  0801               _RTC_CalibOutputConfig:
4635                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4637                     ; 1796   RTC->WPR = 0xCA;
4639  0801 35ca5159      	mov	20825,#202
4640                     ; 1797   RTC->WPR = 0x53;
4642  0805 35535159      	mov	20825,#83
4643                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4645  0809 4d            	tnz	a
4646  080a 2706          	jreq	L1612
4647                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4649  080c 7216514a      	bset	20810,#3
4651  0810 2004          	jra	L3612
4652  0812               L1612:
4653                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4655  0812 7217514a      	bres	20810,#3
4656  0816               L3612:
4657                     ; 1811   RTC->WPR = 0xFF; 
4659  0816 35ff5159      	mov	20825,#255
4660                     ; 1812 }
4663  081a 81            	ret
4698                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4698                     ; 1821 {
4699                     	switch	.text
4700  081b               _RTC_CalibOutputCmd:
4704                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4706                     ; 1826   RTC->WPR = 0xCA;
4708  081b 35ca5159      	mov	20825,#202
4709                     ; 1827   RTC->WPR = 0x53;
4711  081f 35535159      	mov	20825,#83
4712                     ; 1829   if (NewState != DISABLE)
4714  0823 4d            	tnz	a
4715  0824 2706          	jreq	L3022
4716                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4718  0826 721e514a      	bset	20810,#7
4720  082a 2004          	jra	L5022
4721  082c               L3022:
4722                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4724  082c 721f514a      	bres	20810,#7
4725  0830               L5022:
4726                     ; 1841   RTC->WPR = 0xFF; 
4728  0830 35ff5159      	mov	20825,#255
4729                     ; 1842 }
4732  0834 81            	ret
4827                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4827                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4827                     ; 1873 {
4828                     	switch	.text
4829  0835               _RTC_TamperLevelConfig:
4831  0835 89            	pushw	x
4832       00000000      OFST:	set	0
4835                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4837                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4839                     ; 1879   RTC->WPR = 0xCA;
4841  0836 35ca5159      	mov	20825,#202
4842                     ; 1880   RTC->WPR = 0x53;
4844  083a 35535159      	mov	20825,#83
4845                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4847  083e 9f            	ld	a,xl
4848  083f 4d            	tnz	a
4849  0840 270a          	jreq	L3522
4850                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4852  0842 9e            	ld	a,xh
4853  0843 48            	sll	a
4854  0844 ca516c        	or	a,20844
4855  0847 c7516c        	ld	20844,a
4857  084a 200a          	jra	L5522
4858  084c               L3522:
4859                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4861  084c 7b01          	ld	a,(OFST+1,sp)
4862  084e 48            	sll	a
4863  084f 43            	cpl	a
4864  0850 c4516c        	and	a,20844
4865  0853 c7516c        	ld	20844,a
4866  0856               L5522:
4867                     ; 1894   RTC->WPR = 0xFF; 
4869  0856 35ff5159      	mov	20825,#255
4870                     ; 1895 }
4873  085a 85            	popw	x
4874  085b 81            	ret
4948                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4948                     ; 1904 {
4949                     	switch	.text
4950  085c               _RTC_TamperFilterConfig:
4952  085c 88            	push	a
4953       00000000      OFST:	set	0
4956                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4958                     ; 1910   RTC->WPR = 0xCA;
4960  085d 35ca5159      	mov	20825,#202
4961                     ; 1911   RTC->WPR = 0x53;
4963  0861 35535159      	mov	20825,#83
4964                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4966  0865 c6516d        	ld	a,20845
4967  0868 a4e7          	and	a,#231
4968  086a c7516d        	ld	20845,a
4969                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4971  086d c6516d        	ld	a,20845
4972  0870 1a01          	or	a,(OFST+1,sp)
4973  0872 c7516d        	ld	20845,a
4974                     ; 1920   RTC->WPR = 0xFF; 
4976  0875 35ff5159      	mov	20825,#255
4977                     ; 1922 }
4980  0879 84            	pop	a
4981  087a 81            	ret
5094                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5094                     ; 1932 {
5095                     	switch	.text
5096  087b               _RTC_TamperSamplingFreqConfig:
5098  087b 88            	push	a
5099       00000000      OFST:	set	0
5102                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5104                     ; 1937   RTC->WPR = 0xCA;
5106  087c 35ca5159      	mov	20825,#202
5107                     ; 1938   RTC->WPR = 0x53;
5109  0880 35535159      	mov	20825,#83
5110                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5112  0884 c6516d        	ld	a,20845
5113  0887 a4f8          	and	a,#248
5114  0889 c7516d        	ld	20845,a
5115                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5117  088c c6516d        	ld	a,20845
5118  088f 1a01          	or	a,(OFST+1,sp)
5119  0891 c7516d        	ld	20845,a
5120                     ; 1947   RTC->WPR = 0xFF; 
5122  0894 35ff5159      	mov	20825,#255
5123                     ; 1948 }
5126  0898 84            	pop	a
5127  0899 81            	ret
5210                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5210                     ; 1959 {
5211                     	switch	.text
5212  089a               _RTC_TamperPinsPrechargeDuration:
5214  089a 88            	push	a
5215       00000000      OFST:	set	0
5218                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5220                     ; 1964   RTC->WPR = 0xCA;
5222  089b 35ca5159      	mov	20825,#202
5223                     ; 1965   RTC->WPR = 0x53;
5225  089f 35535159      	mov	20825,#83
5226                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5228  08a3 c6516d        	ld	a,20845
5229  08a6 a41f          	and	a,#31
5230  08a8 c7516d        	ld	20845,a
5231                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5233  08ab c6516d        	ld	a,20845
5234  08ae 1a01          	or	a,(OFST+1,sp)
5235  08b0 c7516d        	ld	20845,a
5236                     ; 1974   RTC->WPR = 0xFF; 
5238  08b3 35ff5159      	mov	20825,#255
5239                     ; 1975 }
5242  08b7 84            	pop	a
5243  08b8 81            	ret
5288                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5288                     ; 1988                    FunctionalState NewState)
5288                     ; 1989 {
5289                     	switch	.text
5290  08b9               _RTC_TamperCmd:
5292  08b9 89            	pushw	x
5293       00000000      OFST:	set	0
5296                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5298                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5300                     ; 1996   RTC->WPR = 0xCA;
5302  08ba 35ca5159      	mov	20825,#202
5303                     ; 1997   RTC->WPR = 0x53;
5305  08be 35535159      	mov	20825,#83
5306                     ; 2000   if (NewState != DISABLE)
5308  08c2 9f            	ld	a,xl
5309  08c3 4d            	tnz	a
5310  08c4 2709          	jreq	L1342
5311                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5313  08c6 9e            	ld	a,xh
5314  08c7 ca516c        	or	a,20844
5315  08ca c7516c        	ld	20844,a
5317  08cd 2009          	jra	L3342
5318  08cf               L1342:
5319                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5321  08cf 7b01          	ld	a,(OFST+1,sp)
5322  08d1 43            	cpl	a
5323  08d2 c4516c        	and	a,20844
5324  08d5 c7516c        	ld	20844,a
5325  08d8               L3342:
5326                     ; 2013   RTC->WPR = 0xFF; 
5328  08d8 35ff5159      	mov	20825,#255
5329                     ; 2014 }
5332  08dc 85            	popw	x
5333  08dd 81            	ret
5405                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5405                     ; 2059 {
5406                     	switch	.text
5407  08de               _RTC_ITConfig:
5409  08de 89            	pushw	x
5410       00000000      OFST:	set	0
5413                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5415                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5417                     ; 2065   RTC->WPR = 0xCA;
5419  08df 35ca5159      	mov	20825,#202
5420                     ; 2066   RTC->WPR = 0x53;
5422  08e3 35535159      	mov	20825,#83
5423                     ; 2068   if (NewState != DISABLE)
5425  08e7 0d05          	tnz	(OFST+5,sp)
5426  08e9 2715          	jreq	L1742
5427                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5429  08eb 9f            	ld	a,xl
5430  08ec a4f0          	and	a,#240
5431  08ee ca5149        	or	a,20809
5432  08f1 c75149        	ld	20809,a
5433                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5435  08f4 7b02          	ld	a,(OFST+2,sp)
5436  08f6 a401          	and	a,#1
5437  08f8 ca516c        	or	a,20844
5438  08fb c7516c        	ld	20844,a
5440  08fe 2016          	jra	L3742
5441  0900               L1742:
5442                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5444  0900 7b02          	ld	a,(OFST+2,sp)
5445  0902 a4f0          	and	a,#240
5446  0904 43            	cpl	a
5447  0905 c45149        	and	a,20809
5448  0908 c75149        	ld	20809,a
5449                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5451  090b 7b02          	ld	a,(OFST+2,sp)
5452  090d a401          	and	a,#1
5453  090f 43            	cpl	a
5454  0910 c4516c        	and	a,20844
5455  0913 c7516c        	ld	20844,a
5456  0916               L3742:
5457                     ; 2082   RTC->WPR = 0xFF; 
5459  0916 35ff5159      	mov	20825,#255
5460                     ; 2083 }
5463  091a 85            	popw	x
5464  091b 81            	ret
5638                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5638                     ; 2091 {
5639                     	switch	.text
5640  091c               _RTC_GetFlagStatus:
5642  091c 89            	pushw	x
5643  091d 5203          	subw	sp,#3
5644       00000003      OFST:	set	3
5647                     ; 2092   FlagStatus flagstatus = RESET;
5649                     ; 2093   uint16_t tmpreg1 = 0;
5651                     ; 2094   uint16_t tmpreg2 = 0;
5653                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5655                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5657  091f c6514c        	ld	a,20812
5658  0922 5f            	clrw	x
5659  0923 97            	ld	xl,a
5660  0924 4f            	clr	a
5661  0925 02            	rlwa	x,a
5662  0926 1f02          	ldw	(OFST-1,sp),x
5664                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5666  0928 c6514d        	ld	a,20813
5667  092b 5f            	clrw	x
5668  092c 97            	ld	xl,a
5669  092d 01            	rrwa	x,a
5670  092e 1a03          	or	a,(OFST+0,sp)
5671  0930 01            	rrwa	x,a
5672  0931 1a02          	or	a,(OFST-1,sp)
5673  0933 01            	rrwa	x,a
5674  0934 1f02          	ldw	(OFST-1,sp),x
5676                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5678  0936 1e02          	ldw	x,(OFST-1,sp)
5679  0938 01            	rrwa	x,a
5680  0939 1405          	and	a,(OFST+2,sp)
5681  093b 01            	rrwa	x,a
5682  093c 1404          	and	a,(OFST+1,sp)
5683  093e 01            	rrwa	x,a
5684  093f a30000        	cpw	x,#0
5685  0942 2706          	jreq	L3752
5686                     ; 2106     flagstatus = SET;
5688  0944 a601          	ld	a,#1
5689  0946 6b01          	ld	(OFST-2,sp),a
5692  0948 2002          	jra	L5752
5693  094a               L3752:
5694                     ; 2110     flagstatus = RESET;
5696  094a 0f01          	clr	(OFST-2,sp)
5698  094c               L5752:
5699                     ; 2112   return (FlagStatus)flagstatus;
5701  094c 7b01          	ld	a,(OFST-2,sp)
5704  094e 5b05          	addw	sp,#5
5705  0950 81            	ret
5740                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5740                     ; 2123 {
5741                     	switch	.text
5742  0951               _RTC_ClearFlag:
5744  0951 89            	pushw	x
5745       00000000      OFST:	set	0
5748                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5750                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5752  0952 9f            	ld	a,xl
5753  0953 43            	cpl	a
5754  0954 c7514d        	ld	20813,a
5755                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5757  0957 7b01          	ld	a,(OFST+1,sp)
5758  0959 43            	cpl	a
5759  095a a47f          	and	a,#127
5760  095c c7514c        	ld	20812,a
5761                     ; 2130 }
5764  095f 85            	popw	x
5765  0960 81            	ret
5829                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5829                     ; 2139 {
5830                     	switch	.text
5831  0961               _RTC_GetITStatus:
5833  0961 89            	pushw	x
5834  0962 89            	pushw	x
5835       00000002      OFST:	set	2
5838                     ; 2140   ITStatus itstatus = RESET;
5840                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5844                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5846                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5848  0963 9f            	ld	a,xl
5849  0964 c45149        	and	a,20809
5850  0967 6b01          	ld	(OFST-1,sp),a
5852                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5854  0969 1e03          	ldw	x,(OFST+1,sp)
5855  096b 54            	srlw	x
5856  096c 54            	srlw	x
5857  096d 54            	srlw	x
5858  096e 54            	srlw	x
5859  096f 9f            	ld	a,xl
5860  0970 c4514d        	and	a,20813
5861  0973 6b02          	ld	(OFST+0,sp),a
5863                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5865  0975 0d01          	tnz	(OFST-1,sp)
5866  0977 270a          	jreq	L7462
5868  0979 0d02          	tnz	(OFST+0,sp)
5869  097b 2706          	jreq	L7462
5870                     ; 2155     itstatus = SET;
5872  097d a601          	ld	a,#1
5873  097f 6b02          	ld	(OFST+0,sp),a
5876  0981 2002          	jra	L1562
5877  0983               L7462:
5878                     ; 2159     itstatus = RESET;
5880  0983 0f02          	clr	(OFST+0,sp)
5882  0985               L1562:
5883                     ; 2162   return (ITStatus)itstatus;
5885  0985 7b02          	ld	a,(OFST+0,sp)
5888  0987 5b04          	addw	sp,#4
5889  0989 81            	ret
5925                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5925                     ; 2173 {
5926                     	switch	.text
5927  098a               _RTC_ClearITPendingBit:
5931                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5933                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5935  098a 54            	srlw	x
5936  098b 54            	srlw	x
5937  098c 54            	srlw	x
5938  098d 54            	srlw	x
5939  098e 9f            	ld	a,xl
5940  098f 43            	cpl	a
5941  0990 c7514d        	ld	20813,a
5942                     ; 2179 }
5945  0993 81            	ret
5988                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5988                     ; 2203 {
5989                     	switch	.text
5990  0994               L3_ByteToBcd2:
5992  0994 88            	push	a
5993  0995 88            	push	a
5994       00000001      OFST:	set	1
5997                     ; 2204   uint8_t bcdhigh = 0;
5999  0996 0f01          	clr	(OFST+0,sp)
6002  0998 2008          	jra	L7172
6003  099a               L3172:
6004                     ; 2208     bcdhigh++;
6006  099a 0c01          	inc	(OFST+0,sp)
6008                     ; 2209     Value -= 10;
6010  099c 7b02          	ld	a,(OFST+1,sp)
6011  099e a00a          	sub	a,#10
6012  09a0 6b02          	ld	(OFST+1,sp),a
6013  09a2               L7172:
6014                     ; 2206   while (Value >= 10)
6016  09a2 7b02          	ld	a,(OFST+1,sp)
6017  09a4 a10a          	cp	a,#10
6018  09a6 24f2          	jruge	L3172
6019                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
6021  09a8 7b01          	ld	a,(OFST+0,sp)
6022  09aa 97            	ld	xl,a
6023  09ab a610          	ld	a,#16
6024  09ad 42            	mul	x,a
6025  09ae 9f            	ld	a,xl
6026  09af 1a02          	or	a,(OFST+1,sp)
6029  09b1 85            	popw	x
6030  09b2 81            	ret
6073                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
6073                     ; 2221 {
6074                     	switch	.text
6075  09b3               L5_Bcd2ToByte:
6077  09b3 88            	push	a
6078  09b4 88            	push	a
6079       00000001      OFST:	set	1
6082                     ; 2222   uint8_t tmp = 0;
6084                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6086  09b5 a4f0          	and	a,#240
6087  09b7 4e            	swap	a
6088  09b8 a40f          	and	a,#15
6089  09ba 97            	ld	xl,a
6090  09bb a60a          	ld	a,#10
6091  09bd 42            	mul	x,a
6092  09be 9f            	ld	a,xl
6093  09bf 6b01          	ld	(OFST+0,sp),a
6095                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6097  09c1 7b02          	ld	a,(OFST+1,sp)
6098  09c3 a40f          	and	a,#15
6099  09c5 1b01          	add	a,(OFST+0,sp)
6102  09c7 85            	popw	x
6103  09c8 81            	ret
6116                     	xdef	_RTC_ClearITPendingBit
6117                     	xdef	_RTC_GetITStatus
6118                     	xdef	_RTC_ClearFlag
6119                     	xdef	_RTC_GetFlagStatus
6120                     	xdef	_RTC_ITConfig
6121                     	xdef	_RTC_TamperCmd
6122                     	xdef	_RTC_TamperPinsPrechargeDuration
6123                     	xdef	_RTC_TamperSamplingFreqConfig
6124                     	xdef	_RTC_TamperFilterConfig
6125                     	xdef	_RTC_TamperLevelConfig
6126                     	xdef	_RTC_CalibOutputCmd
6127                     	xdef	_RTC_CalibOutputConfig
6128                     	xdef	_RTC_SmoothCalibConfig
6129                     	xdef	_RTC_SynchroShiftConfig
6130                     	xdef	_RTC_OutputConfig
6131                     	xdef	_RTC_GetStoreOperation
6132                     	xdef	_RTC_DayLightSavingConfig
6133                     	xdef	_RTC_WakeUpCmd
6134                     	xdef	_RTC_GetWakeUpCounter
6135                     	xdef	_RTC_SetWakeUpCounter
6136                     	xdef	_RTC_WakeUpClockConfig
6137                     	xdef	_RTC_AlarmSubSecondConfig
6138                     	xdef	_RTC_AlarmCmd
6139                     	xdef	_RTC_GetAlarm
6140                     	xdef	_RTC_AlarmStructInit
6141                     	xdef	_RTC_SetAlarm
6142                     	xdef	_RTC_GetDate
6143                     	xdef	_RTC_DateStructInit
6144                     	xdef	_RTC_SetDate
6145                     	xdef	_RTC_GetSubSecond
6146                     	xdef	_RTC_GetTime
6147                     	xdef	_RTC_TimeStructInit
6148                     	xdef	_RTC_SetTime
6149                     	xdef	_RTC_BypassShadowCmd
6150                     	xdef	_RTC_RatioCmd
6151                     	xdef	_RTC_WaitForSynchro
6152                     	xdef	_RTC_ExitInitMode
6153                     	xdef	_RTC_EnterInitMode
6154                     	xdef	_RTC_WriteProtectionCmd
6155                     	xdef	_RTC_StructInit
6156                     	xdef	_RTC_Init
6157                     	xdef	_RTC_DeInit
6176                     	end
