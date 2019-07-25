/**
  ******************************************************************************
  * @file    I2C/I2C_TwoBoards/I2C_JoystickPlay/Master/main.h
  * @author  MCD Application Team
  * @version V1.5.2
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* definition of fast or default standard mode (bus speed up to 400 or 100 kHz) */
#define FAST_I2C_MODE

#ifdef FAST_I2C_MODE
#define I2C_SPEED 300000
#define TIM4_PERIOD 124
#else
#define I2C_SPEED 100000
#define TIM4_PERIOD 62
#endif


/* definition of 10-bit or default 7-bit slave address */
/* #define TEN_BITS_ADDRESS */

#ifdef TEN_BITS_ADDRESS
#define SLAVE_ADDRESS  0x330
#else
#define SLAVE_ADDRESS  0x30
#endif

#define BUFFERSIZE  255

/* Timer Delay */
#define TIM_DELAY 50

typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;


#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/