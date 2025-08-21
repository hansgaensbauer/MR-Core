################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.c \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.c 

S_UPPER_SRCS += \
../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal2.S 

OBJS += \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal2.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.o \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.o 

S_UPPER_DEPS += \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal2.d 

C_DEPS += \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.d \
./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.o Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.su Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.cyclo: ../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.c Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F767xx -c -I../Core/Inc -I"C:/Users/hansg/Documents/MIT/Hanlab/MR-Core/firmware/mrc/Drivers/CMSIS/CMSIS_DSP/Include" -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.o: ../Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/%.S Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-TransformFunctions

clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-TransformFunctions:
	-$(RM) ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal2.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_bitreversal2.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_init_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix2_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_init_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix4_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_cfft_radix8_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.d
	-$(RM) ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_init_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_dct4_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_fast_init_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_f32.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_init_q31.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q15.su ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.cyclo ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.d ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.o ./Drivers/CMSIS/CMSIS_DSP/Source/TransformFunctions/arm_rfft_q31.su

.PHONY: clean-Drivers-2f-CMSIS-2f-CMSIS_DSP-2f-Source-2f-TransformFunctions

