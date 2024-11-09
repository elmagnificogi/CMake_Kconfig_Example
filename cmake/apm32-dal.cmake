# APM32 DAL core sources
file(GLOB_RECURSE APM32_DAL_CORE_SOURCES
    "application/*.*"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal.c"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_cortex.c"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_dma.c"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_gpio.c"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_rcm.c"
    "driver/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_pmu.c"
    "driver/Device/Geehy/APM32F4xx/Source/gcc/startup_apm32f405xx.S"
)

# APM32 DAL core includes
set(APM32_DAL_CORE_INCLUDES
    "application/include"
    "application/config/include"
    "driver/APM32F4xx_DAL_Driver/Include"
    "driver/Device/Geehy/APM32F4xx/Include"
    "driver/CMSIS/Include"
)

# APM32 DAL drivers defines
set(APM32_DAL_CORE_DEFINES
    "APM32F405xx"
    "USE_DAL_DRIVER"
)