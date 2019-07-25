   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 95 void WFE_DeInit(void)
  42                     ; 96 {
  44                     	switch	.text
  45  0000               _WFE_DeInit:
  49                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  51  0000 725f50a6      	clr	20646
  52                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  54  0004 725f50a7      	clr	20647
  55                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  57  0008 725f50a8      	clr	20648
  58                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  60  000c 725f50a9      	clr	20649
  61                     ; 101 }
  64  0010 81            	ret
 388                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 388                     ; 142 {
 389                     	switch	.text
 390  0011               _WFE_WakeUpSourceEventCmd:
 392  0011 89            	pushw	x
 393  0012 88            	push	a
 394       00000001      OFST:	set	1
 397                     ; 143   uint8_t register_index = 0;
 399                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 401                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 403                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 405  0013 9e            	ld	a,xh
 406  0014 6b01          	ld	(OFST+0,sp),a
 408                     ; 151   if (NewState != DISABLE)
 410  0016 0d06          	tnz	(OFST+5,sp)
 411  0018 273c          	jreq	L502
 412                     ; 153     switch (register_index)
 414  001a 7b01          	ld	a,(OFST+0,sp)
 416                     ; 171       default:
 416                     ; 172         break;
 417  001c 4a            	dec	a
 418  001d 270b          	jreq	L12
 419  001f 4a            	dec	a
 420  0020 2712          	jreq	L32
 421  0022 4a            	dec	a
 422  0023 2719          	jreq	L52
 423  0025 4a            	dec	a
 424  0026 2720          	jreq	L72
 425  0028 2045          	jra	L312
 426  002a               L12:
 427                     ; 155       case 1:
 427                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 429  002a c650a6        	ld	a,20646
 430  002d 1a03          	or	a,(OFST+2,sp)
 431  002f c750a6        	ld	20646,a
 432                     ; 157         break;
 434  0032 203b          	jra	L312
 435  0034               L32:
 436                     ; 159       case 2:
 436                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 438  0034 c650a7        	ld	a,20647
 439  0037 1a03          	or	a,(OFST+2,sp)
 440  0039 c750a7        	ld	20647,a
 441                     ; 161         break;
 443  003c 2031          	jra	L312
 444  003e               L52:
 445                     ; 163       case 3:
 445                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 447  003e c650a8        	ld	a,20648
 448  0041 1a03          	or	a,(OFST+2,sp)
 449  0043 c750a8        	ld	20648,a
 450                     ; 165         break;
 452  0046 2027          	jra	L312
 453  0048               L72:
 454                     ; 167       case 4:
 454                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 456  0048 c650a9        	ld	a,20649
 457  004b 1a03          	or	a,(OFST+2,sp)
 458  004d c750a9        	ld	20649,a
 459                     ; 169         break;
 461  0050 201d          	jra	L312
 462  0052               L13:
 463                     ; 171       default:
 463                     ; 172         break;
 465  0052 201b          	jra	L312
 466  0054               L112:
 468  0054 2019          	jra	L312
 469  0056               L502:
 470                     ; 177     switch (register_index)
 472  0056 7b01          	ld	a,(OFST+0,sp)
 474                     ; 195       default:
 474                     ; 196         break;
 475  0058 4a            	dec	a
 476  0059 270b          	jreq	L33
 477  005b 4a            	dec	a
 478  005c 2714          	jreq	L53
 479  005e 4a            	dec	a
 480  005f 271c          	jreq	L73
 481  0061 4a            	dec	a
 482  0062 2724          	jreq	L14
 483  0064 2009          	jra	L312
 484  0066               L33:
 485                     ; 179       case 1:
 485                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 487  0066 7b03          	ld	a,(OFST+2,sp)
 488  0068 43            	cpl	a
 489  0069 c450a6        	and	a,20646
 490  006c c750a6        	ld	20646,a
 491                     ; 181         break;
 492  006f               L312:
 493                     ; 199 }
 496  006f 5b03          	addw	sp,#3
 497  0071 81            	ret
 498  0072               L53:
 499                     ; 183       case 2:
 499                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 501  0072 7b03          	ld	a,(OFST+2,sp)
 502  0074 43            	cpl	a
 503  0075 c450a7        	and	a,20647
 504  0078 c750a7        	ld	20647,a
 505                     ; 185         break;
 507  007b 20f2          	jra	L312
 508  007d               L73:
 509                     ; 187       case 3:
 509                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 511  007d 7b03          	ld	a,(OFST+2,sp)
 512  007f 43            	cpl	a
 513  0080 c450a8        	and	a,20648
 514  0083 c750a8        	ld	20648,a
 515                     ; 189         break;
 517  0086 20e7          	jra	L312
 518  0088               L14:
 519                     ; 191       case 4:
 519                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 521  0088 7b03          	ld	a,(OFST+2,sp)
 522  008a 43            	cpl	a
 523  008b c450a9        	and	a,20649
 524  008e c750a9        	ld	20649,a
 525                     ; 193         break;
 527  0091 20dc          	jra	L312
 528  0093               L34:
 529                     ; 195       default:
 529                     ; 196         break;
 531  0093 20da          	jra	L312
 532  0095               L712:
 533  0095 20d8          	jra	L312
 580                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 580                     ; 238 {
 581                     	switch	.text
 582  0097               _WFE_GetWakeUpSourceEventStatus:
 584  0097 89            	pushw	x
 585  0098 88            	push	a
 586       00000001      OFST:	set	1
 589                     ; 239   FunctionalState status = DISABLE;
 591  0099 0f01          	clr	(OFST+0,sp)
 593                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 595                     ; 243   switch (WFE_Source)
 598                     ; 326     default:
 598                     ; 327       break;
 599  009b 1d0101        	subw	x,#257
 600  009e 2603          	jrne	L21
 601  00a0 cc013e        	jp	L122
 602  00a3               L21:
 603  00a3 5a            	decw	x
 604  00a4 2603          	jrne	L41
 605  00a6 cc013e        	jp	L122
 606  00a9               L41:
 607  00a9 1d0002        	subw	x,#2
 608  00ac 2603          	jrne	L61
 609  00ae cc013e        	jp	L122
 610  00b1               L61:
 611  00b1 1d0004        	subw	x,#4
 612  00b4 2603          	jrne	L02
 613  00b6 cc013e        	jp	L122
 614  00b9               L02:
 615  00b9 1d0008        	subw	x,#8
 616  00bc 2602          	jrne	L22
 617  00be 207e          	jp	L122
 618  00c0               L22:
 619  00c0 1d0010        	subw	x,#16
 620  00c3 2779          	jreq	L122
 621  00c5 1d0020        	subw	x,#32
 622  00c8 2774          	jreq	L122
 623  00ca 1d0040        	subw	x,#64
 624  00cd 276f          	jreq	L122
 625  00cf 1d0081        	subw	x,#129
 626  00d2 277b          	jreq	L322
 627  00d4 5a            	decw	x
 628  00d5 2778          	jreq	L322
 629  00d7 1d0002        	subw	x,#2
 630  00da 2773          	jreq	L322
 631  00dc 1d0004        	subw	x,#4
 632  00df 276e          	jreq	L322
 633  00e1 1d0008        	subw	x,#8
 634  00e4 2769          	jreq	L322
 635  00e6 1d0010        	subw	x,#16
 636  00e9 2764          	jreq	L322
 637  00eb 1d0020        	subw	x,#32
 638  00ee 275f          	jreq	L322
 639  00f0 1d0040        	subw	x,#64
 640  00f3 275a          	jreq	L322
 641  00f5 1d0081        	subw	x,#129
 642  00f8 2766          	jreq	L522
 643  00fa 5a            	decw	x
 644  00fb 2763          	jreq	L522
 645  00fd 1d0002        	subw	x,#2
 646  0100 275e          	jreq	L522
 647  0102 1d0004        	subw	x,#4
 648  0105 2759          	jreq	L522
 649  0107 1d0008        	subw	x,#8
 650  010a 2754          	jreq	L522
 651  010c 1d0010        	subw	x,#16
 652  010f 274f          	jreq	L522
 653  0111 1d0020        	subw	x,#32
 654  0114 274a          	jreq	L522
 655  0116 1d0040        	subw	x,#64
 656  0119 2745          	jreq	L522
 657  011b 1d0081        	subw	x,#129
 658  011e 2751          	jreq	L722
 659  0120 5a            	decw	x
 660  0121 274e          	jreq	L722
 661  0123 1d0002        	subw	x,#2
 662  0126 2749          	jreq	L722
 663  0128 1d0004        	subw	x,#4
 664  012b 2744          	jreq	L722
 665  012d 1d0008        	subw	x,#8
 666  0130 273f          	jreq	L722
 667  0132 1d0010        	subw	x,#16
 668  0135 273a          	jreq	L722
 669  0137 1d0020        	subw	x,#32
 670  013a 2735          	jreq	L722
 671  013c 2042          	jra	L752
 672  013e               L122:
 673                     ; 245     case WFE_Source_TIM2_EV0:
 673                     ; 246     case WFE_Source_TIM2_EV1:
 673                     ; 247     case WFE_Source_TIM1_EV0:
 673                     ; 248     case WFE_Source_TIM1_EV1:
 673                     ; 249     case WFE_Source_EXTI_EV0:
 673                     ; 250     case WFE_Source_EXTI_EV1:
 673                     ; 251     case WFE_Source_EXTI_EV2:
 673                     ; 252     case WFE_Source_EXTI_EV3:
 673                     ; 253 
 673                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 675  013e c650a6        	ld	a,20646
 676  0141 1503          	bcp	a,(OFST+2,sp)
 677  0143 2706          	jreq	L162
 678                     ; 257         status = ENABLE;
 680  0145 a601          	ld	a,#1
 681  0147 6b01          	ld	(OFST+0,sp),a
 684  0149 2035          	jra	L752
 685  014b               L162:
 686                     ; 262         status = DISABLE;
 688  014b 0f01          	clr	(OFST+0,sp)
 690  014d 2031          	jra	L752
 691  014f               L322:
 692                     ; 266     case WFE_Source_EXTI_EV4:
 692                     ; 267     case WFE_Source_EXTI_EV5:
 692                     ; 268     case WFE_Source_EXTI_EV6:
 692                     ; 269     case WFE_Source_EXTI_EV7:
 692                     ; 270     case WFE_Source_EXTI_EVB_G:
 692                     ; 271     case WFE_Source_EXTI_EVD_H:
 692                     ; 272     case WFE_Source_EXTI_EVE_F:
 692                     ; 273     case WFE_Source_ADC1_COMP_EV:
 692                     ; 274 
 692                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 694  014f c650a7        	ld	a,20647
 695  0152 1503          	bcp	a,(OFST+2,sp)
 696  0154 2706          	jreq	L562
 697                     ; 278         status = ENABLE;
 699  0156 a601          	ld	a,#1
 700  0158 6b01          	ld	(OFST+0,sp),a
 703  015a 2024          	jra	L752
 704  015c               L562:
 705                     ; 283         status = DISABLE;
 707  015c 0f01          	clr	(OFST+0,sp)
 709  015e 2020          	jra	L752
 710  0160               L522:
 711                     ; 286     case WFE_Source_TIM3_EV0:
 711                     ; 287     case WFE_Source_TIM3_EV1:
 711                     ; 288     case WFE_Source_TIM4_EV:
 711                     ; 289     case WFE_Source_SPI1_EV:
 711                     ; 290     case WFE_Source_I2C1_EV:
 711                     ; 291     case WFE_Source_USART1_EV:
 711                     ; 292     case WFE_Source_DMA1CH01_EV:
 711                     ; 293     case WFE_Source_DMA1CH23_EV:
 711                     ; 294 
 711                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 713  0160 c650a8        	ld	a,20648
 714  0163 1503          	bcp	a,(OFST+2,sp)
 715  0165 2706          	jreq	L172
 716                     ; 298         status = ENABLE;
 718  0167 a601          	ld	a,#1
 719  0169 6b01          	ld	(OFST+0,sp),a
 722  016b 2013          	jra	L752
 723  016d               L172:
 724                     ; 303         status = DISABLE;
 726  016d 0f01          	clr	(OFST+0,sp)
 728  016f 200f          	jra	L752
 729  0171               L722:
 730                     ; 307     case WFE_Source_TIM5_EV0:
 730                     ; 308     case WFE_Source_TIM5_EV1:
 730                     ; 309     case WFE_Source_AES_EV:
 730                     ; 310     case WFE_Source_SPI2_EV:
 730                     ; 311     case WFE_Source_USART2_EV:
 730                     ; 312     case WFE_Source_USART3_EV:
 730                     ; 313     case WFE_Source_RTC_CSS_EV:
 730                     ; 314 
 730                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 732  0171 c650a9        	ld	a,20649
 733  0174 1503          	bcp	a,(OFST+2,sp)
 734  0176 2706          	jreq	L572
 735                     ; 318         status = ENABLE;
 737  0178 a601          	ld	a,#1
 738  017a 6b01          	ld	(OFST+0,sp),a
 741  017c 2002          	jra	L752
 742  017e               L572:
 743                     ; 323         status = DISABLE;
 745  017e 0f01          	clr	(OFST+0,sp)
 747  0180               L132:
 748                     ; 326     default:
 748                     ; 327       break;
 750  0180               L752:
 751                     ; 329   return status;
 753  0180 7b01          	ld	a,(OFST+0,sp)
 756  0182 5b03          	addw	sp,#3
 757  0184 81            	ret
 770                     	xdef	_WFE_GetWakeUpSourceEventStatus
 771                     	xdef	_WFE_WakeUpSourceEventCmd
 772                     	xdef	_WFE_DeInit
 791                     	end
