   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 111 void COMP_DeInit(void)
  42                     ; 112 {
  44                     	switch	.text
  45  0000               _COMP_DeInit:
  49                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  51  0000 725f5440      	clr	21568
  52                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  54  0004 725f5441      	clr	21569
  55                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  57  0008 35c05442      	mov	21570,#192
  58                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  60  000c 725f5443      	clr	21571
  61                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  63  0010 725f5444      	clr	21572
  64                     ; 127 }
  67  0014 81            	ret
 243                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 243                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 243                     ; 155 {
 244                     	switch	.text
 245  0015               _COMP_Init:
 247  0015 89            	pushw	x
 248       00000000      OFST:	set	0
 251                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 253                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 255                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 257                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 259  0016 c65442        	ld	a,21570
 260  0019 a4c7          	and	a,#199
 261  001b c75442        	ld	21570,a
 262                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 264  001e 9e            	ld	a,xh
 265  001f ca5442        	or	a,21570
 266  0022 c75442        	ld	21570,a
 267                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 269  0025 c65442        	ld	a,21570
 270  0028 a43f          	and	a,#63
 271  002a c75442        	ld	21570,a
 272                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 274  002d 9f            	ld	a,xl
 275  002e ca5442        	or	a,21570
 276  0031 c75442        	ld	21570,a
 277                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 279  0034 72155441      	bres	21569,#2
 280                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 282  0038 c65441        	ld	a,21569
 283  003b 1a05          	or	a,(OFST+5,sp)
 284  003d c75441        	ld	21569,a
 285                     ; 175 }
 288  0040 85            	popw	x
 289  0041 81            	ret
 345                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 345                     ; 184 {
 346                     	switch	.text
 347  0042               _COMP_VrefintToCOMP1Connect:
 351                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 353                     ; 188   if (NewState != DISABLE)
 355  0042 4d            	tnz	a
 356  0043 2706          	jreq	L341
 357                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 359  0045 72145442      	bset	21570,#2
 361  0049 2004          	jra	L541
 362  004b               L341:
 363                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 365  004b 72155442      	bres	21570,#2
 366  004f               L541:
 367                     ; 198 }
 370  004f 81            	ret
 465                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 465                     ; 213 {
 466                     	switch	.text
 467  0050               _COMP_EdgeConfig:
 469  0050 89            	pushw	x
 470       00000000      OFST:	set	0
 473                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 475                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 477                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 479  0051 9e            	ld	a,xh
 480  0052 a101          	cp	a,#1
 481  0054 2611          	jrne	L312
 482                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 484  0056 c65440        	ld	a,21568
 485  0059 a4fc          	and	a,#252
 486  005b c75440        	ld	21568,a
 487                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 489  005e 9f            	ld	a,xl
 490  005f ca5440        	or	a,21568
 491  0062 c75440        	ld	21568,a
 493  0065 2010          	jra	L512
 494  0067               L312:
 495                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 497  0067 c65441        	ld	a,21569
 498  006a a4fc          	and	a,#252
 499  006c c75441        	ld	21569,a
 500                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 502  006f c65441        	ld	a,21569
 503  0072 1a02          	or	a,(OFST+2,sp)
 504  0074 c75441        	ld	21569,a
 505  0077               L512:
 506                     ; 236 }
 509  0077 85            	popw	x
 510  0078 81            	ret
 578                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 578                     ; 252 {
 579                     	switch	.text
 580  0079               _COMP_GetOutputLevel:
 582  0079 88            	push	a
 583       00000001      OFST:	set	1
 586                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 588                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 590  007a a101          	cp	a,#1
 591  007c 2611          	jrne	L152
 592                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 594  007e c65440        	ld	a,21568
 595  0081 a508          	bcp	a,#8
 596  0083 2706          	jreq	L352
 597                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 599  0085 a601          	ld	a,#1
 600  0087 6b01          	ld	(OFST+0,sp),a
 603  0089 2013          	jra	L752
 604  008b               L352:
 605                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 607  008b 0f01          	clr	(OFST+0,sp)
 609  008d 200f          	jra	L752
 610  008f               L152:
 611                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 613  008f c65441        	ld	a,21569
 614  0092 a508          	bcp	a,#8
 615  0094 2706          	jreq	L162
 616                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 618  0096 a601          	ld	a,#1
 619  0098 6b01          	ld	(OFST+0,sp),a
 622  009a 2002          	jra	L752
 623  009c               L162:
 624                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 626  009c 0f01          	clr	(OFST+0,sp)
 628  009e               L752:
 629                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 631  009e 7b01          	ld	a,(OFST+0,sp)
 634  00a0 5b01          	addw	sp,#1
 635  00a2 81            	ret
 670                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 670                     ; 325 {
 671                     	switch	.text
 672  00a3               _COMP_WindowCmd:
 676                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 678                     ; 329   if (NewState != DISABLE)
 680  00a3 4d            	tnz	a
 681  00a4 2706          	jreq	L303
 682                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 684  00a6 72125442      	bset	21570,#1
 686  00aa 2004          	jra	L503
 687  00ac               L303:
 688                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 690  00ac 72135442      	bres	21570,#1
 691  00b0               L503:
 692                     ; 339 }
 695  00b0 81            	ret
 731                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 731                     ; 363 {
 732                     	switch	.text
 733  00b1               _COMP_VrefintOutputCmd:
 737                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 739                     ; 367   if (NewState != DISABLE)
 741  00b1 4d            	tnz	a
 742  00b2 2706          	jreq	L523
 743                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 745  00b4 72105442      	bset	21570,#0
 747  00b8 2004          	jra	L723
 748  00ba               L523:
 749                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 751  00ba 72115442      	bres	21570,#0
 752  00be               L723:
 753                     ; 377 }
 756  00be 81            	ret
 792                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 792                     ; 402 {
 793                     	switch	.text
 794  00bf               _COMP_SchmittTriggerCmd:
 798                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 800                     ; 406   if (NewState != DISABLE)
 802  00bf 4d            	tnz	a
 803  00c0 2706          	jreq	L743
 804                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 806  00c2 72145440      	bset	21568,#2
 808  00c6 2004          	jra	L153
 809  00c8               L743:
 810                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 812  00c8 72155440      	bres	21568,#2
 813  00cc               L153:
 814                     ; 416 }
 817  00cc 81            	ret
 937                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 937                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 937                     ; 437                         FunctionalState NewState)
 937                     ; 438 {
 938                     	switch	.text
 939  00cd               _COMP_TriggerConfig:
 941  00cd 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 947                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 949                     ; 443   switch (COMP_TriggerGroup)
 951  00ce 9e            	ld	a,xh
 953                     ; 490     default:
 953                     ; 491       break;
 954  00cf 4a            	dec	a
 955  00d0 270b          	jreq	L353
 956  00d2 4a            	dec	a
 957  00d3 2721          	jreq	L553
 958  00d5 4a            	dec	a
 959  00d6 273d          	jreq	L753
 960  00d8 4a            	dec	a
 961  00d9 2753          	jreq	L163
 962  00db 206e          	jra	L344
 963  00dd               L353:
 964                     ; 445     case COMP_TriggerGroup_InvertingInput:
 964                     ; 446 
 964                     ; 447       if (NewState != DISABLE)
 966  00dd 0d05          	tnz	(OFST+5,sp)
 967  00df 270b          	jreq	L544
 968                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 970  00e1 7b02          	ld	a,(OFST+2,sp)
 971  00e3 43            	cpl	a
 972  00e4 c45443        	and	a,21571
 973  00e7 c75443        	ld	21571,a
 975  00ea 205f          	jra	L344
 976  00ec               L544:
 977                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 979  00ec c65443        	ld	a,21571
 980  00ef 1a02          	or	a,(OFST+2,sp)
 981  00f1 c75443        	ld	21571,a
 982  00f4 2055          	jra	L344
 983  00f6               L553:
 984                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 984                     ; 458       if (NewState != DISABLE)
 986  00f6 0d05          	tnz	(OFST+5,sp)
 987  00f8 270e          	jreq	L154
 988                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 990  00fa 7b02          	ld	a,(OFST+2,sp)
 991  00fc 48            	sll	a
 992  00fd 48            	sll	a
 993  00fe 48            	sll	a
 994  00ff 43            	cpl	a
 995  0100 c45443        	and	a,21571
 996  0103 c75443        	ld	21571,a
 998  0106 2043          	jra	L344
 999  0108               L154:
1000                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1002  0108 7b02          	ld	a,(OFST+2,sp)
1003  010a 48            	sll	a
1004  010b 48            	sll	a
1005  010c 48            	sll	a
1006  010d ca5443        	or	a,21571
1007  0110 c75443        	ld	21571,a
1008  0113 2036          	jra	L344
1009  0115               L753:
1010                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1010                     ; 469       if (NewState != DISABLE)
1012  0115 0d05          	tnz	(OFST+5,sp)
1013  0117 270b          	jreq	L554
1014                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1016  0119 7b02          	ld	a,(OFST+2,sp)
1017  011b 43            	cpl	a
1018  011c c45444        	and	a,21572
1019  011f c75444        	ld	21572,a
1021  0122 2027          	jra	L344
1022  0124               L554:
1023                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1025  0124 c65444        	ld	a,21572
1026  0127 1a02          	or	a,(OFST+2,sp)
1027  0129 c75444        	ld	21572,a
1028  012c 201d          	jra	L344
1029  012e               L163:
1030                     ; 479     case COMP_TriggerGroup_DACOutput:
1030                     ; 480       if (NewState != DISABLE)
1032  012e 0d05          	tnz	(OFST+5,sp)
1033  0130 270e          	jreq	L164
1034                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1036  0132 7b02          	ld	a,(OFST+2,sp)
1037  0134 48            	sll	a
1038  0135 48            	sll	a
1039  0136 48            	sll	a
1040  0137 43            	cpl	a
1041  0138 c45444        	and	a,21572
1042  013b c75444        	ld	21572,a
1044  013e 200b          	jra	L344
1045  0140               L164:
1046                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1048  0140 7b02          	ld	a,(OFST+2,sp)
1049  0142 48            	sll	a
1050  0143 48            	sll	a
1051  0144 48            	sll	a
1052  0145 ca5444        	or	a,21572
1053  0148 c75444        	ld	21572,a
1054  014b               L363:
1055                     ; 490     default:
1055                     ; 491       break;
1057  014b               L344:
1058                     ; 493 }
1061  014b 85            	popw	x
1062  014c 81            	ret
1107                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1107                     ; 522 {
1108                     	switch	.text
1109  014d               _COMP_ITConfig:
1111  014d 89            	pushw	x
1112       00000000      OFST:	set	0
1115                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1117                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1119                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1121  014e 9e            	ld	a,xh
1122  014f a101          	cp	a,#1
1123  0151 2610          	jrne	L705
1124                     ; 530     if (NewState != DISABLE)
1126  0153 9f            	ld	a,xl
1127  0154 4d            	tnz	a
1128  0155 2706          	jreq	L115
1129                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1131  0157 721a5440      	bset	21568,#5
1133  015b 2014          	jra	L515
1134  015d               L115:
1135                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1137  015d 721b5440      	bres	21568,#5
1138  0161 200e          	jra	L515
1139  0163               L705:
1140                     ; 543     if (NewState != DISABLE)
1142  0163 0d02          	tnz	(OFST+2,sp)
1143  0165 2706          	jreq	L715
1144                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1146  0167 721a5441      	bset	21569,#5
1148  016b 2004          	jra	L515
1149  016d               L715:
1150                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1152  016d 721b5441      	bres	21569,#5
1153  0171               L515:
1154                     ; 554 }
1157  0171 85            	popw	x
1158  0172 81            	ret
1224                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1224                     ; 565 {
1225                     	switch	.text
1226  0173               _COMP_GetFlagStatus:
1228  0173 88            	push	a
1229       00000001      OFST:	set	1
1232                     ; 566   FlagStatus bitstatus = RESET;
1234                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1236                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1238  0174 a101          	cp	a,#1
1239  0176 2611          	jrne	L555
1240                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1242  0178 c65440        	ld	a,21568
1243  017b a510          	bcp	a,#16
1244  017d 2706          	jreq	L755
1245                     ; 577       bitstatus = SET;
1247  017f a601          	ld	a,#1
1248  0181 6b01          	ld	(OFST+0,sp),a
1251  0183 2013          	jra	L365
1252  0185               L755:
1253                     ; 582       bitstatus = RESET;
1255  0185 0f01          	clr	(OFST+0,sp)
1257  0187 200f          	jra	L365
1258  0189               L555:
1259                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1261  0189 c65441        	ld	a,21569
1262  018c a510          	bcp	a,#16
1263  018e 2706          	jreq	L565
1264                     ; 590       bitstatus = SET;
1266  0190 a601          	ld	a,#1
1267  0192 6b01          	ld	(OFST+0,sp),a
1270  0194 2002          	jra	L365
1271  0196               L565:
1272                     ; 595       bitstatus = RESET;
1274  0196 0f01          	clr	(OFST+0,sp)
1276  0198               L365:
1277                     ; 600   return (FlagStatus)(bitstatus);
1279  0198 7b01          	ld	a,(OFST+0,sp)
1282  019a 5b01          	addw	sp,#1
1283  019c 81            	ret
1318                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1318                     ; 612 {
1319                     	switch	.text
1320  019d               _COMP_ClearFlag:
1324                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1326                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1328  019d a101          	cp	a,#1
1329  019f 2606          	jrne	L706
1330                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1332  01a1 72195440      	bres	21568,#4
1334  01a5 2004          	jra	L116
1335  01a7               L706:
1336                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1338  01a7 72195441      	bres	21569,#4
1339  01ab               L116:
1340                     ; 626 }
1343  01ab 81            	ret
1407                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1407                     ; 637 {
1408                     	switch	.text
1409  01ac               _COMP_GetITStatus:
1411  01ac 89            	pushw	x
1412       00000002      OFST:	set	2
1415                     ; 638   ITStatus bitstatus = RESET;
1417                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1421                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1423                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1425  01ad a101          	cp	a,#1
1426  01af 2620          	jrne	L546
1427                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1429  01b1 c65440        	ld	a,21568
1430  01b4 a410          	and	a,#16
1431  01b6 6b01          	ld	(OFST-1,sp),a
1433                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1435  01b8 c65440        	ld	a,21568
1436  01bb a420          	and	a,#32
1437  01bd 6b02          	ld	(OFST+0,sp),a
1439                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1441  01bf 0d01          	tnz	(OFST-1,sp)
1442  01c1 270a          	jreq	L746
1444  01c3 0d02          	tnz	(OFST+0,sp)
1445  01c5 2706          	jreq	L746
1446                     ; 655       bitstatus = SET;
1448  01c7 a601          	ld	a,#1
1449  01c9 6b02          	ld	(OFST+0,sp),a
1452  01cb 2022          	jra	L356
1453  01cd               L746:
1454                     ; 660       bitstatus = RESET;
1456  01cd 0f02          	clr	(OFST+0,sp)
1458  01cf 201e          	jra	L356
1459  01d1               L546:
1460                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1462  01d1 c65441        	ld	a,21569
1463  01d4 a410          	and	a,#16
1464  01d6 6b01          	ld	(OFST-1,sp),a
1466                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1468  01d8 c65441        	ld	a,21569
1469  01db a420          	and	a,#32
1470  01dd 6b02          	ld	(OFST+0,sp),a
1472                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1474  01df 0d01          	tnz	(OFST-1,sp)
1475  01e1 270a          	jreq	L556
1477  01e3 0d02          	tnz	(OFST+0,sp)
1478  01e5 2706          	jreq	L556
1479                     ; 674       bitstatus = SET;
1481  01e7 a601          	ld	a,#1
1482  01e9 6b02          	ld	(OFST+0,sp),a
1485  01eb 2002          	jra	L356
1486  01ed               L556:
1487                     ; 679       bitstatus = RESET;
1489  01ed 0f02          	clr	(OFST+0,sp)
1491  01ef               L356:
1492                     ; 684   return (ITStatus) bitstatus;
1494  01ef 7b02          	ld	a,(OFST+0,sp)
1497  01f1 85            	popw	x
1498  01f2 81            	ret
1534                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1534                     ; 696 {
1535                     	switch	.text
1536  01f3               _COMP_ClearITPendingBit:
1540                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1542                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1544  01f3 a101          	cp	a,#1
1545  01f5 2606          	jrne	L776
1546                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1548  01f7 72195440      	bres	21568,#4
1550  01fb 2004          	jra	L107
1551  01fd               L776:
1552                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1554  01fd 72195441      	bres	21569,#4
1555  0201               L107:
1556                     ; 710 }
1559  0201 81            	ret
1572                     	xdef	_COMP_ClearITPendingBit
1573                     	xdef	_COMP_GetITStatus
1574                     	xdef	_COMP_ClearFlag
1575                     	xdef	_COMP_GetFlagStatus
1576                     	xdef	_COMP_ITConfig
1577                     	xdef	_COMP_TriggerConfig
1578                     	xdef	_COMP_SchmittTriggerCmd
1579                     	xdef	_COMP_VrefintOutputCmd
1580                     	xdef	_COMP_WindowCmd
1581                     	xdef	_COMP_GetOutputLevel
1582                     	xdef	_COMP_EdgeConfig
1583                     	xdef	_COMP_VrefintToCOMP1Connect
1584                     	xdef	_COMP_Init
1585                     	xdef	_COMP_DeInit
1604                     	end
