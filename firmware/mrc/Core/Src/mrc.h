#include <stdint.h>
#include <stdbool.h>
#include "stm32f7xx.h"
#include "arm_math.h"

#ifndef SRC_MRC_H_
#define SRC_MRC_H_

#define FNCO 120000000.0

//FPGA Configuration Registers
#define FPGA_TE_0 0x00
#define FPGA_TE_1 0x01
#define FPGA_T180 0x02
#define FPGA_T90 0x03
#define FPGA_NECHO_0 0x04
#define FPGA_NECHO_1 0x05
#define FPGA_A90_0 0x06
#define FPGA_A90_1 0x07
#define FPGA_A180_0 0x08
#define FPGA_A180_1 0x09
#define FPGA_CTRL 0x0A
#define FPGA_FREQ_0 0x0B
#define FPGA_FREQ_1 0x0C

//Transfer types
#define TTYPE_STATUS 0x01
#define TTYPE_DATA 0x02

extern DMA_HandleTypeDef hdma_memtomem_dma2_stream0;


//Delay function
uint32_t DWT_Delay_Init(void);
__STATIC_INLINE void DWT_Delay_us(volatile uint32_t microseconds)
{
  uint32_t clk_cycle_start = DWT->CYCCNT;
  microseconds *= (HAL_RCC_GetHCLKFreq() / 1000000);
  while ((DWT->CYCCNT - clk_cycle_start) < microseconds);
}

extern SPI_HandleTypeDef hspi3;

uint8_t Configure_MRC(void);
uint8_t FPGA_Write_Register(uint16_t data);
//uint8_t Configure_CPMG(uint16_t techo, uint8_t t180, uint8_t t90,
//		uint16_t necho, uint16_t a90, uint16_t a180);
uint8_t Load_Sequence(uint16_t * sequence, uint16_t len);
uint8_t Trigger_Sequence(void);
uint8_t Transfer_Samples(int len);
uint8_t Load_Samples(q15_t* sbuf, int len);
uint8_t Transfer_Status(char * format, ...);
uint8_t MRC_Set_Freq(float freq);
uint8_t Reset_FPGA(void);
uint8_t MRC_Calibrator(float freq);
uint8_t Set_Attenuator(uint8_t attenuation);
uint8_t Set_Well(uint8_t well);
uint8_t fake_cmplx_mag_sqrd(uint16_t * src, uint16_t * dst, uint32_t nsamples);
int score_cal(float frequency, uint16_t amp);
float calibrate_frequency(float start_frequency);

#endif /* SRC_MRC_H_ */
