   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 162                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 162                     ; 149 {
 164                     	switch	.text
 165  0000               _USART_DeInit:
 169                     ; 153   (void) USARTx->SR;
 171  0000 f6            	ld	a,(x)
 172                     ; 154   (void) USARTx->DR;
 174  0001 e601          	ld	a,(1,x)
 175                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 177  0003 6f03          	clr	(3,x)
 178                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 180  0005 6f02          	clr	(2,x)
 181                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 183  0007 6f04          	clr	(4,x)
 184                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 186  0009 6f05          	clr	(5,x)
 187                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 189  000b 6f06          	clr	(6,x)
 190                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 192  000d 6f07          	clr	(7,x)
 193                     ; 163 }
 196  000f 81            	ret
 388                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 388                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 388                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 388                     ; 195 {
 389                     	switch	.text
 390  0010               _USART_Init:
 392  0010 89            	pushw	x
 393  0011 5204          	subw	sp,#4
 394       00000004      OFST:	set	4
 397                     ; 196   uint32_t BaudRate_Mantissa = 0;
 399                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 401                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 403                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 405                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 407                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 409                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 411  0013 e604          	ld	a,(4,x)
 412  0015 a4e9          	and	a,#233
 413  0017 e704          	ld	(4,x),a
 414                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 416  0019 7b0d          	ld	a,(OFST+9,sp)
 417  001b 1a0f          	or	a,(OFST+11,sp)
 418  001d ea04          	or	a,(4,x)
 419  001f e704          	ld	(4,x),a
 420                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 422  0021 e606          	ld	a,(6,x)
 423  0023 a4cf          	and	a,#207
 424  0025 e706          	ld	(6,x),a
 425                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 427  0027 e606          	ld	a,(6,x)
 428  0029 1a0e          	or	a,(OFST+10,sp)
 429  002b e706          	ld	(6,x),a
 430                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 432  002d 6f02          	clr	(2,x)
 433                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 435  002f e603          	ld	a,(3,x)
 436  0031 a40f          	and	a,#15
 437  0033 e703          	ld	(3,x),a
 438                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 440  0035 e603          	ld	a,(3,x)
 441  0037 a4f0          	and	a,#240
 442  0039 e703          	ld	(3,x),a
 443                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 445  003b cd0000        	call	_CLK_GetClockFreq
 447  003e 96            	ldw	x,sp
 448  003f 1c0009        	addw	x,#OFST+5
 449  0042 cd0000        	call	c_ludv
 451  0045 96            	ldw	x,sp
 452  0046 1c0001        	addw	x,#OFST-3
 453  0049 cd0000        	call	c_rtol
 456                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 458  004c 7b03          	ld	a,(OFST-1,sp)
 459  004e a4f0          	and	a,#240
 460  0050 1e05          	ldw	x,(OFST+1,sp)
 461  0052 e703          	ld	(3,x),a
 462                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 464  0054 1e05          	ldw	x,(OFST+1,sp)
 465  0056 7b04          	ld	a,(OFST+0,sp)
 466  0058 a40f          	and	a,#15
 467  005a ea03          	or	a,(3,x)
 468  005c e703          	ld	(3,x),a
 469                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 471  005e 96            	ldw	x,sp
 472  005f 1c0001        	addw	x,#OFST-3
 473  0062 cd0000        	call	c_ltor
 475  0065 a604          	ld	a,#4
 476  0067 cd0000        	call	c_lursh
 478  006a b603          	ld	a,c_lreg+3
 479  006c 1e05          	ldw	x,(OFST+1,sp)
 480  006e e702          	ld	(2,x),a
 481                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 483  0070 1e05          	ldw	x,(OFST+1,sp)
 484  0072 e605          	ld	a,(5,x)
 485  0074 a4f3          	and	a,#243
 486  0076 e705          	ld	(5,x),a
 487                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 489  0078 1e05          	ldw	x,(OFST+1,sp)
 490  007a e605          	ld	a,(5,x)
 491  007c 1a10          	or	a,(OFST+12,sp)
 492  007e e705          	ld	(5,x),a
 493                     ; 239 }
 496  0080 5b06          	addw	sp,#6
 497  0082 81            	ret
 657                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 657                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 657                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 657                     ; 267 {
 658                     	switch	.text
 659  0083               _USART_ClockInit:
 661  0083 89            	pushw	x
 662       00000000      OFST:	set	0
 665                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 667                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 669                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 671                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 673                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 675  0084 e606          	ld	a,(6,x)
 676  0086 a4f8          	and	a,#248
 677  0088 e706          	ld	(6,x),a
 678                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 680  008a 7b06          	ld	a,(OFST+6,sp)
 681  008c 1a07          	or	a,(OFST+7,sp)
 682  008e 1a08          	or	a,(OFST+8,sp)
 683  0090 ea06          	or	a,(6,x)
 684  0092 e706          	ld	(6,x),a
 685                     ; 279   if (USART_Clock != USART_Clock_Disable)
 687  0094 0d05          	tnz	(OFST+5,sp)
 688  0096 2708          	jreq	L523
 689                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 691  0098 e606          	ld	a,(6,x)
 692  009a aa08          	or	a,#8
 693  009c e706          	ld	(6,x),a
 695  009e 2008          	jra	L723
 696  00a0               L523:
 697                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 699  00a0 1e01          	ldw	x,(OFST+1,sp)
 700  00a2 e606          	ld	a,(6,x)
 701  00a4 a4f7          	and	a,#247
 702  00a6 e706          	ld	(6,x),a
 703  00a8               L723:
 704                     ; 287 }
 707  00a8 85            	popw	x
 708  00a9 81            	ret
 775                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 775                     ; 297 {
 776                     	switch	.text
 777  00aa               _USART_Cmd:
 779  00aa 89            	pushw	x
 780       00000000      OFST:	set	0
 783                     ; 298   if (NewState != DISABLE)
 785  00ab 0d05          	tnz	(OFST+5,sp)
 786  00ad 2708          	jreq	L563
 787                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 789  00af e604          	ld	a,(4,x)
 790  00b1 a4df          	and	a,#223
 791  00b3 e704          	ld	(4,x),a
 793  00b5 2008          	jra	L763
 794  00b7               L563:
 795                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 797  00b7 1e01          	ldw	x,(OFST+1,sp)
 798  00b9 e604          	ld	a,(4,x)
 799  00bb aa20          	or	a,#32
 800  00bd e704          	ld	(4,x),a
 801  00bf               L763:
 802                     ; 306 }
 805  00bf 85            	popw	x
 806  00c0 81            	ret
 852                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 852                     ; 330 {
 853                     	switch	.text
 854  00c1               _USART_SetPrescaler:
 856  00c1 89            	pushw	x
 857       00000000      OFST:	set	0
 860                     ; 332   USARTx->PSCR = USART_Prescaler;
 862  00c2 7b05          	ld	a,(OFST+5,sp)
 863  00c4 1e01          	ldw	x,(OFST+1,sp)
 864  00c6 e70a          	ld	(10,x),a
 865                     ; 333 }
 868  00c8 85            	popw	x
 869  00c9 81            	ret
 906                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 906                     ; 341 {
 907                     	switch	.text
 908  00ca               _USART_SendBreak:
 912                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 914  00ca e605          	ld	a,(5,x)
 915  00cc aa01          	or	a,#1
 916  00ce e705          	ld	(5,x),a
 917                     ; 343 }
 920  00d0 81            	ret
 957                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 957                     ; 383 {
 958                     	switch	.text
 959  00d1               _USART_ReceiveData8:
 963                     ; 384   return USARTx->DR;
 965  00d1 e601          	ld	a,(1,x)
 968  00d3 81            	ret
1014                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1014                     ; 393 {
1015                     	switch	.text
1016  00d4               _USART_ReceiveData9:
1018  00d4 89            	pushw	x
1019  00d5 89            	pushw	x
1020       00000002      OFST:	set	2
1023                     ; 394   uint16_t temp = 0;
1025                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1027  00d6 e604          	ld	a,(4,x)
1028  00d8 5f            	clrw	x
1029  00d9 a480          	and	a,#128
1030  00db 5f            	clrw	x
1031  00dc 02            	rlwa	x,a
1032  00dd 58            	sllw	x
1033  00de 1f01          	ldw	(OFST-1,sp),x
1035                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1037  00e0 1e03          	ldw	x,(OFST+1,sp)
1038  00e2 e601          	ld	a,(1,x)
1039  00e4 5f            	clrw	x
1040  00e5 97            	ld	xl,a
1041  00e6 01            	rrwa	x,a
1042  00e7 1a02          	or	a,(OFST+0,sp)
1043  00e9 01            	rrwa	x,a
1044  00ea 1a01          	or	a,(OFST-1,sp)
1045  00ec 01            	rrwa	x,a
1046  00ed 01            	rrwa	x,a
1047  00ee a4ff          	and	a,#255
1048  00f0 01            	rrwa	x,a
1049  00f1 a401          	and	a,#1
1050  00f3 01            	rrwa	x,a
1053  00f4 5b04          	addw	sp,#4
1054  00f6 81            	ret
1100                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1100                     ; 406 {
1101                     	switch	.text
1102  00f7               _USART_SendData8:
1104  00f7 89            	pushw	x
1105       00000000      OFST:	set	0
1108                     ; 408   USARTx->DR = Data;
1110  00f8 7b05          	ld	a,(OFST+5,sp)
1111  00fa 1e01          	ldw	x,(OFST+1,sp)
1112  00fc e701          	ld	(1,x),a
1113                     ; 409 }
1116  00fe 85            	popw	x
1117  00ff 81            	ret
1163                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1163                     ; 419 {
1164                     	switch	.text
1165  0100               _USART_SendData9:
1167  0100 89            	pushw	x
1168       00000000      OFST:	set	0
1171                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1173                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1175  0101 e604          	ld	a,(4,x)
1176  0103 a4bf          	and	a,#191
1177  0105 e704          	ld	(4,x),a
1178                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1180  0107 1605          	ldw	y,(OFST+5,sp)
1181  0109 9054          	srlw	y
1182  010b 9054          	srlw	y
1183  010d 909f          	ld	a,yl
1184  010f a440          	and	a,#64
1185  0111 ea04          	or	a,(4,x)
1186  0113 e704          	ld	(4,x),a
1187                     ; 429   USARTx->DR   = (uint8_t)(Data);
1189  0115 7b06          	ld	a,(OFST+6,sp)
1190  0117 1e01          	ldw	x,(OFST+1,sp)
1191  0119 e701          	ld	(1,x),a
1192                     ; 430 }
1195  011b 85            	popw	x
1196  011c 81            	ret
1244                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1244                     ; 474 {
1245                     	switch	.text
1246  011d               _USART_ReceiverWakeUpCmd:
1248  011d 89            	pushw	x
1249       00000000      OFST:	set	0
1252                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1254                     ; 477   if (NewState != DISABLE)
1256  011e 0d05          	tnz	(OFST+5,sp)
1257  0120 2708          	jreq	L575
1258                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1260  0122 e605          	ld	a,(5,x)
1261  0124 aa02          	or	a,#2
1262  0126 e705          	ld	(5,x),a
1264  0128 2008          	jra	L775
1265  012a               L575:
1266                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1268  012a 1e01          	ldw	x,(OFST+1,sp)
1269  012c e605          	ld	a,(5,x)
1270  012e a4fd          	and	a,#253
1271  0130 e705          	ld	(5,x),a
1272  0132               L775:
1273                     ; 487 }
1276  0132 85            	popw	x
1277  0133 81            	ret
1323                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1323                     ; 497 {
1324                     	switch	.text
1325  0134               _USART_SetAddress:
1327  0134 89            	pushw	x
1328       00000000      OFST:	set	0
1331                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1333                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1335  0135 e607          	ld	a,(7,x)
1336  0137 a4f0          	and	a,#240
1337  0139 e707          	ld	(7,x),a
1338                     ; 504   USARTx->CR4 |= USART_Address;
1340  013b e607          	ld	a,(7,x)
1341  013d 1a05          	or	a,(OFST+5,sp)
1342  013f e707          	ld	(7,x),a
1343                     ; 505 }
1346  0141 85            	popw	x
1347  0142 81            	ret
1416                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1416                     ; 516 {
1417                     	switch	.text
1418  0143               _USART_WakeUpConfig:
1420  0143 89            	pushw	x
1421       00000000      OFST:	set	0
1424                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1426                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1428  0144 e604          	ld	a,(4,x)
1429  0146 a4f7          	and	a,#247
1430  0148 e704          	ld	(4,x),a
1431                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1433  014a e604          	ld	a,(4,x)
1434  014c 1a05          	or	a,(OFST+5,sp)
1435  014e e704          	ld	(4,x),a
1436                     ; 521 }
1439  0150 85            	popw	x
1440  0151 81            	ret
1488                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1488                     ; 567 {
1489                     	switch	.text
1490  0152               _USART_HalfDuplexCmd:
1492  0152 89            	pushw	x
1493       00000000      OFST:	set	0
1496                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1498                     ; 570   if (NewState != DISABLE)
1500  0153 0d05          	tnz	(OFST+5,sp)
1501  0155 2708          	jreq	L507
1502                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1504  0157 e608          	ld	a,(8,x)
1505  0159 aa08          	or	a,#8
1506  015b e708          	ld	(8,x),a
1508  015d 2008          	jra	L707
1509  015f               L507:
1510                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1512  015f 1e01          	ldw	x,(OFST+1,sp)
1513  0161 e608          	ld	a,(8,x)
1514  0163 a4f7          	and	a,#247
1515  0165 e708          	ld	(8,x),a
1516  0167               L707:
1517                     ; 578 }
1520  0167 85            	popw	x
1521  0168 81            	ret
1568                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1568                     ; 645 {
1569                     	switch	.text
1570  0169               _USART_SmartCardCmd:
1572  0169 89            	pushw	x
1573       00000000      OFST:	set	0
1576                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1578                     ; 648   if (NewState != DISABLE)
1580  016a 0d05          	tnz	(OFST+5,sp)
1581  016c 2708          	jreq	L537
1582                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1584  016e e608          	ld	a,(8,x)
1585  0170 aa20          	or	a,#32
1586  0172 e708          	ld	(8,x),a
1588  0174 2008          	jra	L737
1589  0176               L537:
1590                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1592  0176 1e01          	ldw	x,(OFST+1,sp)
1593  0178 e608          	ld	a,(8,x)
1594  017a a4df          	and	a,#223
1595  017c e708          	ld	(8,x),a
1596  017e               L737:
1597                     ; 658 }
1600  017e 85            	popw	x
1601  017f 81            	ret
1649                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1649                     ; 668 {
1650                     	switch	.text
1651  0180               _USART_SmartCardNACKCmd:
1653  0180 89            	pushw	x
1654       00000000      OFST:	set	0
1657                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1659                     ; 671   if (NewState != DISABLE)
1661  0181 0d05          	tnz	(OFST+5,sp)
1662  0183 2708          	jreq	L567
1663                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1665  0185 e608          	ld	a,(8,x)
1666  0187 aa10          	or	a,#16
1667  0189 e708          	ld	(8,x),a
1669  018b 2008          	jra	L767
1670  018d               L567:
1671                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1673  018d 1e01          	ldw	x,(OFST+1,sp)
1674  018f e608          	ld	a,(8,x)
1675  0191 a4ef          	and	a,#239
1676  0193 e708          	ld	(8,x),a
1677  0195               L767:
1678                     ; 681 }
1681  0195 85            	popw	x
1682  0196 81            	ret
1728                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1728                     ; 691 {
1729                     	switch	.text
1730  0197               _USART_SetGuardTime:
1732  0197 89            	pushw	x
1733       00000000      OFST:	set	0
1736                     ; 693   USARTx->GTR = USART_GuardTime;
1738  0198 7b05          	ld	a,(OFST+5,sp)
1739  019a 1e01          	ldw	x,(OFST+1,sp)
1740  019c e709          	ld	(9,x),a
1741                     ; 694 }
1744  019e 85            	popw	x
1745  019f 81            	ret
1814                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1814                     ; 752 {
1815                     	switch	.text
1816  01a0               _USART_IrDAConfig:
1818  01a0 89            	pushw	x
1819       00000000      OFST:	set	0
1822                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1824                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1826  01a1 0d05          	tnz	(OFST+5,sp)
1827  01a3 2708          	jreq	L1501
1828                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1830  01a5 e608          	ld	a,(8,x)
1831  01a7 aa04          	or	a,#4
1832  01a9 e708          	ld	(8,x),a
1834  01ab 2008          	jra	L3501
1835  01ad               L1501:
1836                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1838  01ad 1e01          	ldw	x,(OFST+1,sp)
1839  01af e608          	ld	a,(8,x)
1840  01b1 a4fb          	and	a,#251
1841  01b3 e708          	ld	(8,x),a
1842  01b5               L3501:
1843                     ; 763 }
1846  01b5 85            	popw	x
1847  01b6 81            	ret
1894                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1894                     ; 773 {
1895                     	switch	.text
1896  01b7               _USART_IrDACmd:
1898  01b7 89            	pushw	x
1899       00000000      OFST:	set	0
1902                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1904                     ; 778   if (NewState != DISABLE)
1906  01b8 0d05          	tnz	(OFST+5,sp)
1907  01ba 2708          	jreq	L1011
1908                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1910  01bc e608          	ld	a,(8,x)
1911  01be aa02          	or	a,#2
1912  01c0 e708          	ld	(8,x),a
1914  01c2 2008          	jra	L3011
1915  01c4               L1011:
1916                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1918  01c4 1e01          	ldw	x,(OFST+1,sp)
1919  01c6 e608          	ld	a,(8,x)
1920  01c8 a4fd          	and	a,#253
1921  01ca e708          	ld	(8,x),a
1922  01cc               L3011:
1923                     ; 788 }
1926  01cc 85            	popw	x
1927  01cd 81            	ret
2004                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2004                     ; 819                   FunctionalState NewState)
2004                     ; 820 {
2005                     	switch	.text
2006  01ce               _USART_DMACmd:
2008  01ce 89            	pushw	x
2009       00000000      OFST:	set	0
2012                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2014                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2016                     ; 825   if (NewState != DISABLE)
2018  01cf 0d06          	tnz	(OFST+6,sp)
2019  01d1 2708          	jreq	L5411
2020                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2022  01d3 e608          	ld	a,(8,x)
2023  01d5 1a05          	or	a,(OFST+5,sp)
2024  01d7 e708          	ld	(8,x),a
2026  01d9 2009          	jra	L7411
2027  01db               L5411:
2028                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2030  01db 1e01          	ldw	x,(OFST+1,sp)
2031  01dd 7b05          	ld	a,(OFST+5,sp)
2032  01df 43            	cpl	a
2033  01e0 e408          	and	a,(8,x)
2034  01e2 e708          	ld	(8,x),a
2035  01e4               L7411:
2036                     ; 837 }
2039  01e4 85            	popw	x
2040  01e5 81            	ret
2184                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2184                     ; 940 {
2185                     	switch	.text
2186  01e6               _USART_ITConfig:
2188  01e6 89            	pushw	x
2189  01e7 89            	pushw	x
2190       00000002      OFST:	set	2
2193                     ; 941   uint8_t usartreg, itpos = 0x00;
2195                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2197                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2199                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2201  01e8 7b07          	ld	a,(OFST+5,sp)
2202  01ea 6b01          	ld	(OFST-1,sp),a
2204                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2206  01ec 7b08          	ld	a,(OFST+6,sp)
2207  01ee a40f          	and	a,#15
2208  01f0 5f            	clrw	x
2209  01f1 97            	ld	xl,a
2210  01f2 a601          	ld	a,#1
2211  01f4 5d            	tnzw	x
2212  01f5 2704          	jreq	L65
2213  01f7               L06:
2214  01f7 48            	sll	a
2215  01f8 5a            	decw	x
2216  01f9 26fc          	jrne	L06
2217  01fb               L65:
2218  01fb 6b02          	ld	(OFST+0,sp),a
2220                     ; 950   if (NewState != DISABLE)
2222  01fd 0d09          	tnz	(OFST+7,sp)
2223  01ff 272a          	jreq	L7321
2224                     ; 953     if (usartreg == 0x01)
2226  0201 7b01          	ld	a,(OFST-1,sp)
2227  0203 a101          	cp	a,#1
2228  0205 260a          	jrne	L1421
2229                     ; 955       USARTx->CR1 |= itpos;
2231  0207 1e03          	ldw	x,(OFST+1,sp)
2232  0209 e604          	ld	a,(4,x)
2233  020b 1a02          	or	a,(OFST+0,sp)
2234  020d e704          	ld	(4,x),a
2236  020f 2045          	jra	L1521
2237  0211               L1421:
2238                     ; 957     else if (usartreg == 0x05)
2240  0211 7b01          	ld	a,(OFST-1,sp)
2241  0213 a105          	cp	a,#5
2242  0215 260a          	jrne	L5421
2243                     ; 959       USARTx->CR5 |= itpos;
2245  0217 1e03          	ldw	x,(OFST+1,sp)
2246  0219 e608          	ld	a,(8,x)
2247  021b 1a02          	or	a,(OFST+0,sp)
2248  021d e708          	ld	(8,x),a
2250  021f 2035          	jra	L1521
2251  0221               L5421:
2252                     ; 964       USARTx->CR2 |= itpos;
2254  0221 1e03          	ldw	x,(OFST+1,sp)
2255  0223 e605          	ld	a,(5,x)
2256  0225 1a02          	or	a,(OFST+0,sp)
2257  0227 e705          	ld	(5,x),a
2258  0229 202b          	jra	L1521
2259  022b               L7321:
2260                     ; 970     if (usartreg == 0x01)
2262  022b 7b01          	ld	a,(OFST-1,sp)
2263  022d a101          	cp	a,#1
2264  022f 260b          	jrne	L3521
2265                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2267  0231 1e03          	ldw	x,(OFST+1,sp)
2268  0233 7b02          	ld	a,(OFST+0,sp)
2269  0235 43            	cpl	a
2270  0236 e404          	and	a,(4,x)
2271  0238 e704          	ld	(4,x),a
2273  023a 201a          	jra	L1521
2274  023c               L3521:
2275                     ; 974     else if (usartreg == 0x05)
2277  023c 7b01          	ld	a,(OFST-1,sp)
2278  023e a105          	cp	a,#5
2279  0240 260b          	jrne	L7521
2280                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2282  0242 1e03          	ldw	x,(OFST+1,sp)
2283  0244 7b02          	ld	a,(OFST+0,sp)
2284  0246 43            	cpl	a
2285  0247 e408          	and	a,(8,x)
2286  0249 e708          	ld	(8,x),a
2288  024b 2009          	jra	L1521
2289  024d               L7521:
2290                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2292  024d 1e03          	ldw	x,(OFST+1,sp)
2293  024f 7b02          	ld	a,(OFST+0,sp)
2294  0251 43            	cpl	a
2295  0252 e405          	and	a,(5,x)
2296  0254 e705          	ld	(5,x),a
2297  0256               L1521:
2298                     ; 984 }
2301  0256 5b04          	addw	sp,#4
2302  0258 81            	ret
2450                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2450                     ; 1003 {
2451                     	switch	.text
2452  0259               _USART_GetFlagStatus:
2454  0259 89            	pushw	x
2455  025a 88            	push	a
2456       00000001      OFST:	set	1
2459                     ; 1004   FlagStatus status = RESET;
2461                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2463                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2465  025b 1e06          	ldw	x,(OFST+5,sp)
2466  025d a30101        	cpw	x,#257
2467  0260 2612          	jrne	L1531
2468                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2470  0262 1e02          	ldw	x,(OFST+1,sp)
2471  0264 e605          	ld	a,(5,x)
2472  0266 1507          	bcp	a,(OFST+6,sp)
2473  0268 2706          	jreq	L3531
2474                     ; 1014       status = SET;
2476  026a a601          	ld	a,#1
2477  026c 6b01          	ld	(OFST+0,sp),a
2480  026e 2013          	jra	L7531
2481  0270               L3531:
2482                     ; 1019       status = RESET;
2484  0270 0f01          	clr	(OFST+0,sp)
2486  0272 200f          	jra	L7531
2487  0274               L1531:
2488                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2490  0274 1e02          	ldw	x,(OFST+1,sp)
2491  0276 f6            	ld	a,(x)
2492  0277 1507          	bcp	a,(OFST+6,sp)
2493  0279 2706          	jreq	L1631
2494                     ; 1027       status = SET;
2496  027b a601          	ld	a,#1
2497  027d 6b01          	ld	(OFST+0,sp),a
2500  027f 2002          	jra	L7531
2501  0281               L1631:
2502                     ; 1032       status = RESET;
2504  0281 0f01          	clr	(OFST+0,sp)
2506  0283               L7531:
2507                     ; 1036   return status;
2509  0283 7b01          	ld	a,(OFST+0,sp)
2512  0285 5b03          	addw	sp,#3
2513  0287 81            	ret
2560                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2560                     ; 1061 {
2561                     	switch	.text
2562  0288               _USART_ClearFlag:
2564  0288 89            	pushw	x
2565       00000000      OFST:	set	0
2568                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2570                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2572  0289 7b06          	ld	a,(OFST+6,sp)
2573  028b 43            	cpl	a
2574  028c 1e01          	ldw	x,(OFST+1,sp)
2575  028e f7            	ld	(x),a
2576                     ; 1066 }
2579  028f 85            	popw	x
2580  0290 81            	ret
2683                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2683                     ; 1084 {
2684                     	switch	.text
2685  0291               _USART_GetITStatus:
2687  0291 89            	pushw	x
2688  0292 5203          	subw	sp,#3
2689       00000003      OFST:	set	3
2692                     ; 1085   ITStatus pendingbitstatus = RESET;
2694                     ; 1086   uint8_t temp = 0;
2696                     ; 1087   uint8_t itpos = 0;
2698                     ; 1088   uint8_t itmask1 = 0;
2700                     ; 1089   uint8_t itmask2 = 0;
2702                     ; 1090   uint8_t enablestatus = 0;
2704                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2706                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2708  0294 7b09          	ld	a,(OFST+6,sp)
2709  0296 a40f          	and	a,#15
2710  0298 5f            	clrw	x
2711  0299 97            	ld	xl,a
2712  029a a601          	ld	a,#1
2713  029c 5d            	tnzw	x
2714  029d 2704          	jreq	L07
2715  029f               L27:
2716  029f 48            	sll	a
2717  02a0 5a            	decw	x
2718  02a1 26fc          	jrne	L27
2719  02a3               L07:
2720  02a3 6b02          	ld	(OFST-1,sp),a
2722                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2724  02a5 7b09          	ld	a,(OFST+6,sp)
2725  02a7 4e            	swap	a
2726  02a8 a40f          	and	a,#15
2727  02aa 6b03          	ld	(OFST+0,sp),a
2729                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2731  02ac 7b03          	ld	a,(OFST+0,sp)
2732  02ae 5f            	clrw	x
2733  02af 97            	ld	xl,a
2734  02b0 a601          	ld	a,#1
2735  02b2 5d            	tnzw	x
2736  02b3 2704          	jreq	L47
2737  02b5               L67:
2738  02b5 48            	sll	a
2739  02b6 5a            	decw	x
2740  02b7 26fc          	jrne	L67
2741  02b9               L47:
2742  02b9 6b03          	ld	(OFST+0,sp),a
2744                     ; 1103   if (USART_IT == USART_IT_PE)
2746  02bb 1e08          	ldw	x,(OFST+5,sp)
2747  02bd a30100        	cpw	x,#256
2748  02c0 261d          	jrne	L5641
2749                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2751  02c2 1e04          	ldw	x,(OFST+1,sp)
2752  02c4 e604          	ld	a,(4,x)
2753  02c6 1403          	and	a,(OFST+0,sp)
2754  02c8 6b03          	ld	(OFST+0,sp),a
2756                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2758  02ca 1e04          	ldw	x,(OFST+1,sp)
2759  02cc f6            	ld	a,(x)
2760  02cd 1502          	bcp	a,(OFST-1,sp)
2761  02cf 270a          	jreq	L7641
2763  02d1 0d03          	tnz	(OFST+0,sp)
2764  02d3 2706          	jreq	L7641
2765                     ; 1112       pendingbitstatus = SET;
2767  02d5 a601          	ld	a,#1
2768  02d7 6b03          	ld	(OFST+0,sp),a
2771  02d9 204f          	jra	L3741
2772  02db               L7641:
2773                     ; 1117       pendingbitstatus = RESET;
2775  02db 0f03          	clr	(OFST+0,sp)
2777  02dd 204b          	jra	L3741
2778  02df               L5641:
2779                     ; 1121   else if (USART_IT == USART_IT_OR)
2781  02df 1e08          	ldw	x,(OFST+5,sp)
2782  02e1 a30235        	cpw	x,#565
2783  02e4 2629          	jrne	L5741
2784                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2786  02e6 1e04          	ldw	x,(OFST+1,sp)
2787  02e8 e605          	ld	a,(5,x)
2788  02ea 1403          	and	a,(OFST+0,sp)
2789  02ec 6b03          	ld	(OFST+0,sp),a
2791                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2793  02ee 1e04          	ldw	x,(OFST+1,sp)
2794  02f0 e608          	ld	a,(8,x)
2795  02f2 a401          	and	a,#1
2796  02f4 6b01          	ld	(OFST-2,sp),a
2798                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2800  02f6 1e04          	ldw	x,(OFST+1,sp)
2801  02f8 f6            	ld	a,(x)
2802  02f9 1502          	bcp	a,(OFST-1,sp)
2803  02fb 270e          	jreq	L7741
2805  02fd 0d03          	tnz	(OFST+0,sp)
2806  02ff 2604          	jrne	L1051
2808  0301 0d01          	tnz	(OFST-2,sp)
2809  0303 2706          	jreq	L7741
2810  0305               L1051:
2811                     ; 1132       pendingbitstatus = SET;
2813  0305 a601          	ld	a,#1
2814  0307 6b03          	ld	(OFST+0,sp),a
2817  0309 201f          	jra	L3741
2818  030b               L7741:
2819                     ; 1137       pendingbitstatus = RESET;
2821  030b 0f03          	clr	(OFST+0,sp)
2823  030d 201b          	jra	L3741
2824  030f               L5741:
2825                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2827  030f 1e04          	ldw	x,(OFST+1,sp)
2828  0311 e605          	ld	a,(5,x)
2829  0313 1403          	and	a,(OFST+0,sp)
2830  0315 6b03          	ld	(OFST+0,sp),a
2832                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2834  0317 1e04          	ldw	x,(OFST+1,sp)
2835  0319 f6            	ld	a,(x)
2836  031a 1502          	bcp	a,(OFST-1,sp)
2837  031c 270a          	jreq	L7051
2839  031e 0d03          	tnz	(OFST+0,sp)
2840  0320 2706          	jreq	L7051
2841                     ; 1149       pendingbitstatus = SET;
2843  0322 a601          	ld	a,#1
2844  0324 6b03          	ld	(OFST+0,sp),a
2847  0326 2002          	jra	L3741
2848  0328               L7051:
2849                     ; 1154       pendingbitstatus = RESET;
2851  0328 0f03          	clr	(OFST+0,sp)
2853  032a               L3741:
2854                     ; 1159   return  pendingbitstatus;
2856  032a 7b03          	ld	a,(OFST+0,sp)
2859  032c 5b05          	addw	sp,#5
2860  032e 81            	ret
2898                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2898                     ; 1184 {
2899                     	switch	.text
2900  032f               _USART_ClearITPendingBit:
2904                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2906                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2908  032f f6            	ld	a,(x)
2909  0330 a4bf          	and	a,#191
2910  0332 f7            	ld	(x),a
2911                     ; 1189 }
2914  0333 81            	ret
2927                     	xdef	_USART_ClearITPendingBit
2928                     	xdef	_USART_GetITStatus
2929                     	xdef	_USART_ClearFlag
2930                     	xdef	_USART_GetFlagStatus
2931                     	xdef	_USART_ITConfig
2932                     	xdef	_USART_DMACmd
2933                     	xdef	_USART_IrDACmd
2934                     	xdef	_USART_IrDAConfig
2935                     	xdef	_USART_SetGuardTime
2936                     	xdef	_USART_SmartCardNACKCmd
2937                     	xdef	_USART_SmartCardCmd
2938                     	xdef	_USART_HalfDuplexCmd
2939                     	xdef	_USART_SetAddress
2940                     	xdef	_USART_ReceiverWakeUpCmd
2941                     	xdef	_USART_WakeUpConfig
2942                     	xdef	_USART_ReceiveData9
2943                     	xdef	_USART_ReceiveData8
2944                     	xdef	_USART_SendData9
2945                     	xdef	_USART_SendData8
2946                     	xdef	_USART_SendBreak
2947                     	xdef	_USART_SetPrescaler
2948                     	xdef	_USART_Cmd
2949                     	xdef	_USART_ClockInit
2950                     	xdef	_USART_Init
2951                     	xdef	_USART_DeInit
2952                     	xref	_CLK_GetClockFreq
2953                     	xref.b	c_lreg
2954                     	xref.b	c_x
2973                     	xref	c_lursh
2974                     	xref	c_ltor
2975                     	xref	c_rtol
2976                     	xref	c_ludv
2977                     	end
