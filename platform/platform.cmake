# sources
if(CONFIG_APM32F405)
    message(STATUS "CONFIG_APM32F405")
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/config/*.*
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_cortex.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_dma.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_gpio.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_rcm.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Source/apm32f4xx_dal_pmu.c
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/Device/Geehy/APM32F4xx/Source/gcc/startup_apm32f405xx.S
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/config/include
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/APM32F4xx_DAL_Driver/Include
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/Device/Geehy/APM32F4xx/Include
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/apm32f405/CMSIS/Include
    )

    set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/platform/apm32f405/config/apm32f405xg_flash.ld)
endif()

if(CONFIG_STM32F103)
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/stm32f103/*.*
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/platform/stm32f103
    )
endif()

