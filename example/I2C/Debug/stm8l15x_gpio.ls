   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
 108                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 97 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 117  0000 6f04          	clr	(4,x)
 118                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0002 7f            	clr	(x)
 121                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0003 6f02          	clr	(2,x)
 124                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0005 6f03          	clr	(3,x)
 127                     ; 102 }
 130  0007 81            	ret
 286                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 286                     ; 134 {
 287                     	switch	.text
 288  0008               _GPIO_Init:
 290  0008 89            	pushw	x
 291       00000000      OFST:	set	0
 294                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 296                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 298                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 300  0009 7b05          	ld	a,(OFST+5,sp)
 301  000b 43            	cpl	a
 302  000c e404          	and	a,(4,x)
 303  000e e704          	ld	(4,x),a
 304                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 306  0010 7b06          	ld	a,(OFST+6,sp)
 307  0012 a580          	bcp	a,#128
 308  0014 271d          	jreq	L541
 309                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 311  0016 7b06          	ld	a,(OFST+6,sp)
 312  0018 a510          	bcp	a,#16
 313  001a 2706          	jreq	L741
 314                     ; 153       GPIOx->ODR |= GPIO_Pin;
 316  001c f6            	ld	a,(x)
 317  001d 1a05          	or	a,(OFST+5,sp)
 318  001f f7            	ld	(x),a
 320  0020 2007          	jra	L151
 321  0022               L741:
 322                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 324  0022 1e01          	ldw	x,(OFST+1,sp)
 325  0024 7b05          	ld	a,(OFST+5,sp)
 326  0026 43            	cpl	a
 327  0027 f4            	and	a,(x)
 328  0028 f7            	ld	(x),a
 329  0029               L151:
 330                     ; 159     GPIOx->DDR |= GPIO_Pin;
 332  0029 1e01          	ldw	x,(OFST+1,sp)
 333  002b e602          	ld	a,(2,x)
 334  002d 1a05          	or	a,(OFST+5,sp)
 335  002f e702          	ld	(2,x),a
 337  0031 2009          	jra	L351
 338  0033               L541:
 339                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 341  0033 1e01          	ldw	x,(OFST+1,sp)
 342  0035 7b05          	ld	a,(OFST+5,sp)
 343  0037 43            	cpl	a
 344  0038 e402          	and	a,(2,x)
 345  003a e702          	ld	(2,x),a
 346  003c               L351:
 347                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 349  003c 7b06          	ld	a,(OFST+6,sp)
 350  003e a540          	bcp	a,#64
 351  0040 270a          	jreq	L551
 352                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 354  0042 1e01          	ldw	x,(OFST+1,sp)
 355  0044 e603          	ld	a,(3,x)
 356  0046 1a05          	or	a,(OFST+5,sp)
 357  0048 e703          	ld	(3,x),a
 359  004a 2009          	jra	L751
 360  004c               L551:
 361                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 363  004c 1e01          	ldw	x,(OFST+1,sp)
 364  004e 7b05          	ld	a,(OFST+5,sp)
 365  0050 43            	cpl	a
 366  0051 e403          	and	a,(3,x)
 367  0053 e703          	ld	(3,x),a
 368  0055               L751:
 369                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 371  0055 7b06          	ld	a,(OFST+6,sp)
 372  0057 a520          	bcp	a,#32
 373  0059 270a          	jreq	L161
 374                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 376  005b 1e01          	ldw	x,(OFST+1,sp)
 377  005d e604          	ld	a,(4,x)
 378  005f 1a05          	or	a,(OFST+5,sp)
 379  0061 e704          	ld	(4,x),a
 381  0063 2009          	jra	L361
 382  0065               L161:
 383                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0065 1e01          	ldw	x,(OFST+1,sp)
 386  0067 7b05          	ld	a,(OFST+5,sp)
 387  0069 43            	cpl	a
 388  006a e404          	and	a,(4,x)
 389  006c e704          	ld	(4,x),a
 390  006e               L361:
 391                     ; 190 }
 394  006e 85            	popw	x
 395  006f 81            	ret
 472                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 472                     ; 210 {
 473                     	switch	.text
 474  0070               _GPIO_ExternalPullUpConfig:
 476  0070 89            	pushw	x
 477       00000000      OFST:	set	0
 480                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 482                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 484                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 486  0071 0d06          	tnz	(OFST+6,sp)
 487  0073 2708          	jreq	L522
 488                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 490  0075 e603          	ld	a,(3,x)
 491  0077 1a05          	or	a,(OFST+5,sp)
 492  0079 e703          	ld	(3,x),a
 494  007b 2009          	jra	L722
 495  007d               L522:
 496                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 498  007d 1e01          	ldw	x,(OFST+1,sp)
 499  007f 7b05          	ld	a,(OFST+5,sp)
 500  0081 43            	cpl	a
 501  0082 e403          	and	a,(3,x)
 502  0084 e703          	ld	(3,x),a
 503  0086               L722:
 504                     ; 222 }
 507  0086 85            	popw	x
 508  0087 81            	ret
 554                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 554                     ; 249 {
 555                     	switch	.text
 556  0088               _GPIO_Write:
 558  0088 89            	pushw	x
 559       00000000      OFST:	set	0
 562                     ; 250   GPIOx->ODR = GPIO_PortVal;
 564  0089 7b05          	ld	a,(OFST+5,sp)
 565  008b 1e01          	ldw	x,(OFST+1,sp)
 566  008d f7            	ld	(x),a
 567                     ; 251 }
 570  008e 85            	popw	x
 571  008f 81            	ret
 731                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 731                     ; 271 {
 732                     	switch	.text
 733  0090               _GPIO_WriteBit:
 735  0090 89            	pushw	x
 736       00000000      OFST:	set	0
 739                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 741                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 743                     ; 276   if (GPIO_BitVal != RESET)
 745  0091 0d06          	tnz	(OFST+6,sp)
 746  0093 2706          	jreq	L743
 747                     ; 278     GPIOx->ODR |= GPIO_Pin;
 749  0095 f6            	ld	a,(x)
 750  0096 1a05          	or	a,(OFST+5,sp)
 751  0098 f7            	ld	(x),a
 753  0099 2007          	jra	L153
 754  009b               L743:
 755                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 757  009b 1e01          	ldw	x,(OFST+1,sp)
 758  009d 7b05          	ld	a,(OFST+5,sp)
 759  009f 43            	cpl	a
 760  00a0 f4            	and	a,(x)
 761  00a1 f7            	ld	(x),a
 762  00a2               L153:
 763                     ; 285 }
 766  00a2 85            	popw	x
 767  00a3 81            	ret
 813                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 813                     ; 304 {
 814                     	switch	.text
 815  00a4               _GPIO_SetBits:
 817  00a4 89            	pushw	x
 818       00000000      OFST:	set	0
 821                     ; 305   GPIOx->ODR |= GPIO_Pin;
 823  00a5 f6            	ld	a,(x)
 824  00a6 1a05          	or	a,(OFST+5,sp)
 825  00a8 f7            	ld	(x),a
 826                     ; 306 }
 829  00a9 85            	popw	x
 830  00aa 81            	ret
 876                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 876                     ; 325 {
 877                     	switch	.text
 878  00ab               _GPIO_ResetBits:
 880  00ab 89            	pushw	x
 881       00000000      OFST:	set	0
 884                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 886  00ac 7b05          	ld	a,(OFST+5,sp)
 887  00ae 43            	cpl	a
 888  00af f4            	and	a,(x)
 889  00b0 f7            	ld	(x),a
 890                     ; 327 }
 893  00b1 85            	popw	x
 894  00b2 81            	ret
 940                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 940                     ; 337 {
 941                     	switch	.text
 942  00b3               _GPIO_ToggleBits:
 944  00b3 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 950  00b4 f6            	ld	a,(x)
 951  00b5 1805          	xor	a,(OFST+5,sp)
 952  00b7 f7            	ld	(x),a
 953                     ; 339 }
 956  00b8 85            	popw	x
 957  00b9 81            	ret
 994                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 994                     ; 348 {
 995                     	switch	.text
 996  00ba               _GPIO_ReadInputData:
1000                     ; 349   return ((uint8_t)GPIOx->IDR);
1002  00ba e601          	ld	a,(1,x)
1005  00bc 81            	ret
1043                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1043                     ; 359 {
1044                     	switch	.text
1045  00bd               _GPIO_ReadOutputData:
1049                     ; 360   return ((uint8_t)GPIOx->ODR);
1051  00bd f6            	ld	a,(x)
1054  00be 81            	ret
1103                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1103                     ; 379 {
1104                     	switch	.text
1105  00bf               _GPIO_ReadInputDataBit:
1107  00bf 89            	pushw	x
1108       00000000      OFST:	set	0
1111                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1113  00c0 e601          	ld	a,(1,x)
1114  00c2 1405          	and	a,(OFST+5,sp)
1117  00c4 85            	popw	x
1118  00c5 81            	ret
1167                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1167                     ; 390 {
1168                     	switch	.text
1169  00c6               _GPIO_ReadOutputDataBit:
1171  00c6 89            	pushw	x
1172       00000000      OFST:	set	0
1175                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1177  00c7 f6            	ld	a,(x)
1178  00c8 1405          	and	a,(OFST+5,sp)
1181  00ca 85            	popw	x
1182  00cb 81            	ret
1195                     	xdef	_GPIO_ReadOutputDataBit
1196                     	xdef	_GPIO_ReadInputDataBit
1197                     	xdef	_GPIO_ReadOutputData
1198                     	xdef	_GPIO_ReadInputData
1199                     	xdef	_GPIO_ToggleBits
1200                     	xdef	_GPIO_ResetBits
1201                     	xdef	_GPIO_SetBits
1202                     	xdef	_GPIO_WriteBit
1203                     	xdef	_GPIO_Write
1204                     	xdef	_GPIO_ExternalPullUpConfig
1205                     	xdef	_GPIO_Init
1206                     	xdef	_GPIO_DeInit
1225                     	end
