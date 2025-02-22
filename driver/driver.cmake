# sources

if(CONFIG_LED)
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/driver/led.c
    )
    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/driver
    )
endif()

if(CONFIG_MOTOR)
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_SOURCE_DIR}/driver/motor/*.*
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/driver/motor
    )
endif()



