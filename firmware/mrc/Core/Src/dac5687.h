#include <stdint.h>
#include <stdbool.h>
#include "stm32f7xx.h"

#ifndef SRC_DAC5687_H_
#define SRC_DAC5687_H_

#define FDAC 120000000.0

//register definitions
#define DAC_VERSION 0x00
#define DAC_CONFIG0 0x01
#define DAC_CONFIG1 0x02
#define DAC_CONFIG2 0x03
#define DAC_CONFIG3 0x04
#define DAC_SYNC_CNTL 0x05
#define DAC_SER_DATA_0 0x06
#define DAC_SER_DATA_1 0x07
#define DAC_NCO_FREQ_0 0x09
#define DAC_NCO_FREQ_1 0x0A
#define DAC_NCO_FREQ_2 0x0B
#define DAC_NCO_FREQ_3 0x0C
#define DAC_NCO_PHASE_0 0x0D
#define DAC_NCO_PHASE_1 0x0E
#define DAC_DACA_OFFSET_0 0x0F
#define DAC_DACB_OFFSET_0 0x10
#define DAC_DACA_OFFSET_1 0x11
#define DAC_DACB_OFFSET_1 0x12
#define DAC_QMCA_GAIN_0 0x13
#define DAC_QMCB_GAIN_0 0x14
#define DAC_QMC_PHASE_0 0x15
#define DAC_QMC_PHASE_GAIN_1 0x16
#define DAC_DACA_GAIN_0 0x17
#define DAC_DACB_GAIN_0 0x18
#define DAC_DACA_DACB_GAIN_1 0x19
#define DAC_ATEST 0x1B
#define DAC_DAC_TEST 0x1C

#define SLEEP_DACA_BIT (1<<7)
#define SLEEP_DACB_BIT (1<<6)
#define HPLA_BIT (1<<5)
#define HPLB_BIT (1<<4)

//PLL VCO Divider
typedef enum dac_pll_div {
	DAC_PLL_DIV_1 = (0b00 << 6),
	DAC_PLL_DIV_2 = (0b01 << 6),
	DAC_PLL_DIV_4 = (0b10 << 6),
	DAC_PLL_DIV_8 = (0b11 << 6)
} dac_pll_div;

#define PLL_FREQ_BIT (1 << 5)
#define PLL_KV_BIT (1 << 4)

//FIR Interpolation
typedef enum dac_interp {
	DAC_INTERP_X2 = (0b00 << 2),
	DAC_INTERP_X4 = (0b01 << 2),
	DAC_INTERP_X4L = (0b10 << 2),
	DAC_INTERP_X8 = (0b11 << 2)
} dac_interp;

#define INV_PLLLOCK_BIT (1<<1)
#define FIFO_BYPASS_BIT (1<<0)

#define QFLAG_BIT (1<<7)
#define INTERL_BIT (1<<6)
#define DUAL_CLK_BIT (1<<5)
#define TWOS_BIT (1<<4)
#define REV_ABUS_BIT (1<<3)
#define REV_BBUS_BIT (1<<2)
#define FIR_BYPASS_BIT (1<<1)
#define FULL_BYPASS_BIT (1<<0)

#define NCO_BIT (1<<7)
#define NCO_GAIN_BIT (1<<6)
#define QMC_BIT (1<<5)
#define DAC_CM_MODE_POS 1
#define DAC_CM_MODE(val) (val << DAC_CM_MODE_POS)

#define SIF_4PIN_BIT (1<<7)
#define DAC_SER_DATA_BIT (1<<6)
#define HALF_RATE_BIT (1<<5)
#define USB_BIT (1<<4)

//Counter Mode
typedef enum dac_counter_mode {
	DAC_COUNTER_MODE_OFF = 0b000,
	DAC_COUNTER_MODE_ALL_16 = 0b100,
	DAC_COUNTER_MODE_7LSB = 0b101,
	DAC_COUNTER_MODE_5MID = 0b110,
	DAC_COUNTER_MODE_5MSB = 0b111
} dac_counter_mode;

#define SYNC_PHSTR_BIT (1<<7)
#define SYNC_NCO_BIT (1<<6)
#define SYNC_CM_BIT (1<<5)

//FIFO Sync
typedef enum dac_sync_fifo {
	DAC_SYNC_FIFO_TXENABLE = (0b000 << 2),
	DAC_SYNC_FIFO_PHSTR = (0b001 << 2),
	DAC_SYNC_FIFO_QFLAG = (0b010 << 2),
	DAC_SYNC_FIFO_DB15 = (0b011 << 2),
	DAC_SYNC_FIFO_DA15 = (0b100 << 2),
	DAC_SYNC_FIFO_SIF_WRITE = (0b101 << 2),
	DAC_SYNC_FIFO_DISABLED = (0b110 << 2),
	DAC_SYNC_FIFO_ALWAYS_ON = (0b111 << 2)

} dac_sync_fifo;

extern SPI_HandleTypeDef hspi2;

uint8_t DAC5687_Write_Register(uint8_t address, uint8_t data);
uint8_t DAC5687_Read_Register(uint8_t address);
uint8_t DAC5687_Init();
uint8_t DAC5687_Sleep(bool sleep);
uint8_t DAC5687_Reset();
uint8_t DAC5687_Pattern_Test();
uint8_t DAC5687_Set_Freq(float freq);


#endif /* SRC_DAC5687_H_ */
