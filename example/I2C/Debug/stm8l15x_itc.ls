   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.13 - 05 Feb 2019
   3                     ; Generator (Limited) V4.4.9 - 06 Feb 2019
  42                     ; 56 uint8_t ITC_GetCPUCC(void)
  42                     ; 57 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 59   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 60   _asm("pop a");
  57  0001 84            pop a
  59                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 87 void ITC_DeInit(void)
  85                     ; 88 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 97 }
 118  0023 81            	ret
 143                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 105 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 442                     .const:	section	.text
 443  0000               L22:
 444  0000 004d          	dc.w	L14
 445  0002 004d          	dc.w	L14
 446  0004 004d          	dc.w	L14
 447  0006 0056          	dc.w	L34
 448  0008 0056          	dc.w	L34
 449  000a 0056          	dc.w	L34
 450  000c 0056          	dc.w	L34
 451  000e 005f          	dc.w	L54
 452  0010 005f          	dc.w	L54
 453  0012 005f          	dc.w	L54
 454  0014 005f          	dc.w	L54
 455  0016 0068          	dc.w	L74
 456  0018 0068          	dc.w	L74
 457  001a 0068          	dc.w	L74
 458  001c 0068          	dc.w	L74
 459  001e 0093          	dc.w	L712
 460  0020 0071          	dc.w	L15
 461  0022 0071          	dc.w	L15
 462  0024 0071          	dc.w	L15
 463  0026 007a          	dc.w	L35
 464  0028 007a          	dc.w	L35
 465  002a 007a          	dc.w	L35
 466  002c 0093          	dc.w	L712
 467  002e 0093          	dc.w	L712
 468  0030 0083          	dc.w	L55
 469  0032 0083          	dc.w	L55
 470  0034 0083          	dc.w	L55
 471  0036 008c          	dc.w	L75
 472  0038 008c          	dc.w	L75
 473                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 473                     ; 115 {
 474                     	switch	.text
 475  0029               _ITC_GetSoftwarePriority:
 477  0029 88            	push	a
 478  002a 89            	pushw	x
 479       00000002      OFST:	set	2
 482                     ; 116   uint8_t Value = 0;
 484  002b 0f02          	clr	(OFST+0,sp)
 486                     ; 117   uint8_t Mask = 0;
 488                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 490                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 492  002d a403          	and	a,#3
 493  002f 48            	sll	a
 494  0030 5f            	clrw	x
 495  0031 97            	ld	xl,a
 496  0032 a603          	ld	a,#3
 497  0034 5d            	tnzw	x
 498  0035 2704          	jreq	L41
 499  0037               L61:
 500  0037 48            	sll	a
 501  0038 5a            	decw	x
 502  0039 26fc          	jrne	L61
 503  003b               L41:
 504  003b 6b01          	ld	(OFST-1,sp),a
 506                     ; 125   switch (IRQn)
 508  003d 7b03          	ld	a,(OFST+1,sp)
 510                     ; 223     default:
 510                     ; 224       break;
 511  003f 4a            	dec	a
 512  0040 a11d          	cp	a,#29
 513  0042 2407          	jruge	L02
 514  0044 5f            	clrw	x
 515  0045 97            	ld	xl,a
 516  0046 58            	sllw	x
 517  0047 de0000        	ldw	x,(L22,x)
 518  004a fc            	jp	(x)
 519  004b               L02:
 520  004b 2046          	jra	L712
 521  004d               L14:
 522                     ; 127     case FLASH_IRQn:
 522                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 522                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 522                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 524  004d c67f70        	ld	a,32624
 525  0050 1401          	and	a,(OFST-1,sp)
 526  0052 6b02          	ld	(OFST+0,sp),a
 528                     ; 131       break;
 530  0054 203d          	jra	L712
 531  0056               L34:
 532                     ; 133     case EXTIE_F_PVD_IRQn:
 532                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 532                     ; 135     case RTC_IRQn:
 532                     ; 136     case EXTIB_IRQn:
 532                     ; 137     case EXTID_IRQn:
 532                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 532                     ; 139     case RTC_CSSLSE_IRQn:
 532                     ; 140     case EXTIB_IRQn:
 532                     ; 141     case EXTID_IRQn:
 532                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 532                     ; 143     case RTC_CSSLSE_IRQn:
 532                     ; 144     case EXTIB_G_IRQn:
 532                     ; 145     case EXTID_H_IRQn:
 532                     ; 146 #endif  /* STM8L15X_MD */
 532                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 534  0056 c67f71        	ld	a,32625
 535  0059 1401          	and	a,(OFST-1,sp)
 536  005b 6b02          	ld	(OFST+0,sp),a
 538                     ; 148       break;
 540  005d 2034          	jra	L712
 541  005f               L54:
 542                     ; 150     case EXTI0_IRQn:
 542                     ; 151     case EXTI1_IRQn:
 542                     ; 152     case EXTI2_IRQn:
 542                     ; 153     case EXTI3_IRQn:
 542                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 544  005f c67f72        	ld	a,32626
 545  0062 1401          	and	a,(OFST-1,sp)
 546  0064 6b02          	ld	(OFST+0,sp),a
 548                     ; 155       break;
 550  0066 202b          	jra	L712
 551  0068               L74:
 552                     ; 157     case EXTI4_IRQn:
 552                     ; 158     case EXTI5_IRQn:
 552                     ; 159     case EXTI6_IRQn:
 552                     ; 160     case EXTI7_IRQn:
 552                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 554  0068 c67f73        	ld	a,32627
 555  006b 1401          	and	a,(OFST-1,sp)
 556  006d 6b02          	ld	(OFST+0,sp),a
 558                     ; 162       break;
 560  006f 2022          	jra	L712
 561  0071               L15:
 562                     ; 165     case SWITCH_CSS_IRQn:
 562                     ; 166 #else
 562                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 562                     ; 168 #endif /* STM8L15X_LD */		
 562                     ; 169     case ADC1_COMP_IRQn:
 562                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 562                     ; 171     case LCD_IRQn:
 562                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 562                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 562                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 562                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 562                     ; 176     case LCD_AES_IRQn:
 562                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 562                     ; 178 #endif  /* STM8L15X_MD */
 562                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 564  0071 c67f74        	ld	a,32628
 565  0074 1401          	and	a,(OFST-1,sp)
 566  0076 6b02          	ld	(OFST+0,sp),a
 568                     ; 180       break;
 570  0078 2019          	jra	L712
 571  007a               L35:
 572                     ; 187     case TIM2_CC_IRQn:
 572                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 572                     ; 189     case TIM3_CC_IRQn:
 572                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 572                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 572                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 572                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 572                     ; 194 #endif  /* STM8L15X_MD */
 572                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 574  007a c67f75        	ld	a,32629
 575  007d 1401          	and	a,(OFST-1,sp)
 576  007f 6b02          	ld	(OFST+0,sp),a
 578                     ; 196       break;
 580  0081 2010          	jra	L712
 581  0083               L55:
 582                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 582                     ; 202     case SPI1_IRQn:
 582                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 582                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 582                     ; 205     case USART1_TX_IRQn:
 582                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 582                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 582                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 582                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 584  0083 c67f76        	ld	a,32630
 585  0086 1401          	and	a,(OFST-1,sp)
 586  0088 6b02          	ld	(OFST+0,sp),a
 588                     ; 210       break;
 590  008a 2007          	jra	L712
 591  008c               L75:
 592                     ; 214     case USART1_RX_IRQn:
 592                     ; 215     case I2C1_IRQn:
 592                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 592                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 592                     ; 218     case I2C1_SPI2_IRQn:
 592                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 592                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 594  008c c67f77        	ld	a,32631
 595  008f 1401          	and	a,(OFST-1,sp)
 596  0091 6b02          	ld	(OFST+0,sp),a
 598                     ; 221       break;
 600  0093               L16:
 601                     ; 223     default:
 601                     ; 224       break;
 603  0093               L712:
 604                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 606  0093 7b03          	ld	a,(OFST+1,sp)
 607  0095 a403          	and	a,#3
 608  0097 48            	sll	a
 609  0098 5f            	clrw	x
 610  0099 97            	ld	xl,a
 611  009a 7b02          	ld	a,(OFST+0,sp)
 612  009c 5d            	tnzw	x
 613  009d 2704          	jreq	L42
 614  009f               L62:
 615  009f 44            	srl	a
 616  00a0 5a            	decw	x
 617  00a1 26fc          	jrne	L62
 618  00a3               L42:
 619  00a3 6b02          	ld	(OFST+0,sp),a
 621                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 623  00a5 7b02          	ld	a,(OFST+0,sp)
 626  00a7 5b03          	addw	sp,#3
 627  00a9 81            	ret
 691                     	switch	.const
 692  003a               L44:
 693  003a 00e2          	dc.w	L122
 694  003c 00e2          	dc.w	L122
 695  003e 00e2          	dc.w	L122
 696  0040 00f4          	dc.w	L322
 697  0042 00f4          	dc.w	L322
 698  0044 00f4          	dc.w	L322
 699  0046 00f4          	dc.w	L322
 700  0048 0106          	dc.w	L522
 701  004a 0106          	dc.w	L522
 702  004c 0106          	dc.w	L522
 703  004e 0106          	dc.w	L522
 704  0050 0118          	dc.w	L722
 705  0052 0118          	dc.w	L722
 706  0054 0118          	dc.w	L722
 707  0056 0118          	dc.w	L722
 708  0058 0170          	dc.w	L772
 709  005a 012a          	dc.w	L132
 710  005c 012a          	dc.w	L132
 711  005e 012a          	dc.w	L132
 712  0060 013c          	dc.w	L332
 713  0062 013c          	dc.w	L332
 714  0064 013c          	dc.w	L332
 715  0066 0170          	dc.w	L772
 716  0068 0170          	dc.w	L772
 717  006a 014e          	dc.w	L532
 718  006c 014e          	dc.w	L532
 719  006e 014e          	dc.w	L532
 720  0070 0160          	dc.w	L732
 721  0072 0160          	dc.w	L732
 722                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 722                     ; 251 {
 723                     	switch	.text
 724  00aa               _ITC_SetSoftwarePriority:
 726  00aa 89            	pushw	x
 727  00ab 89            	pushw	x
 728       00000002      OFST:	set	2
 731                     ; 252   uint8_t Mask = 0;
 733                     ; 253   uint8_t NewPriority = 0;
 735                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 737                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 739                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 741                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 743  00ac 9e            	ld	a,xh
 744  00ad a403          	and	a,#3
 745  00af 48            	sll	a
 746  00b0 5f            	clrw	x
 747  00b1 97            	ld	xl,a
 748  00b2 a603          	ld	a,#3
 749  00b4 5d            	tnzw	x
 750  00b5 2704          	jreq	L23
 751  00b7               L43:
 752  00b7 48            	sll	a
 753  00b8 5a            	decw	x
 754  00b9 26fc          	jrne	L43
 755  00bb               L23:
 756  00bb 43            	cpl	a
 757  00bc 6b01          	ld	(OFST-1,sp),a
 759                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 761  00be 7b03          	ld	a,(OFST+1,sp)
 762  00c0 a403          	and	a,#3
 763  00c2 48            	sll	a
 764  00c3 5f            	clrw	x
 765  00c4 97            	ld	xl,a
 766  00c5 7b04          	ld	a,(OFST+2,sp)
 767  00c7 5d            	tnzw	x
 768  00c8 2704          	jreq	L63
 769  00ca               L04:
 770  00ca 48            	sll	a
 771  00cb 5a            	decw	x
 772  00cc 26fc          	jrne	L04
 773  00ce               L63:
 774  00ce 6b02          	ld	(OFST+0,sp),a
 776                     ; 268   switch (IRQn)
 778  00d0 7b03          	ld	a,(OFST+1,sp)
 780                     ; 372     default:
 780                     ; 373       break;
 781  00d2 4a            	dec	a
 782  00d3 a11d          	cp	a,#29
 783  00d5 2407          	jruge	L24
 784  00d7 5f            	clrw	x
 785  00d8 97            	ld	xl,a
 786  00d9 58            	sllw	x
 787  00da de003a        	ldw	x,(L44,x)
 788  00dd fc            	jp	(x)
 789  00de               L24:
 790  00de ac700170      	jpf	L772
 791  00e2               L122:
 792                     ; 270     case FLASH_IRQn:
 792                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 792                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 792                     ; 273       ITC->ISPR1 &= Mask;
 794  00e2 c67f70        	ld	a,32624
 795  00e5 1401          	and	a,(OFST-1,sp)
 796  00e7 c77f70        	ld	32624,a
 797                     ; 274       ITC->ISPR1 |= NewPriority;
 799  00ea c67f70        	ld	a,32624
 800  00ed 1a02          	or	a,(OFST+0,sp)
 801  00ef c77f70        	ld	32624,a
 802                     ; 275       break;
 804  00f2 207c          	jra	L772
 805  00f4               L322:
 806                     ; 277     case EXTIE_F_PVD_IRQn:
 806                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 806                     ; 279     case RTC_IRQn:
 806                     ; 280     case EXTIB_IRQn:
 806                     ; 281     case EXTID_IRQn:
 806                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 806                     ; 283     case RTC_CSSLSE_IRQn:
 806                     ; 284     case EXTIB_IRQn:
 806                     ; 285     case EXTID_IRQn:
 806                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 806                     ; 287     case RTC_CSSLSE_IRQn:
 806                     ; 288     case EXTIB_G_IRQn:
 806                     ; 289     case EXTID_H_IRQn:
 806                     ; 290 #endif  /* STM8L15X_MD */
 806                     ; 291       ITC->ISPR2 &= Mask;
 808  00f4 c67f71        	ld	a,32625
 809  00f7 1401          	and	a,(OFST-1,sp)
 810  00f9 c77f71        	ld	32625,a
 811                     ; 292       ITC->ISPR2 |= NewPriority;
 813  00fc c67f71        	ld	a,32625
 814  00ff 1a02          	or	a,(OFST+0,sp)
 815  0101 c77f71        	ld	32625,a
 816                     ; 293       break;
 818  0104 206a          	jra	L772
 819  0106               L522:
 820                     ; 295     case EXTI0_IRQn:
 820                     ; 296     case EXTI1_IRQn:
 820                     ; 297     case EXTI2_IRQn:
 820                     ; 298     case EXTI3_IRQn:
 820                     ; 299       ITC->ISPR3 &= Mask;
 822  0106 c67f72        	ld	a,32626
 823  0109 1401          	and	a,(OFST-1,sp)
 824  010b c77f72        	ld	32626,a
 825                     ; 300       ITC->ISPR3 |= NewPriority;
 827  010e c67f72        	ld	a,32626
 828  0111 1a02          	or	a,(OFST+0,sp)
 829  0113 c77f72        	ld	32626,a
 830                     ; 301       break;
 832  0116 2058          	jra	L772
 833  0118               L722:
 834                     ; 303     case EXTI4_IRQn:
 834                     ; 304     case EXTI5_IRQn:
 834                     ; 305     case EXTI6_IRQn:
 834                     ; 306     case EXTI7_IRQn:
 834                     ; 307       ITC->ISPR4 &= Mask;
 836  0118 c67f73        	ld	a,32627
 837  011b 1401          	and	a,(OFST-1,sp)
 838  011d c77f73        	ld	32627,a
 839                     ; 308       ITC->ISPR4 |= NewPriority;
 841  0120 c67f73        	ld	a,32627
 842  0123 1a02          	or	a,(OFST+0,sp)
 843  0125 c77f73        	ld	32627,a
 844                     ; 309       break;
 846  0128 2046          	jra	L772
 847  012a               L132:
 848                     ; 313     case SWITCH_CSS_IRQn:
 848                     ; 314 #endif /*	STM8L15X_LD	*/
 848                     ; 315     case ADC1_COMP_IRQn:
 848                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 848                     ; 317     case LCD_IRQn:
 848                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 848                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 848                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 848                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 848                     ; 322     case LCD_AES_IRQn:
 848                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 848                     ; 324 #endif  /* STM8L15X_MD */
 848                     ; 325       ITC->ISPR5 &= Mask;
 850  012a c67f74        	ld	a,32628
 851  012d 1401          	and	a,(OFST-1,sp)
 852  012f c77f74        	ld	32628,a
 853                     ; 326       ITC->ISPR5 |= NewPriority;
 855  0132 c67f74        	ld	a,32628
 856  0135 1a02          	or	a,(OFST+0,sp)
 857  0137 c77f74        	ld	32628,a
 858                     ; 327       break;
 860  013a 2034          	jra	L772
 861  013c               L332:
 862                     ; 333     case TIM2_CC_IRQn:
 862                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 862                     ; 335     case TIM3_CC_IRQn:
 862                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 862                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 862                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 862                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 862                     ; 340 #endif  /* STM8L15X_MD */
 862                     ; 341       ITC->ISPR6 &= Mask;
 864  013c c67f75        	ld	a,32629
 865  013f 1401          	and	a,(OFST-1,sp)
 866  0141 c77f75        	ld	32629,a
 867                     ; 342       ITC->ISPR6 |= NewPriority;
 869  0144 c67f75        	ld	a,32629
 870  0147 1a02          	or	a,(OFST+0,sp)
 871  0149 c77f75        	ld	32629,a
 872                     ; 343       break;
 874  014c 2022          	jra	L772
 875  014e               L532:
 876                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 876                     ; 349     case SPI1_IRQn:
 876                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 876                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 876                     ; 352     case USART1_TX_IRQn:
 876                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 876                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 876                     ; 355 #endif  /* STM8L15X_MD */
 876                     ; 356       ITC->ISPR7 &= Mask;
 878  014e c67f76        	ld	a,32630
 879  0151 1401          	and	a,(OFST-1,sp)
 880  0153 c77f76        	ld	32630,a
 881                     ; 357       ITC->ISPR7 |= NewPriority;
 883  0156 c67f76        	ld	a,32630
 884  0159 1a02          	or	a,(OFST+0,sp)
 885  015b c77f76        	ld	32630,a
 886                     ; 358       break;
 888  015e 2010          	jra	L772
 889  0160               L732:
 890                     ; 362     case USART1_RX_IRQn:
 890                     ; 363     case I2C1_IRQn:
 890                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 890                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 890                     ; 366     case I2C1_SPI2_IRQn:
 890                     ; 367 #endif  /* STM8L15X_MD */
 890                     ; 368       ITC->ISPR8 &= Mask;
 892  0160 c67f77        	ld	a,32631
 893  0163 1401          	and	a,(OFST-1,sp)
 894  0165 c77f77        	ld	32631,a
 895                     ; 369       ITC->ISPR8 |= NewPriority;
 897  0168 c67f77        	ld	a,32631
 898  016b 1a02          	or	a,(OFST+0,sp)
 899  016d c77f77        	ld	32631,a
 900                     ; 370       break;
 902  0170               L142:
 903                     ; 372     default:
 903                     ; 373       break;
 905  0170               L772:
 906                     ; 375 }
 909  0170 5b04          	addw	sp,#4
 910  0172 81            	ret
 923                     	xdef	_ITC_GetSoftwarePriority
 924                     	xdef	_ITC_SetSoftwarePriority
 925                     	xdef	_ITC_GetSoftIntStatus
 926                     	xdef	_ITC_GetCPUCC
 927                     	xdef	_ITC_DeInit
 946                     	end
