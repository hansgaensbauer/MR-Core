#include <stdint.h>
#include "stm32f7xx.h"

#ifndef SRC_LTC2145_H_
#define SRC_LTC2145_H_

//register definitions
#define ADC_RESET 0x00
#define ADC_POWER_DOWN 0x01
#define ADC_TIMING 0x02
#define ADC_OUTPUT_MODE 0x03
#define ADC_DATA_FORMAT 0x04


#define ADC_TEST_PATTERN_POS 3
#define ADC_TEST_PATTERN(val) (val << ADC_TEST_PATTERN_POS)

//Bits
#define ADC_RESET_BIT (1<<7)

//FIR Interpolation
typedef enum adc_sleep {
	ADC_NORMAL,
	ADC_CH2_NAP,
	ADC_CH1_CH2_NAP,
	ADC_SLEEP
} adc_sleep;


// Output test
typedef enum adc_outtest {
	TEST_PATTERN_OFF = 0b000,
	TEST_PATTERN_OUTPUTS_ZERO = 0b001,
	TEST_PATTERN_OUTPUTS_ONES = 0b011,
	TEST_PATTERN_CHECKERBOARD = 0b101,
	TEST_PATTERN_ALTERNATING = 0b111
} adc_outtest;

extern SPI_HandleTypeDef hspi1;

#define ADC_TWOS_COMPLEMENT 1


uint8_t LTC2145_Write_Register(uint8_t address, uint8_t data);
uint8_t LTC2145_Read_Register(uint8_t address);
uint8_t LTC2145_Init();

#endif /* SRC_LTC2145_H_ */
