#include "ltc2145.h"
#include "main.h"
#include <stdint.h>
#include <stdbool.h>
#include "stm32f7xx.h"

//SPI function mappings
uint8_t LTC2145_Write_Register(uint8_t address, uint8_t data){
	HAL_GPIO_WritePin(ADC_SEN_GPIO_Port, ADC_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	HAL_SPI_Transmit(&hspi1, &address, 1, 100);
	while (HAL_SPI_GetState(&hspi1) != HAL_SPI_STATE_READY){}
	HAL_SPI_Transmit(&hspi1, &data, 1, 100);
	while (HAL_SPI_GetState(&hspi1) != HAL_SPI_STATE_READY){}
	HAL_GPIO_WritePin(ADC_SEN_GPIO_Port, ADC_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	uint8_t newvalue = LTC2145_Read_Register(address);
	if(newvalue == data) return SUCCESS;
	DEBUG_PRINT("Write to ADC register 0x%X Failed. Target = 0x%X, Result = 0x%X\n\r", address, data, newvalue);
	return FAIL;
}

uint8_t LTC2145_Read_Register(uint8_t address){
	uint8_t rxbuf[1];
	HAL_GPIO_WritePin(ADC_SEN_GPIO_Port, ADC_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	uint8_t masked_address_buffer = address | 0x80;							//set write bit
	HAL_SPI_Transmit(&hspi1, &masked_address_buffer, 1, 100);
	while (HAL_SPI_GetState(&hspi1) != HAL_SPI_STATE_READY){}
	HAL_SPI_Receive(&hspi1, rxbuf, 1, 100);
	while (HAL_SPI_GetState(&hspi1) != HAL_SPI_STATE_READY){}
	HAL_GPIO_WritePin(ADC_SEN_GPIO_Port, ADC_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	return rxbuf[0];
}

uint8_t LTC2145_Init(){
	LTC2145_Write_Register(ADC_RESET, ADC_RESET_BIT); //reset ADC
	HAL_Delay(10);
	LTC2145_Write_Register(ADC_DATA_FORMAT, ADC_TWOS_COMPLEMENT);
	return SUCCESS;
}



