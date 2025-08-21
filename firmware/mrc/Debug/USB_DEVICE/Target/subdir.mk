################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB_DEVICE/Target/usbd_conf.c 

OBJS += \
./USB_DEVICE/Target/usbd_conf.o 

C_DEPS += \
./USB_DEVICE/Target/usbd_conf.d 


# Each subdirectory must supply rules for building sources it contributes
USB_DEVICE/Target/%.o USB_DEVICE/Target/%.su USB_DEVICE/Target/%.cyclo: ../USB_DEVICE/Target/%.c USB_DEVICE/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DARM_MATH_CM7 -DUSE_HAL_DRIVER -DSTM32F767xx -c -I../Core/Inc -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/Core/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/Core_A/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.9.0/CMSIS/DSP/Include" -I"C:/Users/hansg/STM32Cube/Repository/Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include/" -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core_A/Include/ -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.1/Drivers/CMSIS/Include -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/ -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/ -IC:/Users/hansg/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/smrdrox/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core/Include/ -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/Core_A/Include/ -IC:/Users/smrdrox/STM32Cube/Repository//Packs/ARM/CMSIS/5.4.0/CMSIS/DSP/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Device/ST/STM32F7xx/Include -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Core/Inc -IC:/Users/hansg/STM32Cube/Repository/STM32Cube_FW_F7_V1.17.2/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-USB_DEVICE-2f-Target

clean-USB_DEVICE-2f-Target:
	-$(RM) ./USB_DEVICE/Target/usbd_conf.cyclo ./USB_DEVICE/Target/usbd_conf.d ./USB_DEVICE/Target/usbd_conf.o ./USB_DEVICE/Target/usbd_conf.su

.PHONY: clean-USB_DEVICE-2f-Target

