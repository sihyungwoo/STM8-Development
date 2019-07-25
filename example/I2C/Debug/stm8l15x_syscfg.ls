   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 119 void SYSCFG_RIDeInit(void)
  42                     ; 120 {
  44                     	switch	.text
  45  0000               _SYSCFG_RIDeInit:
  49                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  51  0000 725f5431      	clr	21553
  52                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  54  0004 725f5432      	clr	21554
  55                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  57  0008 725f5439      	clr	21561
  58                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  60  000c 725f543a      	clr	21562
  61                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  63  0010 725f543b      	clr	21563
  64                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  66  0014 725f5457      	clr	21591
  67                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  69  0018 725f543d      	clr	21565
  70                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  72  001c 725f543e      	clr	21566
  73                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  75  0020 725f543f      	clr	21567
  76                     ; 130 }
  79  0024 81            	ret
 338                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 338                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 338                     ; 144 {
 339                     	switch	.text
 340  0025               _SYSCFG_RITIMInputCaptureConfig:
 342  0025 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 348                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 350                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 352  0026 9e            	ld	a,xh
 353  0027 a102          	cp	a,#2
 354  0029 2606          	jrne	L531
 355                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 357  002b 9f            	ld	a,xl
 358  002c c75431        	ld	21553,a
 360  002f 2005          	jra	L731
 361  0031               L531:
 362                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 364  0031 7b02          	ld	a,(OFST+2,sp)
 365  0033 c75432        	ld	21554,a
 366  0036               L731:
 367                     ; 161 }
 370  0036 85            	popw	x
 371  0037 81            	ret
 553                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 553                     ; 185                                  FunctionalState NewState)
 553                     ; 186 {
 554                     	switch	.text
 555  0038               _SYSCFG_RIAnalogSwitchConfig:
 557  0038 89            	pushw	x
 558  0039 89            	pushw	x
 559       00000002      OFST:	set	2
 562                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 564                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 566                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 568                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 570  003a 9e            	ld	a,xh
 571  003b a4f0          	and	a,#240
 572  003d 6b01          	ld	(OFST-1,sp),a
 574                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 576  003f 7b03          	ld	a,(OFST+1,sp)
 577  0041 a40f          	and	a,#15
 578  0043 6b02          	ld	(OFST+0,sp),a
 580                     ; 199   if (NewState != DISABLE)
 582  0045 0d04          	tnz	(OFST+2,sp)
 583  0047 2730          	jreq	L142
 584                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 586  0049 7b01          	ld	a,(OFST-1,sp)
 587  004b a110          	cp	a,#16
 588  004d 2615          	jrne	L342
 589                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 591  004f 7b02          	ld	a,(OFST+0,sp)
 592  0051 5f            	clrw	x
 593  0052 97            	ld	xl,a
 594  0053 a601          	ld	a,#1
 595  0055 5d            	tnzw	x
 596  0056 2704          	jreq	L21
 597  0058               L41:
 598  0058 48            	sll	a
 599  0059 5a            	decw	x
 600  005a 26fc          	jrne	L41
 601  005c               L21:
 602  005c ca543d        	or	a,21565
 603  005f c7543d        	ld	21565,a
 605  0062 2045          	jra	L742
 606  0064               L342:
 607                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 609  0064 7b02          	ld	a,(OFST+0,sp)
 610  0066 5f            	clrw	x
 611  0067 97            	ld	xl,a
 612  0068 a601          	ld	a,#1
 613  006a 5d            	tnzw	x
 614  006b 2704          	jreq	L61
 615  006d               L02:
 616  006d 48            	sll	a
 617  006e 5a            	decw	x
 618  006f 26fc          	jrne	L02
 619  0071               L61:
 620  0071 ca543e        	or	a,21566
 621  0074 c7543e        	ld	21566,a
 622  0077 2030          	jra	L742
 623  0079               L142:
 624                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 626  0079 7b01          	ld	a,(OFST-1,sp)
 627  007b a110          	cp	a,#16
 628  007d 2616          	jrne	L152
 629                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 631  007f 7b02          	ld	a,(OFST+0,sp)
 632  0081 5f            	clrw	x
 633  0082 97            	ld	xl,a
 634  0083 a601          	ld	a,#1
 635  0085 5d            	tnzw	x
 636  0086 2704          	jreq	L22
 637  0088               L42:
 638  0088 48            	sll	a
 639  0089 5a            	decw	x
 640  008a 26fc          	jrne	L42
 641  008c               L22:
 642  008c 43            	cpl	a
 643  008d c4543d        	and	a,21565
 644  0090 c7543d        	ld	21565,a
 646  0093 2014          	jra	L742
 647  0095               L152:
 648                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 650  0095 7b02          	ld	a,(OFST+0,sp)
 651  0097 5f            	clrw	x
 652  0098 97            	ld	xl,a
 653  0099 a601          	ld	a,#1
 654  009b 5d            	tnzw	x
 655  009c 2704          	jreq	L62
 656  009e               L03:
 657  009e 48            	sll	a
 658  009f 5a            	decw	x
 659  00a0 26fc          	jrne	L03
 660  00a2               L62:
 661  00a2 43            	cpl	a
 662  00a3 c4543e        	and	a,21566
 663  00a6 c7543e        	ld	21566,a
 664  00a9               L742:
 665                     ; 225 }
 668  00a9 5b04          	addw	sp,#4
 669  00ab 81            	ret
 935                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 935                     ; 235                              FunctionalState NewState)
 935                     ; 236 {
 936                     	switch	.text
 937  00ac               _SYSCFG_RIIOSwitchConfig:
 939  00ac 89            	pushw	x
 940  00ad 89            	pushw	x
 941       00000002      OFST:	set	2
 944                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 946                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 948                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 950                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 952  00ae 9e            	ld	a,xh
 953  00af a40f          	and	a,#15
 954  00b1 6b02          	ld	(OFST+0,sp),a
 956                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 958  00b3 7b03          	ld	a,(OFST+1,sp)
 959  00b5 a4f0          	and	a,#240
 960  00b7 6b01          	ld	(OFST-1,sp),a
 962                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 964  00b9 7b01          	ld	a,(OFST-1,sp)
 965  00bb a110          	cp	a,#16
 966  00bd 2633          	jrne	L304
 967                     ; 252     if (NewState != DISABLE)
 969  00bf 0d04          	tnz	(OFST+2,sp)
 970  00c1 2717          	jreq	L504
 971                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 973  00c3 7b02          	ld	a,(OFST+0,sp)
 974  00c5 5f            	clrw	x
 975  00c6 97            	ld	xl,a
 976  00c7 a601          	ld	a,#1
 977  00c9 5d            	tnzw	x
 978  00ca 2704          	jreq	L43
 979  00cc               L63:
 980  00cc 48            	sll	a
 981  00cd 5a            	decw	x
 982  00ce 26fc          	jrne	L63
 983  00d0               L43:
 984  00d0 ca5439        	or	a,21561
 985  00d3 c75439        	ld	21561,a
 987  00d6 ac890189      	jpf	L114
 988  00da               L504:
 989                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 991  00da 7b02          	ld	a,(OFST+0,sp)
 992  00dc 5f            	clrw	x
 993  00dd 97            	ld	xl,a
 994  00de a601          	ld	a,#1
 995  00e0 5d            	tnzw	x
 996  00e1 2704          	jreq	L04
 997  00e3               L24:
 998  00e3 48            	sll	a
 999  00e4 5a            	decw	x
1000  00e5 26fc          	jrne	L24
1001  00e7               L04:
1002  00e7 43            	cpl	a
1003  00e8 c45439        	and	a,21561
1004  00eb c75439        	ld	21561,a
1005  00ee ac890189      	jpf	L114
1006  00f2               L304:
1007                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1009  00f2 7b01          	ld	a,(OFST-1,sp)
1010  00f4 a120          	cp	a,#32
1011  00f6 262f          	jrne	L314
1012                     ; 267     if (NewState != DISABLE)
1014  00f8 0d04          	tnz	(OFST+2,sp)
1015  00fa 2715          	jreq	L514
1016                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1018  00fc 7b02          	ld	a,(OFST+0,sp)
1019  00fe 5f            	clrw	x
1020  00ff 97            	ld	xl,a
1021  0100 a601          	ld	a,#1
1022  0102 5d            	tnzw	x
1023  0103 2704          	jreq	L44
1024  0105               L64:
1025  0105 48            	sll	a
1026  0106 5a            	decw	x
1027  0107 26fc          	jrne	L64
1028  0109               L44:
1029  0109 ca543a        	or	a,21562
1030  010c c7543a        	ld	21562,a
1032  010f 2078          	jra	L114
1033  0111               L514:
1034                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1036  0111 7b02          	ld	a,(OFST+0,sp)
1037  0113 5f            	clrw	x
1038  0114 97            	ld	xl,a
1039  0115 a601          	ld	a,#1
1040  0117 5d            	tnzw	x
1041  0118 2704          	jreq	L05
1042  011a               L25:
1043  011a 48            	sll	a
1044  011b 5a            	decw	x
1045  011c 26fc          	jrne	L25
1046  011e               L05:
1047  011e 43            	cpl	a
1048  011f c4543a        	and	a,21562
1049  0122 c7543a        	ld	21562,a
1050  0125 2062          	jra	L114
1051  0127               L314:
1052                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1054  0127 7b01          	ld	a,(OFST-1,sp)
1055  0129 a130          	cp	a,#48
1056  012b 262f          	jrne	L324
1057                     ; 282     if (NewState != DISABLE)
1059  012d 0d04          	tnz	(OFST+2,sp)
1060  012f 2715          	jreq	L524
1061                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1063  0131 7b02          	ld	a,(OFST+0,sp)
1064  0133 5f            	clrw	x
1065  0134 97            	ld	xl,a
1066  0135 a601          	ld	a,#1
1067  0137 5d            	tnzw	x
1068  0138 2704          	jreq	L45
1069  013a               L65:
1070  013a 48            	sll	a
1071  013b 5a            	decw	x
1072  013c 26fc          	jrne	L65
1073  013e               L45:
1074  013e ca543b        	or	a,21563
1075  0141 c7543b        	ld	21563,a
1077  0144 2043          	jra	L114
1078  0146               L524:
1079                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1081  0146 7b02          	ld	a,(OFST+0,sp)
1082  0148 5f            	clrw	x
1083  0149 97            	ld	xl,a
1084  014a a601          	ld	a,#1
1085  014c 5d            	tnzw	x
1086  014d 2704          	jreq	L06
1087  014f               L26:
1088  014f 48            	sll	a
1089  0150 5a            	decw	x
1090  0151 26fc          	jrne	L26
1091  0153               L06:
1092  0153 43            	cpl	a
1093  0154 c4543b        	and	a,21563
1094  0157 c7543b        	ld	21563,a
1095  015a 202d          	jra	L114
1096  015c               L324:
1097                     ; 297     if (NewState != DISABLE)
1099  015c 0d04          	tnz	(OFST+2,sp)
1100  015e 2715          	jreq	L334
1101                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1103  0160 7b02          	ld	a,(OFST+0,sp)
1104  0162 5f            	clrw	x
1105  0163 97            	ld	xl,a
1106  0164 a601          	ld	a,#1
1107  0166 5d            	tnzw	x
1108  0167 2704          	jreq	L46
1109  0169               L66:
1110  0169 48            	sll	a
1111  016a 5a            	decw	x
1112  016b 26fc          	jrne	L66
1113  016d               L46:
1114  016d ca5457        	or	a,21591
1115  0170 c75457        	ld	21591,a
1117  0173 2014          	jra	L114
1118  0175               L334:
1119                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1121  0175 7b02          	ld	a,(OFST+0,sp)
1122  0177 5f            	clrw	x
1123  0178 97            	ld	xl,a
1124  0179 a601          	ld	a,#1
1125  017b 5d            	tnzw	x
1126  017c 2704          	jreq	L07
1127  017e               L27:
1128  017e 48            	sll	a
1129  017f 5a            	decw	x
1130  0180 26fc          	jrne	L27
1131  0182               L07:
1132  0182 43            	cpl	a
1133  0183 c45457        	and	a,21591
1134  0186 c75457        	ld	21591,a
1135  0189               L114:
1136                     ; 308 }
1139  0189 5b04          	addw	sp,#4
1140  018b 81            	ret
1220                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1220                     ; 321 {
1221                     	switch	.text
1222  018c               _SYSCFG_RIResistorConfig:
1224  018c 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1230                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1232                     ; 326   if (NewState != DISABLE)
1234  018d 9f            	ld	a,xl
1235  018e 4d            	tnz	a
1236  018f 2709          	jreq	L574
1237                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1239  0191 9e            	ld	a,xh
1240  0192 ca543f        	or	a,21567
1241  0195 c7543f        	ld	21567,a
1243  0198 2009          	jra	L774
1244  019a               L574:
1245                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1247  019a 7b01          	ld	a,(OFST+1,sp)
1248  019c 43            	cpl	a
1249  019d c4543f        	and	a,21567
1250  01a0 c7543f        	ld	21567,a
1251  01a3               L774:
1252                     ; 336 }
1255  01a3 85            	popw	x
1256  01a4 81            	ret
1279                     ; 368 void SYSCFG_REMAPDeInit(void)
1279                     ; 369 {
1280                     	switch	.text
1281  01a5               _SYSCFG_REMAPDeInit:
1285                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1287  01a5 350c509e      	mov	20638,#12
1288                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1290  01a9 725f509f      	clr	20639
1291                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1293  01ad 725f509d      	clr	20637
1294                     ; 378 }
1297  01b1 81            	ret
1515                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1515                     ; 412 {
1516                     	switch	.text
1517  01b2               _SYSCFG_REMAPPinConfig:
1519  01b2 89            	pushw	x
1520  01b3 88            	push	a
1521       00000001      OFST:	set	1
1524                     ; 413   uint8_t regindex = 0;
1526                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1528                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1530                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1532  01b4 9e            	ld	a,xh
1533  01b5 6b01          	ld	(OFST+0,sp),a
1535                     ; 422   if (regindex == 0x01)
1537  01b7 7b01          	ld	a,(OFST+0,sp)
1538  01b9 a101          	cp	a,#1
1539  01bb 261e          	jrne	L316
1540                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1542  01bd 9f            	ld	a,xl
1543  01be 97            	ld	xl,a
1544  01bf a610          	ld	a,#16
1545  01c1 42            	mul	x,a
1546  01c2 9f            	ld	a,xl
1547  01c3 aa0f          	or	a,#15
1548  01c5 c4509e        	and	a,20638
1549  01c8 c7509e        	ld	20638,a
1550                     ; 425     if (NewState != DISABLE)
1552  01cb 0d06          	tnz	(OFST+5,sp)
1553  01cd 2742          	jreq	L716
1554                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1556  01cf 7b03          	ld	a,(OFST+2,sp)
1557  01d1 a4f0          	and	a,#240
1558  01d3 ca509e        	or	a,20638
1559  01d6 c7509e        	ld	20638,a
1560  01d9 2036          	jra	L716
1561  01db               L316:
1562                     ; 431   else if (regindex == 0x02)
1564  01db 7b01          	ld	a,(OFST+0,sp)
1565  01dd a102          	cp	a,#2
1566  01df 2619          	jrne	L126
1567                     ; 433     if (NewState != DISABLE)
1569  01e1 0d06          	tnz	(OFST+5,sp)
1570  01e3 270a          	jreq	L326
1571                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1573  01e5 c6509f        	ld	a,20639
1574  01e8 1a03          	or	a,(OFST+2,sp)
1575  01ea c7509f        	ld	20639,a
1577  01ed 2022          	jra	L716
1578  01ef               L326:
1579                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1581  01ef 7b03          	ld	a,(OFST+2,sp)
1582  01f1 43            	cpl	a
1583  01f2 c4509f        	and	a,20639
1584  01f5 c7509f        	ld	20639,a
1585  01f8 2017          	jra	L716
1586  01fa               L126:
1587                     ; 445     if (NewState != DISABLE)
1589  01fa 0d06          	tnz	(OFST+5,sp)
1590  01fc 270a          	jreq	L136
1591                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1593  01fe c6509d        	ld	a,20637
1594  0201 1a03          	or	a,(OFST+2,sp)
1595  0203 c7509d        	ld	20637,a
1597  0206 2009          	jra	L716
1598  0208               L136:
1599                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1601  0208 7b03          	ld	a,(OFST+2,sp)
1602  020a 43            	cpl	a
1603  020b c4509d        	and	a,20637
1604  020e c7509d        	ld	20637,a
1605  0211               L716:
1606                     ; 454 }
1609  0211 5b03          	addw	sp,#3
1610  0213 81            	ret
1716                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1716                     ; 471 {
1717                     	switch	.text
1718  0214               _SYSCFG_REMAPDMAChannelConfig:
1720  0214 88            	push	a
1721       00000000      OFST:	set	0
1724                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1726                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1728  0215 a5f0          	bcp	a,#240
1729  0217 270a          	jreq	L776
1730                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1732  0219 c6509e        	ld	a,20638
1733  021c a4f3          	and	a,#243
1734  021e c7509e        	ld	20638,a
1736  0221 2008          	jra	L107
1737  0223               L776:
1738                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1740  0223 c6509e        	ld	a,20638
1741  0226 a4fc          	and	a,#252
1742  0228 c7509e        	ld	20638,a
1743  022b               L107:
1744                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1746  022b 7b01          	ld	a,(OFST+1,sp)
1747  022d a40f          	and	a,#15
1748  022f ca509e        	or	a,20638
1749  0232 c7509e        	ld	20638,a
1750                     ; 489 }
1753  0235 84            	pop	a
1754  0236 81            	ret
1767                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1768                     	xdef	_SYSCFG_REMAPPinConfig
1769                     	xdef	_SYSCFG_REMAPDeInit
1770                     	xdef	_SYSCFG_RIResistorConfig
1771                     	xdef	_SYSCFG_RIIOSwitchConfig
1772                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1773                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1774                     	xdef	_SYSCFG_RIDeInit
1793                     	end
