   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 198                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 198                     ; 142 {
 200                     	switch	.text
 201  0000               _I2C_DeInit:
 205                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 207  0000 7f            	clr	(x)
 208                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 210  0001 6f01          	clr	(1,x)
 211                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 213  0003 6f02          	clr	(2,x)
 214                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 216  0005 6f03          	clr	(3,x)
 217                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 219  0007 6f04          	clr	(4,x)
 220                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 222  0009 6f05          	clr	(5,x)
 223                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 225  000b 6f0a          	clr	(10,x)
 226                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 228  000d 6f0b          	clr	(11,x)
 229                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 231  000f 6f0c          	clr	(12,x)
 232                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 234  0011 a602          	ld	a,#2
 235  0013 e70d          	ld	(13,x),a
 236                     ; 153 }
 239  0015 81            	ret
 463                     .const:	section	.text
 464  0000               L01:
 465  0000 000f4240      	dc.l	1000000
 466  0004               L21:
 467  0004 000186a1      	dc.l	100001
 468  0008               L41:
 469  0008 00000004      	dc.l	4
 470                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 470                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 470                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 470                     ; 187 {
 471                     	switch	.text
 472  0016               _I2C_Init:
 474  0016 89            	pushw	x
 475  0017 520c          	subw	sp,#12
 476       0000000c      OFST:	set	12
 479                     ; 188   uint32_t result = 0x0004;
 481                     ; 189   uint16_t tmpval = 0;
 483                     ; 190   uint8_t tmpccrh = 0;
 485  0019 0f07          	clr	(OFST-5,sp)
 487                     ; 191   uint8_t input_clock = 0;
 489                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 491                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 493                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 495                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 497                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 499                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 501                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 503  001b cd0000        	call	_CLK_GetClockFreq
 505  001e ae0000        	ldw	x,#L01
 506  0021 cd0000        	call	c_ludv
 508  0024 b603          	ld	a,c_lreg+3
 509  0026 6b08          	ld	(OFST-4,sp),a
 511                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 513  0028 1e0d          	ldw	x,(OFST+1,sp)
 514  002a e602          	ld	a,(2,x)
 515  002c a4c0          	and	a,#192
 516  002e e702          	ld	(2,x),a
 517                     ; 209   I2Cx->FREQR |= input_clock;
 519  0030 1e0d          	ldw	x,(OFST+1,sp)
 520  0032 e602          	ld	a,(2,x)
 521  0034 1a08          	or	a,(OFST-4,sp)
 522  0036 e702          	ld	(2,x),a
 523                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 525  0038 1e0d          	ldw	x,(OFST+1,sp)
 526  003a f6            	ld	a,(x)
 527  003b a4fe          	and	a,#254
 528  003d f7            	ld	(x),a
 529                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 531  003e 1e0d          	ldw	x,(OFST+1,sp)
 532  0040 e60c          	ld	a,(12,x)
 533  0042 a430          	and	a,#48
 534  0044 e70c          	ld	(12,x),a
 535                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 537  0046 1e0d          	ldw	x,(OFST+1,sp)
 538  0048 6f0b          	clr	(11,x)
 539                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 541  004a 96            	ldw	x,sp
 542  004b 1c0011        	addw	x,#OFST+5
 543  004e cd0000        	call	c_ltor
 545  0051 ae0004        	ldw	x,#L21
 546  0054 cd0000        	call	c_lcmp
 548  0057 2403          	jruge	L61
 549  0059 cc00f7        	jp	L362
 550  005c               L61:
 551                     ; 223     tmpccrh = I2C_CCRH_FS;
 553  005c a680          	ld	a,#128
 554  005e 6b07          	ld	(OFST-5,sp),a
 556                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 558  0060 0d18          	tnz	(OFST+12,sp)
 559  0062 2633          	jrne	L562
 560                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 562  0064 96            	ldw	x,sp
 563  0065 1c0011        	addw	x,#OFST+5
 564  0068 cd0000        	call	c_ltor
 566  006b a603          	ld	a,#3
 567  006d cd0000        	call	c_smul
 569  0070 96            	ldw	x,sp
 570  0071 1c0001        	addw	x,#OFST-11
 571  0074 cd0000        	call	c_rtol
 574  0077 7b08          	ld	a,(OFST-4,sp)
 575  0079 b703          	ld	c_lreg+3,a
 576  007b 3f02          	clr	c_lreg+2
 577  007d 3f01          	clr	c_lreg+1
 578  007f 3f00          	clr	c_lreg
 579  0081 ae0000        	ldw	x,#L01
 580  0084 cd0000        	call	c_lmul
 582  0087 96            	ldw	x,sp
 583  0088 1c0001        	addw	x,#OFST-11
 584  008b cd0000        	call	c_ludv
 586  008e 96            	ldw	x,sp
 587  008f 1c0009        	addw	x,#OFST-3
 588  0092 cd0000        	call	c_rtol
 592  0095 2037          	jra	L762
 593  0097               L562:
 594                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 596  0097 96            	ldw	x,sp
 597  0098 1c0011        	addw	x,#OFST+5
 598  009b cd0000        	call	c_ltor
 600  009e a619          	ld	a,#25
 601  00a0 cd0000        	call	c_smul
 603  00a3 96            	ldw	x,sp
 604  00a4 1c0001        	addw	x,#OFST-11
 605  00a7 cd0000        	call	c_rtol
 608  00aa 7b08          	ld	a,(OFST-4,sp)
 609  00ac b703          	ld	c_lreg+3,a
 610  00ae 3f02          	clr	c_lreg+2
 611  00b0 3f01          	clr	c_lreg+1
 612  00b2 3f00          	clr	c_lreg
 613  00b4 ae0000        	ldw	x,#L01
 614  00b7 cd0000        	call	c_lmul
 616  00ba 96            	ldw	x,sp
 617  00bb 1c0001        	addw	x,#OFST-11
 618  00be cd0000        	call	c_ludv
 620  00c1 96            	ldw	x,sp
 621  00c2 1c0009        	addw	x,#OFST-3
 622  00c5 cd0000        	call	c_rtol
 625                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 627  00c8 7b07          	ld	a,(OFST-5,sp)
 628  00ca aa40          	or	a,#64
 629  00cc 6b07          	ld	(OFST-5,sp),a
 631  00ce               L762:
 632                     ; 239     if (result < (uint16_t)0x01)
 634  00ce 96            	ldw	x,sp
 635  00cf 1c0009        	addw	x,#OFST-3
 636  00d2 cd0000        	call	c_lzmp
 638  00d5 260a          	jrne	L172
 639                     ; 242       result = (uint16_t)0x0001;
 641  00d7 ae0001        	ldw	x,#1
 642  00da 1f0b          	ldw	(OFST-1,sp),x
 643  00dc ae0000        	ldw	x,#0
 644  00df 1f09          	ldw	(OFST-3,sp),x
 646  00e1               L172:
 647                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 649  00e1 7b08          	ld	a,(OFST-4,sp)
 650  00e3 97            	ld	xl,a
 651  00e4 a603          	ld	a,#3
 652  00e6 42            	mul	x,a
 653  00e7 a60a          	ld	a,#10
 654  00e9 cd0000        	call	c_sdivx
 656  00ec 5c            	incw	x
 657  00ed 1f05          	ldw	(OFST-7,sp),x
 659                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 661  00ef 7b06          	ld	a,(OFST-6,sp)
 662  00f1 1e0d          	ldw	x,(OFST+1,sp)
 663  00f3 e70d          	ld	(13,x),a
 665  00f5 205c          	jra	L372
 666  00f7               L362:
 667                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 669  00f7 96            	ldw	x,sp
 670  00f8 1c0011        	addw	x,#OFST+5
 671  00fb cd0000        	call	c_ltor
 673  00fe 3803          	sll	c_lreg+3
 674  0100 3902          	rlc	c_lreg+2
 675  0102 3901          	rlc	c_lreg+1
 676  0104 3900          	rlc	c_lreg
 677  0106 96            	ldw	x,sp
 678  0107 1c0001        	addw	x,#OFST-11
 679  010a cd0000        	call	c_rtol
 682  010d 7b08          	ld	a,(OFST-4,sp)
 683  010f b703          	ld	c_lreg+3,a
 684  0111 3f02          	clr	c_lreg+2
 685  0113 3f01          	clr	c_lreg+1
 686  0115 3f00          	clr	c_lreg
 687  0117 ae0000        	ldw	x,#L01
 688  011a cd0000        	call	c_lmul
 690  011d 96            	ldw	x,sp
 691  011e 1c0001        	addw	x,#OFST-11
 692  0121 cd0000        	call	c_ludv
 694  0124 b602          	ld	a,c_lreg+2
 695  0126 97            	ld	xl,a
 696  0127 b603          	ld	a,c_lreg+3
 697  0129 cd0000        	call	c_uitol
 699  012c 96            	ldw	x,sp
 700  012d 1c0009        	addw	x,#OFST-3
 701  0130 cd0000        	call	c_rtol
 704                     ; 259     if (result < (uint16_t)0x0004)
 706  0133 96            	ldw	x,sp
 707  0134 1c0009        	addw	x,#OFST-3
 708  0137 cd0000        	call	c_ltor
 710  013a ae0008        	ldw	x,#L41
 711  013d cd0000        	call	c_lcmp
 713  0140 240a          	jruge	L572
 714                     ; 262       result = (uint16_t)0x0004;
 716  0142 ae0004        	ldw	x,#4
 717  0145 1f0b          	ldw	(OFST-1,sp),x
 718  0147 ae0000        	ldw	x,#0
 719  014a 1f09          	ldw	(OFST-3,sp),x
 721  014c               L572:
 722                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 724  014c 7b08          	ld	a,(OFST-4,sp)
 725  014e 4c            	inc	a
 726  014f 1e0d          	ldw	x,(OFST+1,sp)
 727  0151 e70d          	ld	(13,x),a
 728  0153               L372:
 729                     ; 273   I2Cx->CCRL = (uint8_t)result;
 731  0153 7b0c          	ld	a,(OFST+0,sp)
 732  0155 1e0d          	ldw	x,(OFST+1,sp)
 733  0157 e70b          	ld	(11,x),a
 734                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 736  0159 7b07          	ld	a,(OFST-5,sp)
 737  015b 1e0d          	ldw	x,(OFST+1,sp)
 738  015d e70c          	ld	(12,x),a
 739                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 741  015f 1e0d          	ldw	x,(OFST+1,sp)
 742  0161 7b17          	ld	a,(OFST+11,sp)
 743  0163 aa01          	or	a,#1
 744  0165 fa            	or	a,(x)
 745  0166 f7            	ld	(x),a
 746                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 748  0167 1e0d          	ldw	x,(OFST+1,sp)
 749  0169 e601          	ld	a,(1,x)
 750  016b 1a19          	or	a,(OFST+13,sp)
 751  016d e701          	ld	(1,x),a
 752                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 754  016f 7b16          	ld	a,(OFST+10,sp)
 755  0171 1e0d          	ldw	x,(OFST+1,sp)
 756  0173 e703          	ld	(3,x),a
 757                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 757                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 759  0175 1e15          	ldw	x,(OFST+9,sp)
 760  0177 4f            	clr	a
 761  0178 01            	rrwa	x,a
 762  0179 48            	sll	a
 763  017a 59            	rlcw	x
 764  017b 01            	rrwa	x,a
 765  017c a406          	and	a,#6
 766  017e 5f            	clrw	x
 767  017f 6b04          	ld	(OFST-8,sp),a
 769  0181 7b1a          	ld	a,(OFST+14,sp)
 770  0183 aa40          	or	a,#64
 771  0185 1a04          	or	a,(OFST-8,sp)
 772  0187 1e0d          	ldw	x,(OFST+1,sp)
 773  0189 e704          	ld	(4,x),a
 774                     ; 286 }
 777  018b 5b0e          	addw	sp,#14
 778  018d 81            	ret
 845                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 845                     ; 296 {
 846                     	switch	.text
 847  018e               _I2C_Cmd:
 849  018e 89            	pushw	x
 850       00000000      OFST:	set	0
 853                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 855                     ; 301   if (NewState != DISABLE)
 857  018f 0d05          	tnz	(OFST+5,sp)
 858  0191 2706          	jreq	L333
 859                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 861  0193 f6            	ld	a,(x)
 862  0194 aa01          	or	a,#1
 863  0196 f7            	ld	(x),a
 865  0197 2006          	jra	L533
 866  0199               L333:
 867                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 869  0199 1e01          	ldw	x,(OFST+1,sp)
 870  019b f6            	ld	a,(x)
 871  019c a4fe          	and	a,#254
 872  019e f7            	ld	(x),a
 873  019f               L533:
 874                     ; 311 }
 877  019f 85            	popw	x
 878  01a0 81            	ret
 925                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 925                     ; 321 {
 926                     	switch	.text
 927  01a1               _I2C_GeneralCallCmd:
 929  01a1 89            	pushw	x
 930       00000000      OFST:	set	0
 933                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 935                     ; 326   if (NewState != DISABLE)
 937  01a2 0d05          	tnz	(OFST+5,sp)
 938  01a4 2706          	jreq	L363
 939                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 941  01a6 f6            	ld	a,(x)
 942  01a7 aa40          	or	a,#64
 943  01a9 f7            	ld	(x),a
 945  01aa 2006          	jra	L563
 946  01ac               L363:
 947                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 949  01ac 1e01          	ldw	x,(OFST+1,sp)
 950  01ae f6            	ld	a,(x)
 951  01af a4bf          	and	a,#191
 952  01b1 f7            	ld	(x),a
 953  01b2               L563:
 954                     ; 336 }
 957  01b2 85            	popw	x
 958  01b3 81            	ret
1005                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
1005                     ; 348 {
1006                     	switch	.text
1007  01b4               _I2C_GenerateSTART:
1009  01b4 89            	pushw	x
1010       00000000      OFST:	set	0
1013                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1015                     ; 353   if (NewState != DISABLE)
1017  01b5 0d05          	tnz	(OFST+5,sp)
1018  01b7 2708          	jreq	L314
1019                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1021  01b9 e601          	ld	a,(1,x)
1022  01bb aa01          	or	a,#1
1023  01bd e701          	ld	(1,x),a
1025  01bf 2008          	jra	L514
1026  01c1               L314:
1027                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1029  01c1 1e01          	ldw	x,(OFST+1,sp)
1030  01c3 e601          	ld	a,(1,x)
1031  01c5 a4fe          	and	a,#254
1032  01c7 e701          	ld	(1,x),a
1033  01c9               L514:
1034                     ; 363 }
1037  01c9 85            	popw	x
1038  01ca 81            	ret
1085                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1085                     ; 373 {
1086                     	switch	.text
1087  01cb               _I2C_GenerateSTOP:
1089  01cb 89            	pushw	x
1090       00000000      OFST:	set	0
1093                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1095                     ; 378   if (NewState != DISABLE)
1097  01cc 0d05          	tnz	(OFST+5,sp)
1098  01ce 2708          	jreq	L344
1099                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1101  01d0 e601          	ld	a,(1,x)
1102  01d2 aa02          	or	a,#2
1103  01d4 e701          	ld	(1,x),a
1105  01d6 2008          	jra	L544
1106  01d8               L344:
1107                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1109  01d8 1e01          	ldw	x,(OFST+1,sp)
1110  01da e601          	ld	a,(1,x)
1111  01dc a4fd          	and	a,#253
1112  01de e701          	ld	(1,x),a
1113  01e0               L544:
1114                     ; 388 }
1117  01e0 85            	popw	x
1118  01e1 81            	ret
1166                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1166                     ; 398 {
1167                     	switch	.text
1168  01e2               _I2C_SoftwareResetCmd:
1170  01e2 89            	pushw	x
1171       00000000      OFST:	set	0
1174                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1176                     ; 402   if (NewState != DISABLE)
1178  01e3 0d05          	tnz	(OFST+5,sp)
1179  01e5 2708          	jreq	L374
1180                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1182  01e7 e601          	ld	a,(1,x)
1183  01e9 aa80          	or	a,#128
1184  01eb e701          	ld	(1,x),a
1186  01ed 2008          	jra	L574
1187  01ef               L374:
1188                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1190  01ef 1e01          	ldw	x,(OFST+1,sp)
1191  01f1 e601          	ld	a,(1,x)
1192  01f3 a47f          	and	a,#127
1193  01f5 e701          	ld	(1,x),a
1194  01f7               L574:
1195                     ; 412 }
1198  01f7 85            	popw	x
1199  01f8 81            	ret
1247                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1247                     ; 422 {
1248                     	switch	.text
1249  01f9               _I2C_StretchClockCmd:
1251  01f9 89            	pushw	x
1252       00000000      OFST:	set	0
1255                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1257                     ; 426   if (NewState != DISABLE)
1259  01fa 0d05          	tnz	(OFST+5,sp)
1260  01fc 2706          	jreq	L325
1261                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1263  01fe f6            	ld	a,(x)
1264  01ff a47f          	and	a,#127
1265  0201 f7            	ld	(x),a
1267  0202 2006          	jra	L525
1268  0204               L325:
1269                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1271  0204 1e01          	ldw	x,(OFST+1,sp)
1272  0206 f6            	ld	a,(x)
1273  0207 aa80          	or	a,#128
1274  0209 f7            	ld	(x),a
1275  020a               L525:
1276                     ; 437 }
1279  020a 85            	popw	x
1280  020b 81            	ret
1327                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1327                     ; 447 {
1328                     	switch	.text
1329  020c               _I2C_ARPCmd:
1331  020c 89            	pushw	x
1332       00000000      OFST:	set	0
1335                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1337                     ; 451   if (NewState != DISABLE)
1339  020d 0d05          	tnz	(OFST+5,sp)
1340  020f 2706          	jreq	L355
1341                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1343  0211 f6            	ld	a,(x)
1344  0212 aa10          	or	a,#16
1345  0214 f7            	ld	(x),a
1347  0215 2006          	jra	L555
1348  0217               L355:
1349                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1351  0217 1e01          	ldw	x,(OFST+1,sp)
1352  0219 f6            	ld	a,(x)
1353  021a a4ef          	and	a,#239
1354  021c f7            	ld	(x),a
1355  021d               L555:
1356                     ; 462 }
1359  021d 85            	popw	x
1360  021e 81            	ret
1408                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1408                     ; 472 {
1409                     	switch	.text
1410  021f               _I2C_AcknowledgeConfig:
1412  021f 89            	pushw	x
1413       00000000      OFST:	set	0
1416                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1418                     ; 476   if (NewState != DISABLE)
1420  0220 0d05          	tnz	(OFST+5,sp)
1421  0222 2708          	jreq	L306
1422                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1424  0224 e601          	ld	a,(1,x)
1425  0226 aa04          	or	a,#4
1426  0228 e701          	ld	(1,x),a
1428  022a 2008          	jra	L506
1429  022c               L306:
1430                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1432  022c 1e01          	ldw	x,(OFST+1,sp)
1433  022e e601          	ld	a,(1,x)
1434  0230 a4fb          	and	a,#251
1435  0232 e701          	ld	(1,x),a
1436  0234               L506:
1437                     ; 486 }
1440  0234 85            	popw	x
1441  0235 81            	ret
1497                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1497                     ; 495 {
1498                     	switch	.text
1499  0236               _I2C_OwnAddress2Config:
1501  0236 89            	pushw	x
1502  0237 88            	push	a
1503       00000001      OFST:	set	1
1506                     ; 496   uint8_t tmpreg = 0;
1508                     ; 499   tmpreg = I2Cx->OAR2;
1510  0238 e605          	ld	a,(5,x)
1511  023a 6b01          	ld	(OFST+0,sp),a
1513                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1515  023c 7b01          	ld	a,(OFST+0,sp)
1516  023e a401          	and	a,#1
1517  0240 6b01          	ld	(OFST+0,sp),a
1519                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1521  0242 7b06          	ld	a,(OFST+5,sp)
1522  0244 a4fe          	and	a,#254
1523  0246 1a01          	or	a,(OFST+0,sp)
1524  0248 6b01          	ld	(OFST+0,sp),a
1526                     ; 508   I2Cx->OAR2 = tmpreg;
1528  024a 7b01          	ld	a,(OFST+0,sp)
1529  024c 1e02          	ldw	x,(OFST+1,sp)
1530  024e e705          	ld	(5,x),a
1531                     ; 509 }
1534  0250 5b03          	addw	sp,#3
1535  0252 81            	ret
1582                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1582                     ; 519 {
1583                     	switch	.text
1584  0253               _I2C_DualAddressCmd:
1586  0253 89            	pushw	x
1587       00000000      OFST:	set	0
1590                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1592                     ; 523   if (NewState != DISABLE)
1594  0254 0d05          	tnz	(OFST+5,sp)
1595  0256 2708          	jreq	L366
1596                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1598  0258 e605          	ld	a,(5,x)
1599  025a aa01          	or	a,#1
1600  025c e705          	ld	(5,x),a
1602  025e 2008          	jra	L566
1603  0260               L366:
1604                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1606  0260 1e01          	ldw	x,(OFST+1,sp)
1607  0262 e605          	ld	a,(5,x)
1608  0264 a4fe          	and	a,#254
1609  0266 e705          	ld	(5,x),a
1610  0268               L566:
1611                     ; 533 }
1614  0268 85            	popw	x
1615  0269 81            	ret
1685                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1685                     ; 546 {
1686                     	switch	.text
1687  026a               _I2C_AckPositionConfig:
1689  026a 89            	pushw	x
1690       00000000      OFST:	set	0
1693                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1695                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1697  026b e601          	ld	a,(1,x)
1698  026d a4f7          	and	a,#247
1699  026f e701          	ld	(1,x),a
1700                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1702  0271 e601          	ld	a,(1,x)
1703  0273 1a05          	or	a,(OFST+5,sp)
1704  0275 e701          	ld	(1,x),a
1705                     ; 554 }
1708  0277 85            	popw	x
1709  0278 81            	ret
1778                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1778                     ; 566 {
1779                     	switch	.text
1780  0279               _I2C_SMBusAlertConfig:
1782  0279 89            	pushw	x
1783       00000000      OFST:	set	0
1786                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1788                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1790  027a 0d05          	tnz	(OFST+5,sp)
1791  027c 2708          	jreq	L757
1792                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1794  027e e601          	ld	a,(1,x)
1795  0280 aa20          	or	a,#32
1796  0282 e701          	ld	(1,x),a
1798  0284 2008          	jra	L167
1799  0286               L757:
1800                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1802  0286 1e01          	ldw	x,(OFST+1,sp)
1803  0288 e601          	ld	a,(1,x)
1804  028a a4df          	and	a,#223
1805  028c e701          	ld	(1,x),a
1806  028e               L167:
1807                     ; 581 }
1810  028e 85            	popw	x
1811  028f 81            	ret
1859                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1859                     ; 593 {
1860                     	switch	.text
1861  0290               _I2C_FastModeDutyCycleConfig:
1863  0290 89            	pushw	x
1864       00000000      OFST:	set	0
1867                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1869                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1871  0291 7b05          	ld	a,(OFST+5,sp)
1872  0293 a140          	cp	a,#64
1873  0295 2608          	jrne	L7001
1874                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1876  0297 e60c          	ld	a,(12,x)
1877  0299 aa40          	or	a,#64
1878  029b e70c          	ld	(12,x),a
1880  029d 2008          	jra	L1101
1881  029f               L7001:
1882                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1884  029f 1e01          	ldw	x,(OFST+1,sp)
1885  02a1 e60c          	ld	a,(12,x)
1886  02a3 a4bf          	and	a,#191
1887  02a5 e70c          	ld	(12,x),a
1888  02a7               L1101:
1889                     ; 608 }
1892  02a7 85            	popw	x
1893  02a8 81            	ret
1972                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1972                     ; 622 {
1973                     	switch	.text
1974  02a9               _I2C_Send7bitAddress:
1976  02a9 89            	pushw	x
1977       00000000      OFST:	set	0
1980                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1982                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1984                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1986  02aa 0d06          	tnz	(OFST+6,sp)
1987  02ac 2708          	jreq	L3501
1988                     ; 631     Address |= OAR1_ADD0_Set;
1990  02ae 7b05          	ld	a,(OFST+5,sp)
1991  02b0 aa01          	or	a,#1
1992  02b2 6b05          	ld	(OFST+5,sp),a
1994  02b4 2006          	jra	L5501
1995  02b6               L3501:
1996                     ; 636     Address &= OAR1_ADD0_Reset;
1998  02b6 7b05          	ld	a,(OFST+5,sp)
1999  02b8 a4fe          	and	a,#254
2000  02ba 6b05          	ld	(OFST+5,sp),a
2001  02bc               L5501:
2002                     ; 639   I2Cx->DR = Address;
2004  02bc 7b05          	ld	a,(OFST+5,sp)
2005  02be 1e01          	ldw	x,(OFST+1,sp)
2006  02c0 e706          	ld	(6,x),a
2007                     ; 640 }
2010  02c2 85            	popw	x
2011  02c3 81            	ret
2057                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2057                     ; 665 {
2058                     	switch	.text
2059  02c4               _I2C_SendData:
2061  02c4 89            	pushw	x
2062       00000000      OFST:	set	0
2065                     ; 667   I2Cx->DR = Data;
2067  02c5 7b05          	ld	a,(OFST+5,sp)
2068  02c7 1e01          	ldw	x,(OFST+1,sp)
2069  02c9 e706          	ld	(6,x),a
2070                     ; 668 }
2073  02cb 85            	popw	x
2074  02cc 81            	ret
2111                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2111                     ; 677 {
2112                     	switch	.text
2113  02cd               _I2C_ReceiveData:
2117                     ; 679   return ((uint8_t)I2Cx->DR);
2119  02cd e606          	ld	a,(6,x)
2122  02cf 81            	ret
2169                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2169                     ; 706 {
2170                     	switch	.text
2171  02d0               _I2C_TransmitPEC:
2173  02d0 89            	pushw	x
2174       00000000      OFST:	set	0
2177                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2179                     ; 710   if (NewState != DISABLE)
2181  02d1 0d05          	tnz	(OFST+5,sp)
2182  02d3 2708          	jreq	L7411
2183                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2185  02d5 e601          	ld	a,(1,x)
2186  02d7 aa10          	or	a,#16
2187  02d9 e701          	ld	(1,x),a
2189  02db 2008          	jra	L1511
2190  02dd               L7411:
2191                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2193  02dd 1e01          	ldw	x,(OFST+1,sp)
2194  02df e601          	ld	a,(1,x)
2195  02e1 a4ef          	and	a,#239
2196  02e3 e701          	ld	(1,x),a
2197  02e5               L1511:
2198                     ; 720 }
2201  02e5 85            	popw	x
2202  02e6 81            	ret
2249                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2249                     ; 730 {
2250                     	switch	.text
2251  02e7               _I2C_CalculatePEC:
2253  02e7 89            	pushw	x
2254       00000000      OFST:	set	0
2257                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2259                     ; 734   if (NewState != DISABLE)
2261  02e8 0d05          	tnz	(OFST+5,sp)
2262  02ea 2706          	jreq	L7711
2263                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2265  02ec f6            	ld	a,(x)
2266  02ed aa20          	or	a,#32
2267  02ef f7            	ld	(x),a
2269  02f0 2006          	jra	L1021
2270  02f2               L7711:
2271                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2273  02f2 1e01          	ldw	x,(OFST+1,sp)
2274  02f4 f6            	ld	a,(x)
2275  02f5 a4df          	and	a,#223
2276  02f7 f7            	ld	(x),a
2277  02f8               L1021:
2278                     ; 744 }
2281  02f8 85            	popw	x
2282  02f9 81            	ret
2352                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2352                     ; 756 {
2353                     	switch	.text
2354  02fa               _I2C_PECPositionConfig:
2356  02fa 89            	pushw	x
2357       00000000      OFST:	set	0
2360                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2362                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2364  02fb e601          	ld	a,(1,x)
2365  02fd a4f7          	and	a,#247
2366  02ff e701          	ld	(1,x),a
2367                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2369  0301 e601          	ld	a,(1,x)
2370  0303 1a05          	or	a,(OFST+5,sp)
2371  0305 e701          	ld	(1,x),a
2372                     ; 764 }
2375  0307 85            	popw	x
2376  0308 81            	ret
2413                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2413                     ; 773 {
2414                     	switch	.text
2415  0309               _I2C_GetPEC:
2419                     ; 775   return (I2Cx->PECR);
2421  0309 e60e          	ld	a,(14,x)
2424  030b 81            	ret
2471                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2471                     ; 804 {
2472                     	switch	.text
2473  030c               _I2C_DMACmd:
2475  030c 89            	pushw	x
2476       00000000      OFST:	set	0
2479                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2481                     ; 808   if (NewState != DISABLE)
2483  030d 0d05          	tnz	(OFST+5,sp)
2484  030f 2708          	jreq	L3031
2485                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2487  0311 e60a          	ld	a,(10,x)
2488  0313 aa08          	or	a,#8
2489  0315 e70a          	ld	(10,x),a
2491  0317 2008          	jra	L5031
2492  0319               L3031:
2493                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2495  0319 1e01          	ldw	x,(OFST+1,sp)
2496  031b e60a          	ld	a,(10,x)
2497  031d a4f7          	and	a,#247
2498  031f e70a          	ld	(10,x),a
2499  0321               L5031:
2500                     ; 818 }
2503  0321 85            	popw	x
2504  0322 81            	ret
2552                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2552                     ; 828 {
2553                     	switch	.text
2554  0323               _I2C_DMALastTransferCmd:
2556  0323 89            	pushw	x
2557       00000000      OFST:	set	0
2560                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2562                     ; 832   if (NewState != DISABLE)
2564  0324 0d05          	tnz	(OFST+5,sp)
2565  0326 2708          	jreq	L3331
2566                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2568  0328 e60a          	ld	a,(10,x)
2569  032a aa10          	or	a,#16
2570  032c e70a          	ld	(10,x),a
2572  032e 2008          	jra	L5331
2573  0330               L3331:
2574                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2576  0330 1e01          	ldw	x,(OFST+1,sp)
2577  0332 e60a          	ld	a,(10,x)
2578  0334 a4ef          	and	a,#239
2579  0336 e70a          	ld	(10,x),a
2580  0338               L5331:
2581                     ; 842 }
2584  0338 85            	popw	x
2585  0339 81            	ret
2774                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2774                     ; 955 {
2775                     	switch	.text
2776  033a               _I2C_ITConfig:
2778  033a 89            	pushw	x
2779       00000000      OFST:	set	0
2782                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2784                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2786                     ; 960   if (NewState != DISABLE)
2788  033b 0d07          	tnz	(OFST+7,sp)
2789  033d 2708          	jreq	L7341
2790                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2792  033f e60a          	ld	a,(10,x)
2793  0341 1a06          	or	a,(OFST+6,sp)
2794  0343 e70a          	ld	(10,x),a
2796  0345 2009          	jra	L1441
2797  0347               L7341:
2798                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2800  0347 1e01          	ldw	x,(OFST+1,sp)
2801  0349 7b06          	ld	a,(OFST+6,sp)
2802  034b 43            	cpl	a
2803  034c e40a          	and	a,(10,x)
2804  034e e70a          	ld	(10,x),a
2805  0350               L1441:
2806                     ; 970 }
2809  0350 85            	popw	x
2810  0351 81            	ret
2971                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2971                     ; 995 {
2972                     	switch	.text
2973  0352               _I2C_ReadRegister:
2975  0352 89            	pushw	x
2976  0353 5204          	subw	sp,#4
2977       00000004      OFST:	set	4
2980                     ; 996   __IO uint16_t tmp = 0;
2982  0355 5f            	clrw	x
2983  0356 1f03          	ldw	(OFST-1,sp),x
2985                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2987                     ; 1000   tmp = (uint16_t) I2Cx;
2989  0358 1e05          	ldw	x,(OFST+1,sp)
2990  035a 1f03          	ldw	(OFST-1,sp),x
2992                     ; 1001   tmp += I2C_Register;
2994  035c 7b09          	ld	a,(OFST+5,sp)
2995  035e 5f            	clrw	x
2996  035f 97            	ld	xl,a
2997  0360 1f01          	ldw	(OFST-3,sp),x
2999  0362 1e03          	ldw	x,(OFST-1,sp)
3000  0364 72fb01        	addw	x,(OFST-3,sp)
3001  0367 1f03          	ldw	(OFST-1,sp),x
3003                     ; 1004   return (*(__IO uint8_t *) tmp);
3005  0369 1e03          	ldw	x,(OFST-1,sp)
3006  036b f6            	ld	a,(x)
3009  036c 5b06          	addw	sp,#6
3010  036e 81            	ret
3264                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3264                     ; 1045 {
3265                     	switch	.text
3266  036f               _I2C_CheckEvent:
3268  036f 89            	pushw	x
3269  0370 5206          	subw	sp,#6
3270       00000006      OFST:	set	6
3273                     ; 1046   __IO uint16_t lastevent = 0x00;
3275  0372 5f            	clrw	x
3276  0373 1f04          	ldw	(OFST-2,sp),x
3278                     ; 1047   uint8_t flag1 = 0x00 ;
3280                     ; 1048   uint8_t flag2 = 0x00;
3282                     ; 1049   ErrorStatus status = ERROR;
3284                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3286                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3288  0375 1e0b          	ldw	x,(OFST+5,sp)
3289  0377 a30004        	cpw	x,#4
3290  037a 260c          	jrne	L5561
3291                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3293  037c 1e07          	ldw	x,(OFST+1,sp)
3294  037e e608          	ld	a,(8,x)
3295  0380 a404          	and	a,#4
3296  0382 5f            	clrw	x
3297  0383 97            	ld	xl,a
3298  0384 1f04          	ldw	(OFST-2,sp),x
3301  0386 2021          	jra	L7561
3302  0388               L5561:
3303                     ; 1060     flag1 = I2Cx->SR1;
3305  0388 1e07          	ldw	x,(OFST+1,sp)
3306  038a e607          	ld	a,(7,x)
3307  038c 6b03          	ld	(OFST-3,sp),a
3309                     ; 1061     flag2 = I2Cx->SR3;
3311  038e 1e07          	ldw	x,(OFST+1,sp)
3312  0390 e609          	ld	a,(9,x)
3313  0392 6b06          	ld	(OFST+0,sp),a
3315                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3317  0394 7b03          	ld	a,(OFST-3,sp)
3318  0396 5f            	clrw	x
3319  0397 97            	ld	xl,a
3320  0398 1f01          	ldw	(OFST-5,sp),x
3322  039a 7b06          	ld	a,(OFST+0,sp)
3323  039c 5f            	clrw	x
3324  039d 97            	ld	xl,a
3325  039e 4f            	clr	a
3326  039f 02            	rlwa	x,a
3327  03a0 01            	rrwa	x,a
3328  03a1 1a02          	or	a,(OFST-4,sp)
3329  03a3 01            	rrwa	x,a
3330  03a4 1a01          	or	a,(OFST-5,sp)
3331  03a6 01            	rrwa	x,a
3332  03a7 1f04          	ldw	(OFST-2,sp),x
3334  03a9               L7561:
3335                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3337  03a9 1e04          	ldw	x,(OFST-2,sp)
3338  03ab 01            	rrwa	x,a
3339  03ac 140c          	and	a,(OFST+6,sp)
3340  03ae 01            	rrwa	x,a
3341  03af 140b          	and	a,(OFST+5,sp)
3342  03b1 01            	rrwa	x,a
3343  03b2 130b          	cpw	x,(OFST+5,sp)
3344  03b4 2606          	jrne	L1661
3345                     ; 1068     status = SUCCESS;
3347  03b6 a601          	ld	a,#1
3348  03b8 6b06          	ld	(OFST+0,sp),a
3351  03ba 2002          	jra	L3661
3352  03bc               L1661:
3353                     ; 1073     status = ERROR;
3355  03bc 0f06          	clr	(OFST+0,sp)
3357  03be               L3661:
3358                     ; 1077   return status;
3360  03be 7b06          	ld	a,(OFST+0,sp)
3363  03c0 5b08          	addw	sp,#8
3364  03c2 81            	ret
3429                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3429                     ; 1096 {
3430                     	switch	.text
3431  03c3               _I2C_GetLastEvent:
3433  03c3 89            	pushw	x
3434  03c4 5206          	subw	sp,#6
3435       00000006      OFST:	set	6
3438                     ; 1097   __IO uint16_t lastevent = 0;
3440  03c6 5f            	clrw	x
3441  03c7 1f05          	ldw	(OFST-1,sp),x
3443                     ; 1098   uint16_t flag1 = 0;
3445                     ; 1099   uint16_t flag2 = 0;
3447                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3449  03c9 1e07          	ldw	x,(OFST+1,sp)
3450  03cb e608          	ld	a,(8,x)
3451  03cd a504          	bcp	a,#4
3452  03cf 2707          	jreq	L1271
3453                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3455  03d1 ae0004        	ldw	x,#4
3456  03d4 1f05          	ldw	(OFST-1,sp),x
3459  03d6 201d          	jra	L3271
3460  03d8               L1271:
3461                     ; 1108     flag1 = I2Cx->SR1;
3463  03d8 1e07          	ldw	x,(OFST+1,sp)
3464  03da e607          	ld	a,(7,x)
3465  03dc 5f            	clrw	x
3466  03dd 97            	ld	xl,a
3467  03de 1f01          	ldw	(OFST-5,sp),x
3469                     ; 1109     flag2 = I2Cx->SR3;
3471  03e0 1e07          	ldw	x,(OFST+1,sp)
3472  03e2 e609          	ld	a,(9,x)
3473  03e4 5f            	clrw	x
3474  03e5 97            	ld	xl,a
3475  03e6 1f03          	ldw	(OFST-3,sp),x
3477                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3479  03e8 1e03          	ldw	x,(OFST-3,sp)
3480  03ea 4f            	clr	a
3481  03eb 02            	rlwa	x,a
3482  03ec 01            	rrwa	x,a
3483  03ed 1a02          	or	a,(OFST-4,sp)
3484  03ef 01            	rrwa	x,a
3485  03f0 1a01          	or	a,(OFST-5,sp)
3486  03f2 01            	rrwa	x,a
3487  03f3 1f05          	ldw	(OFST-1,sp),x
3489  03f5               L3271:
3490                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3492  03f5 1e05          	ldw	x,(OFST-1,sp)
3495  03f7 5b08          	addw	sp,#8
3496  03f9 81            	ret
3753                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3753                     ; 1153 {
3754                     	switch	.text
3755  03fa               _I2C_GetFlagStatus:
3757  03fa 89            	pushw	x
3758  03fb 89            	pushw	x
3759       00000002      OFST:	set	2
3762                     ; 1154   uint8_t tempreg = 0;
3764  03fc 0f02          	clr	(OFST+0,sp)
3766                     ; 1155   uint8_t regindex = 0;
3768                     ; 1156   FlagStatus bitstatus = RESET;
3770                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3772                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3774  03fe 7b07          	ld	a,(OFST+5,sp)
3775  0400 6b01          	ld	(OFST-1,sp),a
3777                     ; 1164   switch (regindex)
3779  0402 7b01          	ld	a,(OFST-1,sp)
3781                     ; 1181     default:
3781                     ; 1182       break;
3782  0404 4a            	dec	a
3783  0405 2708          	jreq	L5271
3784  0407 4a            	dec	a
3785  0408 270d          	jreq	L7271
3786  040a 4a            	dec	a
3787  040b 2712          	jreq	L1371
3788  040d 2016          	jra	L7602
3789  040f               L5271:
3790                     ; 1167     case 0x01:
3790                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3792  040f 1e03          	ldw	x,(OFST+1,sp)
3793  0411 e607          	ld	a,(7,x)
3794  0413 6b02          	ld	(OFST+0,sp),a
3796                     ; 1169       break;
3798  0415 200e          	jra	L7602
3799  0417               L7271:
3800                     ; 1172     case 0x02:
3800                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3802  0417 1e03          	ldw	x,(OFST+1,sp)
3803  0419 e608          	ld	a,(8,x)
3804  041b 6b02          	ld	(OFST+0,sp),a
3806                     ; 1174       break;
3808  041d 2006          	jra	L7602
3809  041f               L1371:
3810                     ; 1177     case 0x03:
3810                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3812  041f 1e03          	ldw	x,(OFST+1,sp)
3813  0421 e609          	ld	a,(9,x)
3814  0423 6b02          	ld	(OFST+0,sp),a
3816                     ; 1179       break;
3818  0425               L3371:
3819                     ; 1181     default:
3819                     ; 1182       break;
3821  0425               L7602:
3822                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3824  0425 7b08          	ld	a,(OFST+6,sp)
3825  0427 1502          	bcp	a,(OFST+0,sp)
3826  0429 2706          	jreq	L1702
3827                     ; 1189     bitstatus = SET;
3829  042b a601          	ld	a,#1
3830  042d 6b02          	ld	(OFST+0,sp),a
3833  042f 2002          	jra	L3702
3834  0431               L1702:
3835                     ; 1194     bitstatus = RESET;
3837  0431 0f02          	clr	(OFST+0,sp)
3839  0433               L3702:
3840                     ; 1197   return bitstatus;
3842  0433 7b02          	ld	a,(OFST+0,sp)
3845  0435 5b04          	addw	sp,#4
3846  0437 81            	ret
3902                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3902                     ; 1230 {
3903                     	switch	.text
3904  0438               _I2C_ClearFlag:
3906  0438 89            	pushw	x
3907  0439 89            	pushw	x
3908       00000002      OFST:	set	2
3911                     ; 1231   uint16_t flagpos = 0;
3913                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3915                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3917  043a 7b07          	ld	a,(OFST+5,sp)
3918  043c 97            	ld	xl,a
3919  043d 7b08          	ld	a,(OFST+6,sp)
3920  043f a4ff          	and	a,#255
3921  0441 5f            	clrw	x
3922  0442 02            	rlwa	x,a
3923  0443 1f01          	ldw	(OFST-1,sp),x
3924  0445 01            	rrwa	x,a
3926                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3928  0446 7b02          	ld	a,(OFST+0,sp)
3929  0448 43            	cpl	a
3930  0449 1e03          	ldw	x,(OFST+1,sp)
3931  044b e708          	ld	(8,x),a
3932                     ; 1239 }
3935  044d 5b04          	addw	sp,#4
3936  044f 81            	ret
4012                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4012                     ; 1265 {
4013                     	switch	.text
4014  0450               _I2C_GetITStatus:
4016  0450 89            	pushw	x
4017  0451 5204          	subw	sp,#4
4018       00000004      OFST:	set	4
4021                     ; 1266   ITStatus bitstatus = RESET;
4023                     ; 1267   __IO uint8_t enablestatus = 0;
4025  0453 0f03          	clr	(OFST-1,sp)
4027                     ; 1268   uint16_t tempregister = 0;
4029                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
4031                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4033  0455 7b09          	ld	a,(OFST+5,sp)
4034  0457 a407          	and	a,#7
4035  0459 5f            	clrw	x
4036  045a 97            	ld	xl,a
4037  045b 1f01          	ldw	(OFST-3,sp),x
4039                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4041  045d 1e05          	ldw	x,(OFST+1,sp)
4042  045f e60a          	ld	a,(10,x)
4043  0461 1402          	and	a,(OFST-2,sp)
4044  0463 6b03          	ld	(OFST-1,sp),a
4046                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4048  0465 7b09          	ld	a,(OFST+5,sp)
4049  0467 97            	ld	xl,a
4050  0468 7b0a          	ld	a,(OFST+6,sp)
4051  046a 9f            	ld	a,xl
4052  046b a430          	and	a,#48
4053  046d 97            	ld	xl,a
4054  046e 4f            	clr	a
4055  046f 02            	rlwa	x,a
4056  0470 a30100        	cpw	x,#256
4057  0473 2616          	jrne	L5612
4058                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4060  0475 1e05          	ldw	x,(OFST+1,sp)
4061  0477 e607          	ld	a,(7,x)
4062  0479 150a          	bcp	a,(OFST+6,sp)
4063  047b 270a          	jreq	L7612
4065  047d 0d03          	tnz	(OFST-1,sp)
4066  047f 2706          	jreq	L7612
4067                     ; 1284       bitstatus = SET;
4069  0481 a601          	ld	a,#1
4070  0483 6b04          	ld	(OFST+0,sp),a
4073  0485 2018          	jra	L3712
4074  0487               L7612:
4075                     ; 1289       bitstatus = RESET;
4077  0487 0f04          	clr	(OFST+0,sp)
4079  0489 2014          	jra	L3712
4080  048b               L5612:
4081                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4083  048b 1e05          	ldw	x,(OFST+1,sp)
4084  048d e608          	ld	a,(8,x)
4085  048f 150a          	bcp	a,(OFST+6,sp)
4086  0491 270a          	jreq	L5712
4088  0493 0d03          	tnz	(OFST-1,sp)
4089  0495 2706          	jreq	L5712
4090                     ; 1298       bitstatus = SET;
4092  0497 a601          	ld	a,#1
4093  0499 6b04          	ld	(OFST+0,sp),a
4096  049b 2002          	jra	L3712
4097  049d               L5712:
4098                     ; 1303       bitstatus = RESET;
4100  049d 0f04          	clr	(OFST+0,sp)
4102  049f               L3712:
4103                     ; 1307   return  bitstatus;
4105  049f 7b04          	ld	a,(OFST+0,sp)
4108  04a1 5b06          	addw	sp,#6
4109  04a3 81            	ret
4166                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4166                     ; 1341 {
4167                     	switch	.text
4168  04a4               _I2C_ClearITPendingBit:
4170  04a4 89            	pushw	x
4171  04a5 89            	pushw	x
4172       00000002      OFST:	set	2
4175                     ; 1342   uint16_t flagpos = 0;
4177                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4179                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4181  04a6 7b07          	ld	a,(OFST+5,sp)
4182  04a8 97            	ld	xl,a
4183  04a9 7b08          	ld	a,(OFST+6,sp)
4184  04ab a4ff          	and	a,#255
4185  04ad 5f            	clrw	x
4186  04ae 02            	rlwa	x,a
4187  04af 1f01          	ldw	(OFST-1,sp),x
4188  04b1 01            	rrwa	x,a
4190                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4192  04b2 7b02          	ld	a,(OFST+0,sp)
4193  04b4 43            	cpl	a
4194  04b5 1e03          	ldw	x,(OFST+1,sp)
4195  04b7 e708          	ld	(8,x),a
4196                     ; 1352 }
4199  04b9 5b04          	addw	sp,#4
4200  04bb 81            	ret
4213                     	xdef	_I2C_ClearITPendingBit
4214                     	xdef	_I2C_GetITStatus
4215                     	xdef	_I2C_ClearFlag
4216                     	xdef	_I2C_GetFlagStatus
4217                     	xdef	_I2C_GetLastEvent
4218                     	xdef	_I2C_CheckEvent
4219                     	xdef	_I2C_ReadRegister
4220                     	xdef	_I2C_ITConfig
4221                     	xdef	_I2C_DMALastTransferCmd
4222                     	xdef	_I2C_DMACmd
4223                     	xdef	_I2C_CalculatePEC
4224                     	xdef	_I2C_TransmitPEC
4225                     	xdef	_I2C_GetPEC
4226                     	xdef	_I2C_PECPositionConfig
4227                     	xdef	_I2C_ReceiveData
4228                     	xdef	_I2C_SendData
4229                     	xdef	_I2C_Send7bitAddress
4230                     	xdef	_I2C_SMBusAlertConfig
4231                     	xdef	_I2C_FastModeDutyCycleConfig
4232                     	xdef	_I2C_AckPositionConfig
4233                     	xdef	_I2C_DualAddressCmd
4234                     	xdef	_I2C_OwnAddress2Config
4235                     	xdef	_I2C_AcknowledgeConfig
4236                     	xdef	_I2C_GenerateSTOP
4237                     	xdef	_I2C_GenerateSTART
4238                     	xdef	_I2C_ARPCmd
4239                     	xdef	_I2C_StretchClockCmd
4240                     	xdef	_I2C_SoftwareResetCmd
4241                     	xdef	_I2C_GeneralCallCmd
4242                     	xdef	_I2C_Cmd
4243                     	xdef	_I2C_Init
4244                     	xdef	_I2C_DeInit
4245                     	xref	_CLK_GetClockFreq
4246                     	xref.b	c_lreg
4247                     	xref.b	c_x
4266                     	xref	c_uitol
4267                     	xref	c_sdivx
4268                     	xref	c_lzmp
4269                     	xref	c_rtol
4270                     	xref	c_smul
4271                     	xref	c_lmul
4272                     	xref	c_lcmp
4273                     	xref	c_ltor
4274                     	xref	c_ludv
4275                     	end
