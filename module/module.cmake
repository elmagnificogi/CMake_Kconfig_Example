# sources
if(CONFIG_FLASH)
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_SOURCE_DIR}/module/Flash/*.*
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_SOURCE_DIR}/module/Flash
    )
endif()



