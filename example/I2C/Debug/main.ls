   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  79                     ; 35 int main(void) {
  81                     	switch	.text
  82  0000               _main:
  84  0000 520b          	subw	sp,#11
  85       0000000b      OFST:	set	11
  88                     ; 39 	int16_t Temperature = 0;
  90                     ; 41 	CLK_Initialization_I2C();
  92  0002 cd00c4        	call	_CLK_Initialization_I2C
  94                     ; 42 	GPIO_Initialization();
  96  0005 ad76          	call	_GPIO_Initialization
  98                     ; 43 	I2C_Initialization(100000);	// Hz
 100  0007 ae86a0        	ldw	x,#34464
 101  000a 89            	pushw	x
 102  000b ae0001        	ldw	x,#1
 103  000e 89            	pushw	x
 104  000f cd009a        	call	_I2C_Initialization
 106  0012 5b04          	addw	sp,#4
 107                     ; 45 	TxResolution[0] = 0x08;			// Resolution pointer
 109  0014 a608          	ld	a,#8
 110  0016 6b05          	ld	(OFST-6,sp),a
 112                     ; 46 	TxResolution[1] = 0x00;			// Resolution +0.5C	30ms conversion
 114  0018 0f06          	clr	(OFST-5,sp)
 116                     ; 48 	GPIO_DeInit(GPIOB);
 118  001a ae5005        	ldw	x,#20485
 119  001d cd0000        	call	_GPIO_DeInit
 121                     ; 49 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
 123  0020 4be0          	push	#224
 124  0022 4b40          	push	#64
 125  0024 ae5005        	ldw	x,#20485
 126  0027 cd0000        	call	_GPIO_Init
 128  002a 85            	popw	x
 129  002b               L73:
 130                     ; 52 		Grab_Temperature(SLAVE_ADDR, TEMP_REGISTER, Rx);
 132  002b 96            	ldw	x,sp
 133  002c 1c000a        	addw	x,#OFST-1
 134  002f 89            	pushw	x
 135  0030 ae1805        	ldw	x,#6149
 136  0033 cd0222        	call	_Grab_Temperature
 138  0036 85            	popw	x
 139                     ; 54 		Rx[1] &= 0x1F;				// Clear flags
 141  0037 7b0b          	ld	a,(OFST+0,sp)
 142  0039 a41f          	and	a,#31
 143  003b 6b0b          	ld	(OFST+0,sp),a
 145                     ; 57 		if((Rx[1] & 0x10) == 0x10) {		// Temp < 0C
 147  003d 7b0b          	ld	a,(OFST+0,sp)
 148  003f a410          	and	a,#16
 149  0041 a110          	cp	a,#16
 150  0043 2623          	jrne	L34
 151                     ; 58 			Rx[1] &= 0x0F;			// Clear SIGN bit
 153  0045 7b0b          	ld	a,(OFST+0,sp)
 154  0047 a40f          	and	a,#15
 155  0049 6b0b          	ld	(OFST+0,sp),a
 157                     ; 59 			Temperature = 256 - (Rx[1] * 16 + Rx[0] / 16);
 159  004b 7b0a          	ld	a,(OFST-1,sp)
 160  004d 5f            	clrw	x
 161  004e 97            	ld	xl,a
 162  004f 57            	sraw	x
 163  0050 57            	sraw	x
 164  0051 57            	sraw	x
 165  0052 57            	sraw	x
 166  0053 1f03          	ldw	(OFST-8,sp),x
 168  0055 7b0b          	ld	a,(OFST+0,sp)
 169  0057 97            	ld	xl,a
 170  0058 a610          	ld	a,#16
 171  005a 42            	mul	x,a
 172  005b 72fb03        	addw	x,(OFST-8,sp)
 173  005e 1f01          	ldw	(OFST-10,sp),x
 175  0060 ae0100        	ldw	x,#256
 176  0063 72f001        	subw	x,(OFST-10,sp)
 178  0066 20c3          	jra	L73
 179  0068               L34:
 180                     ; 62 			Temperature = Rx[1] * 16 + Rx[0] / 16;
 182  0068 7b0a          	ld	a,(OFST-1,sp)
 183  006a 5f            	clrw	x
 184  006b 97            	ld	xl,a
 185  006c 57            	sraw	x
 186  006d 57            	sraw	x
 187  006e 57            	sraw	x
 188  006f 57            	sraw	x
 189  0070 1f03          	ldw	(OFST-8,sp),x
 191  0072 7b0b          	ld	a,(OFST+0,sp)
 192  0074 97            	ld	xl,a
 193  0075 a610          	ld	a,#16
 194  0077 42            	mul	x,a
 195  0078 72fb03        	addw	x,(OFST-8,sp)
 196  007b 20ae          	jra	L73
 222                     ; 79 void GPIO_Initialization(void) {
 223                     	switch	.text
 224  007d               _GPIO_Initialization:
 228                     ; 80 	GPIO_DeInit(GPIOC);
 230  007d ae500a        	ldw	x,#20490
 231  0080 cd0000        	call	_GPIO_DeInit
 233                     ; 82 	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_Out_OD_HiZ_Fast);	// Set PC0 and PC1 output
 235  0083 4bb0          	push	#176
 236  0085 4b01          	push	#1
 237  0087 ae500a        	ldw	x,#20490
 238  008a cd0000        	call	_GPIO_Init
 240  008d 85            	popw	x
 241                     ; 83 	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_OD_HiZ_Fast);
 243  008e 4bb0          	push	#176
 244  0090 4b02          	push	#2
 245  0092 ae500a        	ldw	x,#20490
 246  0095 cd0000        	call	_GPIO_Init
 248  0098 85            	popw	x
 249                     ; 85 }
 252  0099 81            	ret
 289                     ; 99 void I2C_Initialization(uint32_t frequency) {
 290                     	switch	.text
 291  009a               _I2C_Initialization:
 293       00000000      OFST:	set	0
 296                     ; 100 	I2C_DeInit(I2C1);
 298  009a ae5210        	ldw	x,#21008
 299  009d cd0000        	call	_I2C_DeInit
 301                     ; 102 	I2C_Init(I2C1, frequency, MASTER_ADDR, I2C_Mode_I2C,I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 303  00a0 4b00          	push	#0
 304  00a2 4b04          	push	#4
 305  00a4 4b00          	push	#0
 306  00a6 4b00          	push	#0
 307  00a8 ae0008        	ldw	x,#8
 308  00ab 89            	pushw	x
 309  00ac 1e0b          	ldw	x,(OFST+11,sp)
 310  00ae 89            	pushw	x
 311  00af 1e0b          	ldw	x,(OFST+11,sp)
 312  00b1 89            	pushw	x
 313  00b2 ae5210        	ldw	x,#21008
 314  00b5 cd0000        	call	_I2C_Init
 316  00b8 5b0a          	addw	sp,#10
 317                     ; 104 	I2C_Cmd(I2C1, ENABLE);
 319  00ba 4b01          	push	#1
 320  00bc ae5210        	ldw	x,#21008
 321  00bf cd0000        	call	_I2C_Cmd
 323  00c2 84            	pop	a
 324                     ; 106 }
 327  00c3 81            	ret
 357                     ; 117 void CLK_Initialization_I2C(void) {
 358                     	switch	.text
 359  00c4               _CLK_Initialization_I2C:
 363                     ; 118 	CLK_DeInit();
 365  00c4 cd0000        	call	_CLK_DeInit
 367                     ; 120 	CLK_LSICmd(DISABLE);	// Use internal clock.
 369  00c7 4f            	clr	a
 370  00c8 cd0000        	call	_CLK_LSICmd
 372                     ; 121 	CLK_HSICmd(ENABLE);
 374  00cb a601          	ld	a,#1
 375  00cd cd0000        	call	_CLK_HSICmd
 378  00d0               L701:
 379                     ; 122 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);				// Wait for clock to stabilize
 381  00d0 a611          	ld	a,#17
 382  00d2 cd0000        	call	_CLK_GetFlagStatus
 384  00d5 4d            	tnz	a
 385  00d6 27f8          	jreq	L701
 386                     ; 124 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 388  00d8 a601          	ld	a,#1
 389  00da cd0000        	call	_CLK_SYSCLKSourceConfig
 391                     ; 126 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, ENABLE);
 393  00dd ae0301        	ldw	x,#769
 394  00e0 cd0000        	call	_CLK_PeripheralClockConfig
 396                     ; 128 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
 398  00e3 ae0400        	ldw	x,#1024
 399  00e6 cd0000        	call	_CLK_PeripheralClockConfig
 401                     ; 129 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 403  00e9 ae1000        	ldw	x,#4096
 404  00ec cd0000        	call	_CLK_PeripheralClockConfig
 406                     ; 130 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 408  00ef ae0500        	ldw	x,#1280
 409  00f2 cd0000        	call	_CLK_PeripheralClockConfig
 411                     ; 132 }
 414  00f5 81            	ret
 484                     ; 139 void I2C_Read(uint8_t address, uint8_t *Rx, uint8_t numBytesToRead) {
 485                     	switch	.text
 486  00f6               _I2C_Read:
 488  00f6 88            	push	a
 489  00f7 88            	push	a
 490       00000001      OFST:	set	1
 493                     ; 140 	uint8_t i = 0;
 496  00f8               L741:
 497                     ; 145 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
 499  00f8 ae0302        	ldw	x,#770
 500  00fb 89            	pushw	x
 501  00fc ae5210        	ldw	x,#21008
 502  00ff cd0000        	call	_I2C_GetFlagStatus
 504  0102 85            	popw	x
 505  0103 4d            	tnz	a
 506  0104 26f2          	jrne	L741
 507                     ; 147 	I2C_GenerateSTART(I2C1, ENABLE);
 509  0106 4b01          	push	#1
 510  0108 ae5210        	ldw	x,#21008
 511  010b cd0000        	call	_I2C_GenerateSTART
 513  010e 84            	pop	a
 515  010f               L551:
 516                     ; 148 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 518  010f ae0301        	ldw	x,#769
 519  0112 89            	pushw	x
 520  0113 ae5210        	ldw	x,#21008
 521  0116 cd0000        	call	_I2C_CheckEvent
 523  0119 85            	popw	x
 524  011a 4d            	tnz	a
 525  011b 27f2          	jreq	L551
 526                     ; 149 	GPIO_Write(GPIOB, 0x00);
 528  011d 4b00          	push	#0
 529  011f ae5005        	ldw	x,#20485
 530  0122 cd0000        	call	_GPIO_Write
 532  0125 84            	pop	a
 533                     ; 150 	I2C_Send7bitAddress(I2C1, address, I2C_Direction_Receiver);
 535  0126 4b01          	push	#1
 536  0128 7b03          	ld	a,(OFST+2,sp)
 537  012a 88            	push	a
 538  012b ae5210        	ldw	x,#21008
 539  012e cd0000        	call	_I2C_Send7bitAddress
 541  0131 85            	popw	x
 543  0132               L361:
 544                     ; 151 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 546  0132 ae0302        	ldw	x,#770
 547  0135 89            	pushw	x
 548  0136 ae5210        	ldw	x,#21008
 549  0139 cd0000        	call	_I2C_CheckEvent
 551  013c 85            	popw	x
 552  013d 4d            	tnz	a
 553  013e 27f2          	jreq	L361
 555  0140 2031          	jra	L171
 556  0142               L761:
 557                     ; 154 		for(i = 0; I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED);) {
 559  0142 0f01          	clr	(OFST+0,sp)
 562  0144 201f          	jra	L102
 563  0146               L571:
 564                     ; 155 			I2C_AcknowledgeConfig(I2C1, ENABLE);
 566  0146 4b01          	push	#1
 567  0148 ae5210        	ldw	x,#21008
 568  014b cd0000        	call	_I2C_AcknowledgeConfig
 570  014e 84            	pop	a
 571                     ; 156 			Rx[i] = I2C_ReceiveData(I2C1);
 573  014f 7b05          	ld	a,(OFST+4,sp)
 574  0151 97            	ld	xl,a
 575  0152 7b06          	ld	a,(OFST+5,sp)
 576  0154 1b01          	add	a,(OFST+0,sp)
 577  0156 2401          	jrnc	L61
 578  0158 5c            	incw	x
 579  0159               L61:
 580  0159 02            	rlwa	x,a
 581  015a 89            	pushw	x
 582  015b ae5210        	ldw	x,#21008
 583  015e cd0000        	call	_I2C_ReceiveData
 585  0161 85            	popw	x
 586  0162 f7            	ld	(x),a
 587                     ; 157 			numBytesToRead--;
 589  0163 0a07          	dec	(OFST+6,sp)
 590  0165               L102:
 591                     ; 154 		for(i = 0; I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED);) {
 593  0165 ae0340        	ldw	x,#832
 594  0168 89            	pushw	x
 595  0169 ae5210        	ldw	x,#21008
 596  016c cd0000        	call	_I2C_CheckEvent
 598  016f 85            	popw	x
 599  0170 4d            	tnz	a
 600  0171 26d3          	jrne	L571
 601  0173               L171:
 602                     ; 153 	while(numBytesToRead != 0) {
 604  0173 0d07          	tnz	(OFST+6,sp)
 605  0175 26cb          	jrne	L761
 606                     ; 161 	I2C_GenerateSTOP(I2C1, ENABLE);
 608  0177 4b01          	push	#1
 609  0179 ae5210        	ldw	x,#21008
 610  017c cd0000        	call	_I2C_GenerateSTOP
 612  017f 84            	pop	a
 614  0180               L702:
 615                     ; 162 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish
 617  0180 ae0110        	ldw	x,#272
 618  0183 89            	pushw	x
 619  0184 ae5210        	ldw	x,#21008
 620  0187 cd0000        	call	_I2C_GetFlagStatus
 622  018a 85            	popw	x
 623  018b 4d            	tnz	a
 624  018c 26f2          	jrne	L702
 625                     ; 165 }
 628  018e 85            	popw	x
 629  018f 81            	ret
 698                     ; 172 void I2C_Write(uint8_t address, uint8_t *Tx, uint8_t numBytesToSend) {
 699                     	switch	.text
 700  0190               _I2C_Write:
 702  0190 88            	push	a
 703  0191 88            	push	a
 704       00000001      OFST:	set	1
 707                     ; 173 	uint8_t i = numBytesToSend;				// STVD doesn't like declarations in for loops :(
 710  0192               L742:
 711                     ; 178 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
 713  0192 ae0302        	ldw	x,#770
 714  0195 89            	pushw	x
 715  0196 ae5210        	ldw	x,#21008
 716  0199 cd0000        	call	_I2C_GetFlagStatus
 718  019c 85            	popw	x
 719  019d 4d            	tnz	a
 720  019e 26f2          	jrne	L742
 721                     ; 180 	I2C_GenerateSTART(I2C1, ENABLE);
 723  01a0 4b01          	push	#1
 724  01a2 ae5210        	ldw	x,#21008
 725  01a5 cd0000        	call	_I2C_GenerateSTART
 727  01a8 84            	pop	a
 729  01a9               L552:
 730                     ; 181 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 732  01a9 ae0301        	ldw	x,#769
 733  01ac 89            	pushw	x
 734  01ad ae5210        	ldw	x,#21008
 735  01b0 cd0000        	call	_I2C_CheckEvent
 737  01b3 85            	popw	x
 738  01b4 4d            	tnz	a
 739  01b5 27f2          	jreq	L552
 740                     ; 183 	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Transmitter);
 742  01b7 4b00          	push	#0
 743  01b9 7b03          	ld	a,(OFST+2,sp)
 744  01bb 48            	sll	a
 745  01bc 88            	push	a
 746  01bd ae5210        	ldw	x,#21008
 747  01c0 cd0000        	call	_I2C_Send7bitAddress
 749  01c3 85            	popw	x
 751  01c4               L362:
 752                     ; 184 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 754  01c4 ae0782        	ldw	x,#1922
 755  01c7 89            	pushw	x
 756  01c8 ae5210        	ldw	x,#21008
 757  01cb cd0000        	call	_I2C_CheckEvent
 759  01ce 85            	popw	x
 760  01cf 4d            	tnz	a
 761  01d0 27f2          	jreq	L362
 762                     ; 185 		GPIO_Write(GPIOB, 0x00);
 764  01d2 4b00          	push	#0
 765  01d4 ae5005        	ldw	x,#20485
 766  01d7 cd0000        	call	_GPIO_Write
 768  01da 84            	pop	a
 769                     ; 186 	for(i = numBytesToSend; i > 0; i--) {
 771  01db 7b07          	ld	a,(OFST+6,sp)
 772  01dd 6b01          	ld	(OFST+0,sp),a
 775  01df 2024          	jra	L372
 776  01e1               L762:
 777                     ; 187 		I2C_SendData(I2C1, Tx[i]);
 779  01e1 7b05          	ld	a,(OFST+4,sp)
 780  01e3 97            	ld	xl,a
 781  01e4 7b06          	ld	a,(OFST+5,sp)
 782  01e6 1b01          	add	a,(OFST+0,sp)
 783  01e8 2401          	jrnc	L22
 784  01ea 5c            	incw	x
 785  01eb               L22:
 786  01eb 02            	rlwa	x,a
 787  01ec f6            	ld	a,(x)
 788  01ed 88            	push	a
 789  01ee ae5210        	ldw	x,#21008
 790  01f1 cd0000        	call	_I2C_SendData
 792  01f4 84            	pop	a
 794  01f5               L103:
 795                     ; 188 		while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 797  01f5 ae0784        	ldw	x,#1924
 798  01f8 89            	pushw	x
 799  01f9 ae5210        	ldw	x,#21008
 800  01fc cd0000        	call	_I2C_CheckEvent
 802  01ff 85            	popw	x
 803  0200 4d            	tnz	a
 804  0201 27f2          	jreq	L103
 805                     ; 186 	for(i = numBytesToSend; i > 0; i--) {
 807  0203 0a01          	dec	(OFST+0,sp)
 809  0205               L372:
 812  0205 0d01          	tnz	(OFST+0,sp)
 813  0207 26d8          	jrne	L762
 814                     ; 192 	I2C_GenerateSTOP(I2C1, ENABLE);
 816  0209 4b01          	push	#1
 817  020b ae5210        	ldw	x,#21008
 818  020e cd0000        	call	_I2C_GenerateSTOP
 820  0211 84            	pop	a
 822  0212               L703:
 823                     ; 193 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish
 825  0212 ae0110        	ldw	x,#272
 826  0215 89            	pushw	x
 827  0216 ae5210        	ldw	x,#21008
 828  0219 cd0000        	call	_I2C_GetFlagStatus
 830  021c 85            	popw	x
 831  021d 4d            	tnz	a
 832  021e 26f2          	jrne	L703
 833                     ; 195 }
 836  0220 85            	popw	x
 837  0221 81            	ret
 898                     ; 201 void Grab_Temperature(uint8_t address, uint8_t regPointer, uint8_t *Rx) {
 899                     	switch	.text
 900  0222               _Grab_Temperature:
 902  0222 89            	pushw	x
 903       00000000      OFST:	set	0
 906  0223               L343:
 907                     ; 202 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY));			// Check if I2C bus currently being used
 909  0223 ae0302        	ldw	x,#770
 910  0226 89            	pushw	x
 911  0227 ae5210        	ldw	x,#21008
 912  022a cd0000        	call	_I2C_GetFlagStatus
 914  022d 85            	popw	x
 915  022e 4d            	tnz	a
 916  022f 26f2          	jrne	L343
 917                     ; 204 	I2C_GenerateSTART(I2C1, ENABLE);
 919  0231 4b01          	push	#1
 920  0233 ae5210        	ldw	x,#21008
 921  0236 cd0000        	call	_I2C_GenerateSTART
 923  0239 84            	pop	a
 925  023a               L153:
 926                     ; 205 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 928  023a ae0301        	ldw	x,#769
 929  023d 89            	pushw	x
 930  023e ae5210        	ldw	x,#21008
 931  0241 cd0000        	call	_I2C_CheckEvent
 933  0244 85            	popw	x
 934  0245 4d            	tnz	a
 935  0246 27f2          	jreq	L153
 936                     ; 207 	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Transmitter);
 938  0248 4b00          	push	#0
 939  024a 7b02          	ld	a,(OFST+2,sp)
 940  024c 48            	sll	a
 941  024d 88            	push	a
 942  024e ae5210        	ldw	x,#21008
 943  0251 cd0000        	call	_I2C_Send7bitAddress
 945  0254 85            	popw	x
 947  0255               L753:
 948                     ; 208 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 950  0255 ae0782        	ldw	x,#1922
 951  0258 89            	pushw	x
 952  0259 ae5210        	ldw	x,#21008
 953  025c cd0000        	call	_I2C_CheckEvent
 955  025f 85            	popw	x
 956  0260 4d            	tnz	a
 957  0261 27f2          	jreq	L753
 958                     ; 210 	I2C_SendData(I2C1, regPointer);
 960  0263 7b02          	ld	a,(OFST+2,sp)
 961  0265 88            	push	a
 962  0266 ae5210        	ldw	x,#21008
 963  0269 cd0000        	call	_I2C_SendData
 965  026c 84            	pop	a
 967  026d               L563:
 968                     ; 211 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 970  026d ae0784        	ldw	x,#1924
 971  0270 89            	pushw	x
 972  0271 ae5210        	ldw	x,#21008
 973  0274 cd0000        	call	_I2C_CheckEvent
 975  0277 85            	popw	x
 976  0278 4d            	tnz	a
 977  0279 27f2          	jreq	L563
 978                     ; 213 	I2C_GenerateSTART(I2C1, ENABLE);
 980  027b 4b01          	push	#1
 981  027d ae5210        	ldw	x,#21008
 982  0280 cd0000        	call	_I2C_GenerateSTART
 984  0283 84            	pop	a
 986  0284               L373:
 987                     ; 214 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT));
 989  0284 ae0301        	ldw	x,#769
 990  0287 89            	pushw	x
 991  0288 ae5210        	ldw	x,#21008
 992  028b cd0000        	call	_I2C_CheckEvent
 994  028e 85            	popw	x
 995  028f 4d            	tnz	a
 996  0290 27f2          	jreq	L373
 997                     ; 216 	I2C_Send7bitAddress(I2C1, (address << 1), I2C_Direction_Receiver);
 999  0292 4b01          	push	#1
1000  0294 7b02          	ld	a,(OFST+2,sp)
1001  0296 48            	sll	a
1002  0297 88            	push	a
1003  0298 ae5210        	ldw	x,#21008
1004  029b cd0000        	call	_I2C_Send7bitAddress
1006  029e 85            	popw	x
1008  029f               L104:
1009                     ; 217 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
1011  029f ae0302        	ldw	x,#770
1012  02a2 89            	pushw	x
1013  02a3 ae5210        	ldw	x,#21008
1014  02a6 cd0000        	call	_I2C_CheckEvent
1016  02a9 85            	popw	x
1017  02aa 4d            	tnz	a
1018  02ab 27f2          	jreq	L104
1019                     ; 219 	I2C_AcknowledgeConfig(I2C1, ENABLE);
1021  02ad 4b01          	push	#1
1022  02af ae5210        	ldw	x,#21008
1023  02b2 cd0000        	call	_I2C_AcknowledgeConfig
1025  02b5 84            	pop	a
1026                     ; 220 	Rx[1] = I2C_ReceiveData(I2C1);
1028  02b6 ae5210        	ldw	x,#21008
1029  02b9 cd0000        	call	_I2C_ReceiveData
1031  02bc 1e05          	ldw	x,(OFST+5,sp)
1032  02be e701          	ld	(1,x),a
1034  02c0               L114:
1035                     ; 221 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BTF));
1037  02c0 ae0104        	ldw	x,#260
1038  02c3 89            	pushw	x
1039  02c4 ae5210        	ldw	x,#21008
1040  02c7 cd0000        	call	_I2C_GetFlagStatus
1042  02ca 85            	popw	x
1043  02cb 4d            	tnz	a
1044  02cc 26f2          	jrne	L114
1045                     ; 223 	I2C_AcknowledgeConfig(I2C1, ENABLE);
1047  02ce 4b01          	push	#1
1048  02d0 ae5210        	ldw	x,#21008
1049  02d3 cd0000        	call	_I2C_AcknowledgeConfig
1051  02d6 84            	pop	a
1052                     ; 224 	Rx[0] = I2C_ReceiveData(I2C1);
1054  02d7 ae5210        	ldw	x,#21008
1055  02da cd0000        	call	_I2C_ReceiveData
1057  02dd 1e05          	ldw	x,(OFST+5,sp)
1058  02df f7            	ld	(x),a
1060  02e0               L124:
1061                     ; 225 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_BTF));
1063  02e0 ae0104        	ldw	x,#260
1064  02e3 89            	pushw	x
1065  02e4 ae5210        	ldw	x,#21008
1066  02e7 cd0000        	call	_I2C_GetFlagStatus
1068  02ea 85            	popw	x
1069  02eb 4d            	tnz	a
1070  02ec 26f2          	jrne	L124
1071                     ; 227 	I2C_GenerateSTOP(I2C1, ENABLE);
1073  02ee 4b01          	push	#1
1074  02f0 ae5210        	ldw	x,#21008
1075  02f3 cd0000        	call	_I2C_GenerateSTOP
1077  02f6 84            	pop	a
1079  02f7               L724:
1080                     ; 228 	while(I2C_GetFlagStatus(I2C1, I2C_FLAG_STOPF));			// Wait for Communication to finish
1082  02f7 ae0110        	ldw	x,#272
1083  02fa 89            	pushw	x
1084  02fb ae5210        	ldw	x,#21008
1085  02fe cd0000        	call	_I2C_GetFlagStatus
1087  0301 85            	popw	x
1088  0302 4d            	tnz	a
1089  0303 26f2          	jrne	L724
1090                     ; 230 }
1093  0305 85            	popw	x
1094  0306 81            	ret
1107                     	xdef	_main
1108                     	xdef	_Grab_Temperature
1109                     	xdef	_I2C_Write
1110                     	xdef	_I2C_Read
1111                     	xdef	_I2C_Initialization
1112                     	xdef	_GPIO_Initialization
1113                     	xdef	_CLK_Initialization_I2C
1114                     	xref	_I2C_GetFlagStatus
1115                     	xref	_I2C_CheckEvent
1116                     	xref	_I2C_ReceiveData
1117                     	xref	_I2C_SendData
1118                     	xref	_I2C_Send7bitAddress
1119                     	xref	_I2C_AcknowledgeConfig
1120                     	xref	_I2C_GenerateSTOP
1121                     	xref	_I2C_GenerateSTART
1122                     	xref	_I2C_Cmd
1123                     	xref	_I2C_Init
1124                     	xref	_I2C_DeInit
1125                     	xref	_GPIO_Write
1126                     	xref	_GPIO_Init
1127                     	xref	_GPIO_DeInit
1128                     	xref	_CLK_GetFlagStatus
1129                     	xref	_CLK_PeripheralClockConfig
1130                     	xref	_CLK_SYSCLKSourceConfig
1131                     	xref	_CLK_LSICmd
1132                     	xref	_CLK_HSICmd
1133                     	xref	_CLK_DeInit
1152                     	end
