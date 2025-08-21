################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/dac5687.c \
../Core/Src/ltc2145.c \
../Core/Src/main.c \
../Core/Src/mrc.c \
../Core/Src/stm32f7xx_hal_msp.c \
../Core/Src/stm32f7xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f7xx.c 

OBJS += \
./Core/Src/dac5687.o \
./Core/Src/ltc2145.o \
./Core/Src/main.o \
./Core/Src/mrc.o \
./Core/Src/stm32f7xx_hal_msp.o \
./Core/Src/stm32f7xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f7xx.o 

C_DEPS += \
./Core/Src/dac5687.d \
./Core/Src/ltc2145.d \
./Core/Src/main.d \
./Core/Src/mrc.d \
./Core/Src/stm32f7xx_hal_msp.d \
./Core/Src/stm32f7xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f7xx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM7 -DUSE_HAL_DRIVER -DSTM32F767xx -c -I../Core/Inc -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/Core_A/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/DSP/Include" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include/" -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core_A/Include/ -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/CMSIS/Include -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/ -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/ -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/ -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/ -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/dac5687.cyclo ./Core/Src/dac5687.d ./Core/Src/dac5687.o ./Core/Src/dac5687.su ./Core/Src/ltc2145.cyclo ./Core/Src/ltc2145.d ./Core/Src/ltc2145.o ./Core/Src/ltc2145.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/mrc.cyclo ./Core/Src/mrc.d ./Core/Src/mrc.o ./Core/Src/mrc.su ./Core/Src/stm32f7xx_hal_msp.cyclo ./Core/Src/stm32f7xx_hal_msp.d ./Core/Src/stm32f7xx_hal_msp.o ./Core/Src/stm32f7xx_hal_msp.su ./Core/Src/stm32f7xx_it.cyclo ./Core/Src/stm32f7xx_it.d ./Core/Src/stm32f7xx_it.o ./Core/Src/stm32f7xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32f7xx.cyclo ./Core/Src/system_stm32f7xx.d ./Core/Src/system_stm32f7xx.o ./Core/Src/system_stm32f7xx.su

.PHONY: clean-Core-2f-Src

