
#include "mrc.h"
#include "main.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdarg.h>
#include "stm32f7xx.h"
#include "arm_math.h"

#include "usbd_cdc_if.h"
extern USBD_HandleTypeDef hUsbDeviceFS;

volatile uint8_t fmc_dma_flag;

uint8_t FPGA_Write_Register(uint16_t data){
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	HAL_Delay(1);
	HAL_SPI_Transmit(&hspi3, (uint8_t *) &data, 1, 100);
	while (HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY){}
	HAL_Delay(1);
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	return SUCCESS;
}

uint8_t Configure_MRC(void){
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	HAL_Delay(1);
	Reset_FPGA();
	return SUCCESS;
}

uint8_t Load_Sequence(uint16_t * sequence, uint16_t len){
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_RESET);  //activate CS
	HAL_Delay(1);
	HAL_SPI_Transmit(&hspi3, (uint8_t *) &len, 1, 100);
	while (HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY){}
	for(int i = 1; i < len; i ++){ //Don't transfer the sequence length
		uint16_t data = *(sequence + i);
		DEBUG_PRINT("%x\n\r", data);
		HAL_SPI_Transmit(&hspi3, (uint8_t *) &data, 1, 100);
		while (HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY){}
	}
	HAL_Delay(1);
	HAL_GPIO_WritePin(FPGA_SEN_GPIO_Port, FPGA_SEN_Pin, GPIO_PIN_SET);  //deactivate CS
	return SUCCESS;
}

uint8_t Trigger_Sequence(void){
	HAL_GPIO_WritePin(DAC_TXEN_GPIO_Port, DAC_TXEN_Pin, GPIO_PIN_SET);
	HAL_Delay(1);
	FPGA_Write_Register(0b1000000000000010);
	return SUCCESS;
}

uint8_t Reset_FPGA(void){
	FPGA_Write_Register(0b1000000010000000);
	return SUCCESS;
}

uint8_t fake_cmplx_mag_sqrd(uint16_t * src, uint16_t * dst, uint32_t nsamples){
	for(int i = 0; i < nsamples; i++){
		dst[i] = src[2*i]*src[2*i]+src[2*i+1]*src[2*i+1];
	}
	return SUCCESS;
}

//Limit this to 1024 samples
uint8_t Load_Samples(q15_t* sbuf, int len){
	DEBUG_PRINT("Load Samples");
	int delay_counter = 0;
	int samples_loaded = 0;

	hdma_memtomem_dma2_stream0.XferCpltCallback = &DmaXferCompleteCallback;

	while(len > 0){
		if(len <= 256){ //The FIFO flag will never be set
			HAL_Delay(1000); //Just wait for the experiment to be over
		}else{
			delay_counter = 0;
			while(!HAL_GPIO_ReadPin(FIFO_FLAG_GPIO_Port, FIFO_FLAG_Pin) && delay_counter < 10000){
				delay_counter ++;//Wait for the FIFO to be half full
			}
			if(delay_counter >= 10000){
				DEBUG_PRINT("Fail 84\n\r");
				return FAIL;
			}
		}
		uint16_t stream_samples = 512;
		if(len <= 256) stream_samples = len*2;
		HAL_DMA_Start_IT(&hdma_memtomem_dma2_stream0,(uint32_t)NAND_DEVICE,(uint32_t)(sbuf + samples_loaded*2),stream_samples);
		while(!fmc_dma_flag); //wait until this transfer is done
		fmc_dma_flag = false;

		len -= 256;
		samples_loaded += 256;

	}


	return SUCCESS;
}

uint8_t Transfer_Samples(int len){
	DEBUG_PRINT("%d\n\r", len);
	int buffer_start = 0;
	int delay_counter = 0;

	uint8_t header[4] = {TTYPE_DATA, (len>>16)&0xFF, (len>>8)&0xFF, (len)&0xFF}; //header includes number of samples!
	uint8_t footer[4] = {1,2,3,4};

	uint16_t stream_buf[1024];
//	memset(stream_buf, 0, 1024);
//	HAL_Delay(10);
	CDC_Transmit_FS(header, 4);

	hdma_memtomem_dma2_stream0.XferCpltCallback = &DmaXferCompleteCallback;
	if(len <= 256){
		HAL_Delay(100); //Just wait for the experiment to be over
	}else{
		delay_counter = 0;
		while(!HAL_GPIO_ReadPin(FIFO_FLAG_GPIO_Port, FIFO_FLAG_Pin) && delay_counter < 1000000){
			delay_counter ++;
		}
		if(delay_counter >= 1000000){
			DEBUG_PRINT("Fail 123\n\r");
			return FAIL;
		}
	}

	HAL_DMA_Start_IT(&hdma_memtomem_dma2_stream0,(uint32_t)NAND_DEVICE,(uint32_t)(stream_buf),512);
	while(!fmc_dma_flag); //wait until this transfer is done
	fmc_dma_flag = false;

	while(len >= 256){
		delay_counter = 0;
		if(len <= 512){
			HAL_Delay(100); //Just wait for the experiment to be over
		}else{
			delay_counter = 0;
			while(!HAL_GPIO_ReadPin(FIFO_FLAG_GPIO_Port, FIFO_FLAG_Pin) && delay_counter < 1000000){
				delay_counter ++;
			}
			if(delay_counter >= 1000000){
				DEBUG_PRINT("Fail 123\n\r");
				return FAIL;
			}
		}
		//DMA into the "other" part of the buffer
		HAL_DMA_Start_IT(&hdma_memtomem_dma2_stream0,(uint32_t)NAND_DEVICE,(uint32_t)(stream_buf + (buffer_start ? 0 : 512)),512);

		//Send this part over USB
		USBD_CDC_HandleTypeDef *hcdc = (USBD_CDC_HandleTypeDef*)hUsbDeviceFS.pClassData;
		while(hcdc->TxState != 0);
		CDC_Transmit_FS((uint8_t*)(stream_buf+buffer_start), 1024);
		buffer_start = (buffer_start ? 0 : 512);


		while(!fmc_dma_flag); //wait until this transfer is done
		fmc_dma_flag = false;

		len -= 256;

	}
	USBD_CDC_HandleTypeDef *hcdc = (USBD_CDC_HandleTypeDef*)hUsbDeviceFS.pClassData;
	while(hcdc->TxState != 0);
	CDC_Transmit_FS((uint8_t*)(stream_buf+buffer_start), (len-256*(len/256))*4);
	while(hcdc->TxState != 0);
	CDC_Transmit_FS(footer, 4);

	return SUCCESS;
}

uint8_t Transfer_Status(char * format, ...){
	char buffer[256];
	va_list args;
	va_start (args, format);
	uint8_t stringsize = vsnprintf(buffer + 4, 256, format, args);
	//Assemble the preamble
	buffer[0] = TTYPE_STATUS;
	buffer[1] = 0;
	buffer[2] = 0;
	buffer[3] = stringsize;
	buffer[stringsize + 4] = 1;
	buffer[stringsize + 5] = 2;
	buffer[stringsize + 6] = 3;
	buffer[stringsize + 7] = 4;
	CDC_Transmit_FS((uint8_t *)buffer,stringsize + 8);
	return SUCCESS;
}

//float calibrate_frequency(float start_frequency){
//	DEBUG_PRINT("Calibrating Frequency:\n\r");
//	int max_score = 0;
//	int best_idx = -1;
//	for (int i = 0; i < 16; i++){
//		int score = score_cal(start_frequency + i*500.0 - 4000, 14000);
//		if(score > max_score){
//			best_idx = i;
//			max_score = score;
//		}
//		HAL_Delay(400);
//	}
//	DEBUG_PRINT("%d\n\r", best_idx);
//	return start_frequency + best_idx*500.0 - 4000;
//}

//int score_cal(float frequency, uint16_t amp){
//  //Set up the experiment
//  Configure_CPMG(500, 50, 25, 30, amp, amp);
//  MRC_Set_Freq(frequency);
//
//  //Run the experiment
//  Trigger_CPMG();
//  HAL_Delay(100);
//
//  //Stream data
//  uint16_t stream_buf[512]; // declaration
//  hdma_memtomem_dma2_stream0.XferCpltCallback = &DmaXferCompleteCallback;
//  HAL_DMA_Start_IT(&hdma_memtomem_dma2_stream0,(uint32_t)NAND_DEVICE,(uint32_t)stream_buf ,512); // get reading
//  while(!fmc_dma_flag); //wait until this transfer is done
//  fmc_dma_flag = false;
//
//  uint16_t mag_buff[25]; // declaration
//
//  int score = 0;
//  for(int i = 50; i < 75; i++){
//	  score = score + ((int16_t) mag_buff[i*2]);
//  }
//  DEBUG_PRINT("%d\n\r", abs(score));
//  return abs(score);
//
//}


uint8_t MRC_Set_Freq(float freq){
	uint8_t status = SUCCESS;
	uint32_t freq_word = (uint32_t) (freq*(1<<24)/FNCO);
	status &= FPGA_Write_Register(0b1100000000000000);
	status &= FPGA_Write_Register((freq_word >> 16)& 0xFFFF);
	status &= FPGA_Write_Register(freq_word & 0xFFFF);
	return status;
}

void DmaXferCompleteCallback(DMA_HandleTypeDef *hdma)
{
  //Code will reach here if the Transfer completes
	fmc_dma_flag = true;
}
