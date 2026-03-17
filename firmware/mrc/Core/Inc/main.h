/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */
void DEBUG_PRINT(char * format, ...);
void DmaXferCompleteCallback(DMA_HandleTypeDef *hdma);        // Data Transfer Complete callback
/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define MAG_IO0_Pin GPIO_PIN_0
#define MAG_IO0_GPIO_Port GPIOF
#define MAG_IO1_Pin GPIO_PIN_1
#define MAG_IO1_GPIO_Port GPIOF
#define DAC_NRST_Pin GPIO_PIN_2
#define DAC_NRST_GPIO_Port GPIOF
#define DAC_SLEEP_Pin GPIO_PIN_3
#define DAC_SLEEP_GPIO_Port GPIOF
#define DAC_TXEN_Pin GPIO_PIN_4
#define DAC_TXEN_GPIO_Port GPIOF
#define ADC_OF2_Pin GPIO_PIN_8
#define ADC_OF2_GPIO_Port GPIOF
#define ADC_OF1_Pin GPIO_PIN_9
#define ADC_OF1_GPIO_Port GPIOF
#define DAC_SEN_Pin GPIO_PIN_0
#define DAC_SEN_GPIO_Port GPIOC
#define ADC_SEN_Pin GPIO_PIN_4
#define ADC_SEN_GPIO_Port GPIOA
#define FPGA_SEN_Pin GPIO_PIN_1
#define FPGA_SEN_GPIO_Port GPIOB
#define MC_LED1_Pin GPIO_PIN_3
#define MC_LED1_GPIO_Port GPIOG
#define MC_LED2_Pin GPIO_PIN_4
#define MC_LED2_GPIO_Port GPIOG
#define UCIO0_Pin GPIO_PIN_6
#define UCIO0_GPIO_Port GPIOG
#define ATT_SER_Pin GPIO_PIN_7
#define ATT_SER_GPIO_Port GPIOG
#define ATT_LE_Pin GPIO_PIN_8
#define ATT_LE_GPIO_Port GPIOG
#define FIFO_FLAG_Pin GPIO_PIN_11
#define FIFO_FLAG_GPIO_Port GPIOC
#define UCIO3_Pin GPIO_PIN_9
#define UCIO3_GPIO_Port GPIOG
#define UCIO4_Pin GPIO_PIN_10
#define UCIO4_GPIO_Port GPIOG
#define ATT_SRCLK_Pin GPIO_PIN_12
#define ATT_SRCLK_GPIO_Port GPIOG

/* USER CODE BEGIN Private defines */

//status return values
#define SUCCESS	0xFF
#define FAIL 0x00
/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
