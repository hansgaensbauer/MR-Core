################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.c \
../Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.c 

OBJS += \
./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.o \
./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.o 

C_DEPS += \
./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.d \
./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/%.o Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/%.su Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/%.cyclo: ../Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/%.c Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F767xx -c -I../Core/Inc -I"C:/Users/hansg/Documents/MIT/Hanlab/MR-Core/firmware/mrc/Drivers/CMSIS/CMSIS_DSP/Include" -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-CommonTables

clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-CommonTables:
	-$(RM) ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.d ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.o ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_common_tables.su ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.d ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.o ./Drivers/CMSIS/CMSIS_DSP/Source/CommonTables/arm_const_structs.su

.PHONY: clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-CommonTables

