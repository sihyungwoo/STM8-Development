   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  53                     ; 121 void LCD_DeInit(void)
  53                     ; 122 {
  55                     	switch	.text
  56  0000               _LCD_DeInit:
  58  0000 88            	push	a
  59       00000001      OFST:	set	1
  62                     ; 123   uint8_t counter = 0;
  64                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  66  0001 725f5400      	clr	21504
  67                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  69  0005 725f5401      	clr	21505
  70                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  72  0009 725f5402      	clr	21506
  73                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  75  000d 725f5403      	clr	21507
  76                     ; 130   for (counter = 0;counter < 0x05; counter++)
  78  0011 0f01          	clr	(OFST+0,sp)
  80  0013               L72:
  81                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  83  0013 7b01          	ld	a,(OFST+0,sp)
  84  0015 5f            	clrw	x
  85  0016 97            	ld	xl,a
  86  0017 724f5404      	clr	(21508,x)
  87                     ; 130   for (counter = 0;counter < 0x05; counter++)
  89  001b 0c01          	inc	(OFST+0,sp)
  93  001d 7b01          	ld	a,(OFST+0,sp)
  94  001f a105          	cp	a,#5
  95  0021 25f0          	jrult	L72
  96                     ; 135   for (counter = 0;counter < 0x16; counter++)
  98  0023 0f01          	clr	(OFST+0,sp)
 100  0025               L53:
 101                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 103  0025 7b01          	ld	a,(OFST+0,sp)
 104  0027 5f            	clrw	x
 105  0028 97            	ld	xl,a
 106  0029 724f540c      	clr	(21516,x)
 107                     ; 135   for (counter = 0;counter < 0x16; counter++)
 109  002d 0c01          	inc	(OFST+0,sp)
 113  002f 7b01          	ld	a,(OFST+0,sp)
 114  0031 a116          	cp	a,#22
 115  0033 25f0          	jrult	L53
 116                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 118  0035 725f542f      	clr	21551
 119                     ; 142 }
 122  0039 84            	pop	a
 123  003a 81            	ret
 526                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 526                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 526                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 526                     ; 203 {
 527                     	switch	.text
 528  003b               _LCD_Init:
 530  003b 89            	pushw	x
 531       00000000      OFST:	set	0
 534                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 536                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 538                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 540                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 542                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 544                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 546  003c c65403        	ld	a,21507
 547  003f a40f          	and	a,#15
 548  0041 c75403        	ld	21507,a
 549                     ; 212   LCD->FRQ |= LCD_Prescaler;
 551  0044 9e            	ld	a,xh
 552  0045 ca5403        	or	a,21507
 553  0048 c75403        	ld	21507,a
 554                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 556  004b c65403        	ld	a,21507
 557  004e a4f0          	and	a,#240
 558  0050 c75403        	ld	21507,a
 559                     ; 215   LCD->FRQ |= LCD_Divider;
 561  0053 9f            	ld	a,xl
 562  0054 ca5403        	or	a,21507
 563  0057 c75403        	ld	21507,a
 564                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 566  005a c65400        	ld	a,21504
 567  005d a4f9          	and	a,#249
 568  005f c75400        	ld	21504,a
 569                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 571  0062 7213542f      	bres	21551,#1
 572                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 574  0066 7b05          	ld	a,(OFST+5,sp)
 575  0068 a120          	cp	a,#32
 576  006a 260f          	jrne	L152
 577                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 579  006c 7b05          	ld	a,(OFST+5,sp)
 580  006e a4f0          	and	a,#240
 581  0070 4e            	swap	a
 582  0071 a40f          	and	a,#15
 583  0073 ca542f        	or	a,21551
 584  0076 c7542f        	ld	21551,a
 586  0079 200a          	jra	L352
 587  007b               L152:
 588                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 590  007b 7b05          	ld	a,(OFST+5,sp)
 591  007d a40f          	and	a,#15
 592  007f ca5400        	or	a,21504
 593  0082 c75400        	ld	21504,a
 594  0085               L352:
 595                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 597  0085 72115400      	bres	21504,#0
 598                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 600  0089 7211542f      	bres	21551,#0
 601                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 603  008d 7b06          	ld	a,(OFST+6,sp)
 604  008f a110          	cp	a,#16
 605  0091 2619          	jrne	L552
 606                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 608  0093 7b06          	ld	a,(OFST+6,sp)
 609  0095 a40f          	and	a,#15
 610  0097 ca5400        	or	a,21504
 611  009a c75400        	ld	21504,a
 612                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 614  009d 7b06          	ld	a,(OFST+6,sp)
 615  009f a4f0          	and	a,#240
 616  00a1 4e            	swap	a
 617  00a2 a40f          	and	a,#15
 618  00a4 ca542f        	or	a,21551
 619  00a7 c7542f        	ld	21551,a
 621  00aa 200a          	jra	L752
 622  00ac               L552:
 623                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 625  00ac 7b06          	ld	a,(OFST+6,sp)
 626  00ae a40f          	and	a,#15
 627  00b0 ca5400        	or	a,21504
 628  00b3 c75400        	ld	21504,a
 629  00b6               L752:
 630                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 632  00b6 72115401      	bres	21505,#0
 633                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 635  00ba c65401        	ld	a,21505
 636  00bd 1a07          	or	a,(OFST+7,sp)
 637  00bf c75401        	ld	21505,a
 638                     ; 247 }
 641  00c2 85            	popw	x
 642  00c3 81            	ret
 741                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 741                     ; 263 {
 742                     	switch	.text
 743  00c4               _LCD_PortMaskConfig:
 745  00c4 89            	pushw	x
 746       00000000      OFST:	set	0
 749                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 751                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 753  00c5 9e            	ld	a,xh
 754  00c6 5f            	clrw	x
 755  00c7 97            	ld	xl,a
 756  00c8 7b02          	ld	a,(OFST+2,sp)
 757  00ca d75404        	ld	(21508,x),a
 758                     ; 270 }
 761  00cd 85            	popw	x
 762  00ce 81            	ret
 817                     ; 279 void LCD_Cmd(FunctionalState NewState)
 817                     ; 280 {
 818                     	switch	.text
 819  00cf               _LCD_Cmd:
 823                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 825                     ; 284   if (NewState != DISABLE)
 827  00cf 4d            	tnz	a
 828  00d0 2706          	jreq	L153
 829                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 831  00d2 721c5402      	bset	21506,#6
 833  00d6 2004          	jra	L353
 834  00d8               L153:
 835                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 837  00d8 721d5402      	bres	21506,#6
 838  00dc               L353:
 839                     ; 292 }
 842  00dc 81            	ret
 877                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 877                     ; 306 {
 878                     	switch	.text
 879  00dd               _LCD_HighDriveCmd:
 883                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 885                     ; 310   if (NewState != DISABLE)
 887  00dd 4d            	tnz	a
 888  00de 2706          	jreq	L373
 889                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 891  00e0 72185401      	bset	21505,#4
 893  00e4 2004          	jra	L573
 894  00e6               L373:
 895                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 897  00e6 72195401      	bres	21505,#4
 898  00ea               L573:
 899                     ; 318 }
 902  00ea 81            	ret
1009                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1009                     ; 336 {
1010                     	switch	.text
1011  00eb               _LCD_PulseOnDurationConfig:
1013  00eb 88            	push	a
1014       00000000      OFST:	set	0
1017                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1019                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1021  00ec c65401        	ld	a,21505
1022  00ef a41f          	and	a,#31
1023  00f1 c75401        	ld	21505,a
1024                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1026  00f4 c65401        	ld	a,21505
1027  00f7 1a01          	or	a,(OFST+1,sp)
1028  00f9 c75401        	ld	21505,a
1029                     ; 342 }
1032  00fc 84            	pop	a
1033  00fd 81            	ret
1130                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1130                     ; 359 {
1131                     	switch	.text
1132  00fe               _LCD_DeadTimeConfig:
1134  00fe 88            	push	a
1135       00000000      OFST:	set	0
1138                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1140                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1142  00ff c65402        	ld	a,21506
1143  0102 a4f8          	and	a,#248
1144  0104 c75402        	ld	21506,a
1145                     ; 365   LCD->CR3 |= LCD_DeadTime;
1147  0107 c65402        	ld	a,21506
1148  010a 1a01          	or	a,(OFST+1,sp)
1149  010c c75402        	ld	21506,a
1150                     ; 367 }
1153  010f 84            	pop	a
1154  0110 81            	ret
1306                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1306                     ; 392 {
1307                     	switch	.text
1308  0111               _LCD_BlinkConfig:
1312                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1314                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1316                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1318  0111 c65400        	ld	a,21504
1319  0114 a43f          	and	a,#63
1320  0116 c75400        	ld	21504,a
1321                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1323  0119 9e            	ld	a,xh
1324  011a ca5400        	or	a,21504
1325  011d c75400        	ld	21504,a
1326                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1328  0120 c65400        	ld	a,21504
1329  0123 a4c7          	and	a,#199
1330  0125 c75400        	ld	21504,a
1331                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1333  0128 9f            	ld	a,xl
1334  0129 ca5400        	or	a,21504
1335  012c c75400        	ld	21504,a
1336                     ; 403 }
1339  012f 81            	ret
1444                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1444                     ; 420 {
1445                     	switch	.text
1446  0130               _LCD_ContrastConfig:
1448  0130 88            	push	a
1449       00000000      OFST:	set	0
1452                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1454                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1456  0131 c65401        	ld	a,21505
1457  0134 a4f1          	and	a,#241
1458  0136 c75401        	ld	21505,a
1459                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1461  0139 c65401        	ld	a,21505
1462  013c 1a01          	or	a,(OFST+1,sp)
1463  013e c75401        	ld	21505,a
1464                     ; 427 }
1467  0141 84            	pop	a
1468  0142 81            	ret
1672                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1672                     ; 475 {
1673                     	switch	.text
1674  0143               _LCD_WriteRAM:
1676  0143 89            	pushw	x
1677       00000000      OFST:	set	0
1680                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1682                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1684  0144 9e            	ld	a,xh
1685  0145 5f            	clrw	x
1686  0146 97            	ld	xl,a
1687  0147 7b02          	ld	a,(OFST+2,sp)
1688  0149 d7540c        	ld	(21516,x),a
1689                     ; 482 }
1692  014c 85            	popw	x
1693  014d 81            	ret
1750                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1750                     ; 493 {
1751                     	switch	.text
1752  014e               _LCD_PageSelect:
1756                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1758                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1760  014e 7215542f      	bres	21551,#2
1761                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1763  0152 ca542f        	or	a,21551
1764  0155 c7542f        	ld	21551,a
1765                     ; 500 }
1768  0158 81            	ret
1803                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1803                     ; 526 {
1804                     	switch	.text
1805  0159               _LCD_ITConfig:
1809                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1811                     ; 530   if (NewState != DISABLE)
1813  0159 4d            	tnz	a
1814  015a 2706          	jreq	L577
1815                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1817  015c 721a5402      	bset	21506,#5
1819  0160 2004          	jra	L777
1820  0162               L577:
1821                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1823  0162 721b5402      	bres	21506,#5
1824  0166               L777:
1825                     ; 539 }
1828  0166 81            	ret
1884                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1884                     ; 547 {
1885                     	switch	.text
1886  0167               _LCD_GetFlagStatus:
1888  0167 88            	push	a
1889       00000001      OFST:	set	1
1892                     ; 548   FlagStatus status = RESET;
1894                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1896  0168 c65402        	ld	a,21506
1897  016b a510          	bcp	a,#16
1898  016d 2706          	jreq	L7201
1899                     ; 553     status = SET; /* Flag is set */
1901  016f a601          	ld	a,#1
1902  0171 6b01          	ld	(OFST+0,sp),a
1905  0173 2002          	jra	L1301
1906  0175               L7201:
1907                     ; 557     status = RESET; /* Flag is reset*/
1909  0175 0f01          	clr	(OFST+0,sp)
1911  0177               L1301:
1912                     ; 560   return status;
1914  0177 7b01          	ld	a,(OFST+0,sp)
1917  0179 5b01          	addw	sp,#1
1918  017b 81            	ret
1941                     ; 569 void LCD_ClearFlag(void)
1941                     ; 570 {
1942                     	switch	.text
1943  017c               _LCD_ClearFlag:
1947                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1949  017c 72165402      	bset	21506,#3
1950                     ; 574 }
1953  0180 81            	ret
1998                     ; 582 ITStatus LCD_GetITStatus(void)
1998                     ; 583 {
1999                     	switch	.text
2000  0181               _LCD_GetITStatus:
2002  0181 88            	push	a
2003       00000001      OFST:	set	1
2006                     ; 584   ITStatus pendingbitstatus = RESET;
2008                     ; 585   uint8_t enablestatus = 0;
2010                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2012  0182 c65402        	ld	a,21506
2013  0185 a420          	and	a,#32
2014  0187 6b01          	ld	(OFST+0,sp),a
2016                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2018  0189 c65402        	ld	a,21506
2019  018c a510          	bcp	a,#16
2020  018e 270a          	jreq	L5601
2022  0190 0d01          	tnz	(OFST+0,sp)
2023  0192 2706          	jreq	L5601
2024                     ; 592     pendingbitstatus = SET;
2026  0194 a601          	ld	a,#1
2027  0196 6b01          	ld	(OFST+0,sp),a
2030  0198 2002          	jra	L7601
2031  019a               L5601:
2032                     ; 597     pendingbitstatus = RESET;
2034  019a 0f01          	clr	(OFST+0,sp)
2036  019c               L7601:
2037                     ; 600   return  pendingbitstatus;
2039  019c 7b01          	ld	a,(OFST+0,sp)
2042  019e 5b01          	addw	sp,#1
2043  01a0 81            	ret
2067                     ; 609 void LCD_ClearITPendingBit(void)
2067                     ; 610 {
2068                     	switch	.text
2069  01a1               _LCD_ClearITPendingBit:
2073                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2075  01a1 72165402      	bset	21506,#3
2076                     ; 614 }
2079  01a5 81            	ret
2092                     	xdef	_LCD_ClearITPendingBit
2093                     	xdef	_LCD_GetITStatus
2094                     	xdef	_LCD_ClearFlag
2095                     	xdef	_LCD_GetFlagStatus
2096                     	xdef	_LCD_ITConfig
2097                     	xdef	_LCD_PageSelect
2098                     	xdef	_LCD_WriteRAM
2099                     	xdef	_LCD_ContrastConfig
2100                     	xdef	_LCD_BlinkConfig
2101                     	xdef	_LCD_DeadTimeConfig
2102                     	xdef	_LCD_PulseOnDurationConfig
2103                     	xdef	_LCD_HighDriveCmd
2104                     	xdef	_LCD_Cmd
2105                     	xdef	_LCD_PortMaskConfig
2106                     	xdef	_LCD_Init
2107                     	xdef	_LCD_DeInit
2126                     	end
