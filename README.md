# STM8-Development
Library and Tutorial for development on STM8L05x, STM8L15x, STM8L16x, STM8AL31x series


This tutorial uses STMicroelectronics' ST Visual Develop (STVD) as the main IDE and ST Visual Programmer (STVP) as the programmer if your board doesn't have an embedded ST-LINK/V2. You can buy a dedicated ST-LINK/V2 programmer from any common distributer such as Mouser, Digikey and Arrow.

Download links for STVD and STVP
STVD: https://www.st.com/en/development-tools/stvd-stm8.html
STVP: https://www.st.com/en/development-tools/stvp-stm8.html

STVD uses the Cosmic C toolchain for the STM8. It's free and you can download it from: https://www.cosmic-software.com/download.php

Make sure you have all necessary drivers installed i.e. USB driver for ST-LINK/V2

Within the 'setup' directory, you'll find an example project using STVD and documentation for setting up your own projects.


Currently Included are: 
1.) an example 'test' template project for the STM8L-DISCOVERY board
2.) an I2C example project for the STM8L050J3 reading temperature values from the MCP9808 I2C Digital Temperature Sensor (Breakout modules available from Adafruit and Seeed). The I2C example project uses the Std Periph Libr.
3.) a PWM output example project for STM8L-DISCOVERY board (STML8152C6) using TIM3 and PWM2
4.) an independent watchdog example project

***NOTE:
	To open a project using STVD, go to 'Files -> Open Workspace...' then open the project's '.stw' file.
***