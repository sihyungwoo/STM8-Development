   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  77                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  77                     ; 175 {
  79                     	switch	.text
  80  0000               _FLASH_SetProgrammingTime:
  84                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  86                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  88  0000 72115050      	bres	20560,#0
  89                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  91  0004 ca5050        	or	a,20560
  92  0007 c75050        	ld	20560,a
  93                     ; 181 }
  96  000a 81            	ret
 121                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 121                     ; 189 {
 122                     	switch	.text
 123  000b               _FLASH_GetProgrammingTime:
 127                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 129  000b c65050        	ld	a,20560
 130  000e a401          	and	a,#1
 133  0010 81            	ret
 189                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 189                     ; 204 {
 190                     	switch	.text
 191  0011               _FLASH_PowerWaitModeConfig:
 195                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 197                     ; 209   if(FLASH_Power != FLASH_Power_On)
 199  0011 a101          	cp	a,#1
 200  0013 2706          	jreq	L57
 201                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 203  0015 72145050      	bset	20560,#2
 205  0019 2004          	jra	L77
 206  001b               L57:
 207                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 209  001b 72155050      	bres	20560,#2
 210  001f               L77:
 211                     ; 218 }
 214  001f 81            	ret
 237                     ; 259 void FLASH_DeInit(void)
 237                     ; 260 {
 238                     	switch	.text
 239  0020               _FLASH_DeInit:
 243                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 245  0020 725f5050      	clr	20560
 246                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 248  0024 725f5051      	clr	20561
 249                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 251  0028 35405054      	mov	20564,#64
 252                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 254  002c c65054        	ld	a,20564
 255                     ; 265 }
 258  002f 81            	ret
 314                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 314                     ; 276 {
 315                     	switch	.text
 316  0030               _FLASH_Unlock:
 318  0030 88            	push	a
 319       00000000      OFST:	set	0
 322                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 324                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 326  0031 a1fd          	cp	a,#253
 327  0033 2608          	jrne	L731
 328                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 330  0035 35565052      	mov	20562,#86
 331                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 333  0039 35ae5052      	mov	20562,#174
 334  003d               L731:
 335                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 337  003d 7b01          	ld	a,(OFST+1,sp)
 338  003f a1f7          	cp	a,#247
 339  0041 2608          	jrne	L141
 340                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 342  0043 35ae5053      	mov	20563,#174
 343                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 345  0047 35565053      	mov	20563,#86
 346  004b               L141:
 347                     ; 293 }
 350  004b 84            	pop	a
 351  004c 81            	ret
 386                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 386                     ; 304 {
 387                     	switch	.text
 388  004d               _FLASH_Lock:
 392                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 394                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 396  004d c45054        	and	a,20564
 397  0050 c75054        	ld	20564,a
 398                     ; 310 }
 401  0053 81            	ret
 444                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 444                     ; 319 {
 445                     	switch	.text
 446  0054               _FLASH_ProgramByte:
 448       00000000      OFST:	set	0
 451                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 453                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 455  0054 7b07          	ld	a,(OFST+7,sp)
 456  0056 1e05          	ldw	x,(OFST+5,sp)
 457  0058 f7            	ld	(x),a
 458                     ; 324 }
 461  0059 81            	ret
 495                     ; 331 void FLASH_EraseByte(uint32_t Address)
 495                     ; 332 {
 496                     	switch	.text
 497  005a               _FLASH_EraseByte:
 499       00000000      OFST:	set	0
 502                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 504                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 506  005a 1e05          	ldw	x,(OFST+5,sp)
 507  005c 7f            	clr	(x)
 508                     ; 337 }
 511  005d 81            	ret
 554                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 554                     ; 346 {
 555                     	switch	.text
 556  005e               _FLASH_ProgramWord:
 558       00000000      OFST:	set	0
 561                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 563                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 565  005e 721c5051      	bset	20561,#6
 566                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 568  0062 7b07          	ld	a,(OFST+7,sp)
 569  0064 1e05          	ldw	x,(OFST+5,sp)
 570  0066 f7            	ld	(x),a
 571                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 573  0067 7b08          	ld	a,(OFST+8,sp)
 574  0069 1e05          	ldw	x,(OFST+5,sp)
 575  006b e701          	ld	(1,x),a
 576                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 578  006d 7b09          	ld	a,(OFST+9,sp)
 579  006f 1e05          	ldw	x,(OFST+5,sp)
 580  0071 e702          	ld	(2,x),a
 581                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 583  0073 7b0a          	ld	a,(OFST+10,sp)
 584  0075 1e05          	ldw	x,(OFST+5,sp)
 585  0077 e703          	ld	(3,x),a
 586                     ; 360 }
 589  0079 81            	ret
 623                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 623                     ; 368 {
 624                     	switch	.text
 625  007a               _FLASH_ReadByte:
 627       00000000      OFST:	set	0
 630                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 632  007a 1e05          	ldw	x,(OFST+5,sp)
 633  007c f6            	ld	a,(x)
 636  007d 81            	ret
 681                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 681                     ; 418 {
 682                     	switch	.text
 683  007e               _FLASH_ProgramOptionByte:
 685  007e 89            	pushw	x
 686       00000000      OFST:	set	0
 689                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 691                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 693  007f 721e5051      	bset	20561,#7
 694                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 696  0083 7b05          	ld	a,(OFST+5,sp)
 697  0085 1e01          	ldw	x,(OFST+1,sp)
 698  0087 f7            	ld	(x),a
 699                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 701  0088 a6fd          	ld	a,#253
 702  008a cd01cb        	call	_FLASH_WaitForLastOperation
 704                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 706  008d 721f5051      	bres	20561,#7
 707                     ; 432 }
 710  0091 85            	popw	x
 711  0092 81            	ret
 747                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 747                     ; 440 {
 748                     	switch	.text
 749  0093               _FLASH_EraseOptionByte:
 753                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 755                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 757  0093 721e5051      	bset	20561,#7
 758                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 760  0097 7f            	clr	(x)
 761                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 763  0098 a6fd          	ld	a,#253
 764  009a cd01cb        	call	_FLASH_WaitForLastOperation
 766                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 768  009d 721f5051      	bres	20561,#7
 769                     ; 454 }
 772  00a1 81            	ret
 829                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 829                     ; 463 {
 830                     	switch	.text
 831  00a2               _FLASH_GetReadOutProtectionStatus:
 833  00a2 88            	push	a
 834       00000001      OFST:	set	1
 837                     ; 464   FunctionalState state = DISABLE;
 839                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 841  00a3 c64800        	ld	a,18432
 842  00a6 a1aa          	cp	a,#170
 843  00a8 2606          	jrne	L743
 844                     ; 469     state =  ENABLE;
 846  00aa a601          	ld	a,#1
 847  00ac 6b01          	ld	(OFST+0,sp),a
 850  00ae 2002          	jra	L153
 851  00b0               L743:
 852                     ; 474     state =  DISABLE;
 854  00b0 0f01          	clr	(OFST+0,sp)
 856  00b2               L153:
 857                     ; 477   return state;
 859  00b2 7b01          	ld	a,(OFST+0,sp)
 862  00b4 5b01          	addw	sp,#1
 863  00b6 81            	ret
 897                     ; 485 uint16_t FLASH_GetBootSize(void)
 897                     ; 486 {
 898                     	switch	.text
 899  00b7               _FLASH_GetBootSize:
 901  00b7 89            	pushw	x
 902       00000002      OFST:	set	2
 905                     ; 487   uint16_t temp = 0;
 907                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 909  00b8 c64802        	ld	a,18434
 910  00bb 5f            	clrw	x
 911  00bc 97            	ld	xl,a
 912  00bd 4f            	clr	a
 913  00be 02            	rlwa	x,a
 914  00bf 44            	srl	a
 915  00c0 56            	rrcw	x
 916  00c1 1f01          	ldw	(OFST-1,sp),x
 918                     ; 493   if(OPT->UBC > 0x7F)
 920  00c3 c64802        	ld	a,18434
 921  00c6 a180          	cp	a,#128
 922  00c8 2505          	jrult	L173
 923                     ; 495     temp = 8192;
 925  00ca ae2000        	ldw	x,#8192
 926  00cd 1f01          	ldw	(OFST-1,sp),x
 928  00cf               L173:
 929                     ; 499   return(temp);
 931  00cf 1e01          	ldw	x,(OFST-1,sp)
 934  00d1 5b02          	addw	sp,#2
 935  00d3 81            	ret
 969                     ; 508 uint16_t FLASH_GetCodeSize(void)
 969                     ; 509 {
 970                     	switch	.text
 971  00d4               _FLASH_GetCodeSize:
 973  00d4 89            	pushw	x
 974       00000002      OFST:	set	2
 977                     ; 510   uint16_t temp = 0;
 979                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 981  00d5 c64807        	ld	a,18439
 982  00d8 5f            	clrw	x
 983  00d9 97            	ld	xl,a
 984  00da 4f            	clr	a
 985  00db 02            	rlwa	x,a
 986  00dc 44            	srl	a
 987  00dd 56            	rrcw	x
 988  00de 1f01          	ldw	(OFST-1,sp),x
 990                     ; 516   if(OPT->PCODESIZE > 0x7F)
 992  00e0 c64807        	ld	a,18439
 993  00e3 a180          	cp	a,#128
 994  00e5 2505          	jrult	L114
 995                     ; 518     temp = 8192;
 997  00e7 ae2000        	ldw	x,#8192
 998  00ea 1f01          	ldw	(OFST-1,sp),x
1000  00ec               L114:
1001                     ; 522   return(temp);
1003  00ec 1e01          	ldw	x,(OFST-1,sp)
1006  00ee 5b02          	addw	sp,#2
1007  00f0 81            	ret
1042                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1042                     ; 548 {
1043                     	switch	.text
1044  00f1               _FLASH_ITConfig:
1048                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1050                     ; 552   if(NewState != DISABLE)
1052  00f1 4d            	tnz	a
1053  00f2 2706          	jreq	L134
1054                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1056  00f4 72125050      	bset	20560,#1
1058  00f8 2004          	jra	L334
1059  00fa               L134:
1060                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1062  00fa 72135050      	bres	20560,#1
1063  00fe               L334:
1064                     ; 562 }
1067  00fe 81            	ret
1176                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1176                     ; 577 {
1177                     	switch	.text
1178  00ff               _FLASH_GetFlagStatus:
1180  00ff 88            	push	a
1181       00000001      OFST:	set	1
1184                     ; 578   FlagStatus status = RESET;
1186                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1188                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1190  0100 c45054        	and	a,20564
1191  0103 2706          	jreq	L505
1192                     ; 584     status = SET; /* Flash_FLAG is set*/
1194  0105 a601          	ld	a,#1
1195  0107 6b01          	ld	(OFST+0,sp),a
1198  0109 2002          	jra	L705
1199  010b               L505:
1200                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1202  010b 0f01          	clr	(OFST+0,sp)
1204  010d               L705:
1205                     ; 592   return status;
1207  010d 7b01          	ld	a,(OFST+0,sp)
1210  010f 5b01          	addw	sp,#1
1211  0111 81            	ret
1247                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1247                     ; 720 {
1248                     	switch	.text
1249  0112               _FLASH_PowerRunModeConfig:
1253                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1255                     ; 724   if(FLASH_Power != FLASH_Power_On)
1257  0112 a101          	cp	a,#1
1258  0114 2706          	jreq	L725
1259                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1261  0116 72165050      	bset	20560,#3
1263  011a 2004          	jra	L135
1264  011c               L725:
1265                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1267  011c 72175050      	bres	20560,#3
1268  0120               L135:
1269                     ; 732 }
1272  0120 81            	ret
1336                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1336                     ; 746 {
1337                     	switch	.text
1338  0121               _FLASH_GetPowerStatus:
1342                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1344  0121 c65050        	ld	a,20560
1345  0124 a40c          	and	a,#12
1348  0126 81            	ret
1452                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1452                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1452                     ; 767 {
1453                     	switch	.text
1454  0127               _FLASH_ProgramBlock:
1456  0127 89            	pushw	x
1457  0128 5206          	subw	sp,#6
1458       00000006      OFST:	set	6
1461                     ; 768   uint16_t Count = 0;
1463                     ; 769   uint32_t startaddress = 0;
1465                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1467                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1469                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1471  012a 7b0b          	ld	a,(OFST+5,sp)
1472  012c a1fd          	cp	a,#253
1473  012e 260c          	jrne	L136
1474                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1476                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1478  0130 ae8000        	ldw	x,#32768
1479  0133 1f03          	ldw	(OFST-3,sp),x
1480  0135 ae0000        	ldw	x,#0
1481  0138 1f01          	ldw	(OFST-5,sp),x
1484  013a 200a          	jra	L336
1485  013c               L136:
1486                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1488                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1490  013c ae1000        	ldw	x,#4096
1491  013f 1f03          	ldw	(OFST-3,sp),x
1492  0141 ae0000        	ldw	x,#0
1493  0144 1f01          	ldw	(OFST-5,sp),x
1495  0146               L336:
1496                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1498  0146 1e07          	ldw	x,(OFST+1,sp)
1499  0148 a680          	ld	a,#128
1500  014a cd0000        	call	c_cmulx
1502  014d 96            	ldw	x,sp
1503  014e 1c0001        	addw	x,#OFST-5
1504  0151 cd0000        	call	c_lgadd
1507                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1509  0154 0d0c          	tnz	(OFST+6,sp)
1510  0156 2606          	jrne	L536
1511                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1513  0158 72105051      	bset	20561,#0
1515  015c 2004          	jra	L736
1516  015e               L536:
1517                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1519  015e 72185051      	bset	20561,#4
1520  0162               L736:
1521                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1523  0162 5f            	clrw	x
1524  0163 1f05          	ldw	(OFST-1,sp),x
1526  0165               L146:
1527                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1529  0165 1e0d          	ldw	x,(OFST+7,sp)
1530  0167 72fb05        	addw	x,(OFST-1,sp)
1531  016a f6            	ld	a,(x)
1532  016b 1e03          	ldw	x,(OFST-3,sp)
1533  016d 72fb05        	addw	x,(OFST-1,sp)
1534  0170 f7            	ld	(x),a
1535                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1537  0171 1e05          	ldw	x,(OFST-1,sp)
1538  0173 1c0001        	addw	x,#1
1539  0176 1f05          	ldw	(OFST-1,sp),x
1543  0178 1e05          	ldw	x,(OFST-1,sp)
1544  017a a30080        	cpw	x,#128
1545  017d 25e6          	jrult	L146
1546                     ; 805 }
1549  017f 5b08          	addw	sp,#8
1550  0181 81            	ret
1613                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1613                     ; 818 {
1614                     	switch	.text
1615  0182               _FLASH_EraseBlock:
1617  0182 89            	pushw	x
1618  0183 5206          	subw	sp,#6
1619       00000006      OFST:	set	6
1622                     ; 819   uint32_t startaddress = 0;
1624                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1626                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1628  0185 7b0b          	ld	a,(OFST+5,sp)
1629  0187 a1fd          	cp	a,#253
1630  0189 260c          	jrne	L107
1631                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1633                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1635  018b ae8000        	ldw	x,#32768
1636  018e 1f05          	ldw	(OFST-1,sp),x
1637  0190 ae0000        	ldw	x,#0
1638  0193 1f03          	ldw	(OFST-3,sp),x
1641  0195 200a          	jra	L307
1642  0197               L107:
1643                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1645                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1647  0197 ae1000        	ldw	x,#4096
1648  019a 1f05          	ldw	(OFST-1,sp),x
1649  019c ae0000        	ldw	x,#0
1650  019f 1f03          	ldw	(OFST-3,sp),x
1652  01a1               L307:
1653                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1655  01a1 1e07          	ldw	x,(OFST+1,sp)
1656  01a3 a680          	ld	a,#128
1657  01a5 cd0000        	call	c_cmulx
1659  01a8 96            	ldw	x,sp
1660  01a9 1c0003        	addw	x,#OFST-3
1661  01ac cd0000        	call	c_ladd
1663  01af be02          	ldw	x,c_lreg+2
1664  01b1 1f01          	ldw	(OFST-5,sp),x
1666                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1668  01b3 721a5051      	bset	20561,#5
1669                     ; 855     *pwFlash = (uint32_t)0;  
1671  01b7 1e01          	ldw	x,(OFST-5,sp)
1672  01b9 a600          	ld	a,#0
1673  01bb e703          	ld	(3,x),a
1674  01bd a600          	ld	a,#0
1675  01bf e702          	ld	(2,x),a
1676  01c1 a600          	ld	a,#0
1677  01c3 e701          	ld	(1,x),a
1678  01c5 a600          	ld	a,#0
1679  01c7 f7            	ld	(x),a
1680                     ; 863 }
1683  01c8 5b08          	addw	sp,#8
1684  01ca 81            	ret
1769                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1769                     ; 876 {
1770                     	switch	.text
1771  01cb               _FLASH_WaitForLastOperation:
1773  01cb 5203          	subw	sp,#3
1774       00000003      OFST:	set	3
1777                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1779  01cd aeffff        	ldw	x,#65535
1780  01d0 1f01          	ldw	(OFST-2,sp),x
1782                     ; 878   uint8_t flagstatus = 0x00;
1784  01d2 0f03          	clr	(OFST+0,sp)
1786                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1788  01d4 a1fd          	cp	a,#253
1789  01d6 2628          	jrne	L367
1791  01d8 200e          	jra	L157
1792  01da               L747:
1793                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1793                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1795  01da c65054        	ld	a,20564
1796  01dd a405          	and	a,#5
1797  01df 6b03          	ld	(OFST+0,sp),a
1799                     ; 887       timeout--;
1801  01e1 1e01          	ldw	x,(OFST-2,sp)
1802  01e3 1d0001        	subw	x,#1
1803  01e6 1f01          	ldw	(OFST-2,sp),x
1805  01e8               L157:
1806                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1808  01e8 0d03          	tnz	(OFST+0,sp)
1809  01ea 261c          	jrne	L757
1811  01ec 1e01          	ldw	x,(OFST-2,sp)
1812  01ee 26ea          	jrne	L747
1813  01f0 2016          	jra	L757
1814  01f2               L167:
1815                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1815                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1817  01f2 c65054        	ld	a,20564
1818  01f5 a441          	and	a,#65
1819  01f7 6b03          	ld	(OFST+0,sp),a
1821                     ; 896       timeout--;
1823  01f9 1e01          	ldw	x,(OFST-2,sp)
1824  01fb 1d0001        	subw	x,#1
1825  01fe 1f01          	ldw	(OFST-2,sp),x
1827  0200               L367:
1828                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1830  0200 0d03          	tnz	(OFST+0,sp)
1831  0202 2604          	jrne	L757
1833  0204 1e01          	ldw	x,(OFST-2,sp)
1834  0206 26ea          	jrne	L167
1835  0208               L757:
1836                     ; 900   if(timeout == 0x00)
1838  0208 1e01          	ldw	x,(OFST-2,sp)
1839  020a 2604          	jrne	L177
1840                     ; 902     flagstatus = FLASH_Status_TimeOut;
1842  020c a602          	ld	a,#2
1843  020e 6b03          	ld	(OFST+0,sp),a
1845  0210               L177:
1846                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1848  0210 7b03          	ld	a,(OFST+0,sp)
1851  0212 5b03          	addw	sp,#3
1852  0214 81            	ret
1865                     	xdef	_FLASH_WaitForLastOperation
1866                     	xdef	_FLASH_EraseBlock
1867                     	xdef	_FLASH_ProgramBlock
1868                     	xdef	_FLASH_GetPowerStatus
1869                     	xdef	_FLASH_PowerRunModeConfig
1870                     	xdef	_FLASH_GetFlagStatus
1871                     	xdef	_FLASH_ITConfig
1872                     	xdef	_FLASH_EraseOptionByte
1873                     	xdef	_FLASH_ProgramOptionByte
1874                     	xdef	_FLASH_GetReadOutProtectionStatus
1875                     	xdef	_FLASH_GetCodeSize
1876                     	xdef	_FLASH_GetBootSize
1877                     	xdef	_FLASH_ReadByte
1878                     	xdef	_FLASH_ProgramWord
1879                     	xdef	_FLASH_EraseByte
1880                     	xdef	_FLASH_ProgramByte
1881                     	xdef	_FLASH_Lock
1882                     	xdef	_FLASH_Unlock
1883                     	xdef	_FLASH_DeInit
1884                     	xdef	_FLASH_PowerWaitModeConfig
1885                     	xdef	_FLASH_SetProgrammingTime
1886                     	xdef	_FLASH_GetProgrammingTime
1887                     	xref.b	c_lreg
1906                     	xref	c_ladd
1907                     	xref	c_lgadd
1908                     	xref	c_cmulx
1909                     	end
