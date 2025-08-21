
#include "dac5687.h"
#include "main.h"
#include <stdint.h>
#include <stdbool.h>
#include "stm32f7xx.h"

//SPI function mappings
uint8_t DAC5687_Write_Register(uint8_t address, uint8_t data){
	HAL_GPIO_WritePin(DAC_SEN_GPIO_Port, DAC_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	HAL_SPI_Transmit(&hspi2, &address, 1, 100);
	while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY){}
	HAL_SPI_Transmit(&hspi2, &data, 1, 100);
	while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY){}
	HAL_GPIO_WritePin(DAC_SEN_GPIO_Port, DAC_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	uint8_t newvalue = DAC5687_Read_Register(address);
	if(newvalue == data) return SUCCESS;
	DEBUG_PRINT("Write to DAC register 0x%X Failed. Target = 0x%X, Result = 0x%X\n\r", address, data, newvalue);
	return FAIL;
}

uint8_t DAC5687_Read_Register(uint8_t address){
	uint8_t rxbuf[1];
	HAL_GPIO_WritePin(DAC_SEN_GPIO_Port, DAC_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	uint8_t masked_address_buffer = address | 0x80;							//set write bit
	HAL_SPI_Transmit(&hspi2, &masked_address_buffer, 1, 100);
	while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY){}
	HAL_SPI_Receive(&hspi2, rxbuf, 1, 100);
	while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY){}
	HAL_GPIO_WritePin(DAC_SEN_GPIO_Port, DAC_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	return rxbuf[0];
}

uint8_t DAC5687_Sleep(bool sleep){
	HAL_GPIO_WritePin(DAC_SLEEP_GPIO_Port, DAC_SLEEP_Pin, sleep);
	return SUCCESS;
}

uint8_t DAC5687_Reset(){
	HAL_GPIO_WritePin(DAC_NRST_GPIO_Port, DAC_NRST_Pin, GPIO_PIN_RESET);
	HAL_Delay(1);
	HAL_GPIO_WritePin(DAC_NRST_GPIO_Port, DAC_NRST_Pin, GPIO_PIN_SET);
	return SUCCESS;
}

uint8_t DAC5687_Init(){

	uint8_t status = SUCCESS;
	status &= DAC5687_Reset();
	status &= DAC5687_Write_Register(DAC_CONFIG3, SIF_4PIN_BIT); //configure SPI 4 pin
	status &= DAC5687_Write_Register(DAC_CONFIG0, FIFO_BYPASS_BIT | PLL_KV_BIT | DAC_PLL_DIV_2);
	status &= DAC5687_Write_Register(DAC_CONFIG1, TWOS_BIT);
	status &= DAC5687_Write_Register(DAC_CONFIG2, 0x00);
//	status &= DAC5687_Write_Register(DAC_NCO_FREQ_3, 0x1C);
//	DAC5687_Sleep(true);

	return status;
}

uint8_t DAC5687_Set_Freq(float freq){
	uint8_t status = SUCCESS;
	//Assuming freq < 2^31
	uint32_t freq_word = (uint32_t) (freq*(1<<16)*(1<<16)/FDAC);
	status &= DAC5687_Write_Register(DAC_NCO_FREQ_0, (freq_word & 0xFF));
	status &= DAC5687_Write_Register(DAC_NCO_FREQ_1, ((freq_word >> 8) & 0xFF));
	status &= DAC5687_Write_Register(DAC_NCO_FREQ_2, ((freq_word >> 16) & 0xFF));
	status &= DAC5687_Write_Register(DAC_NCO_FREQ_3, ((freq_word >> 24) & 0xFF));
	return status;
}

uint8_t DAC5687_Pattern_Test(){
	uint8_t status = SUCCESS;
	status &= DAC5687_Write_Register(DAC_CONFIG3, SIF_4PIN_BIT | DAC_COUNTER_MODE_5MSB);

	status &= DAC5687_Sleep(false);

	return status;
}
