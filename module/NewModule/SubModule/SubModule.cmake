message(STATUS "SubModule Add")
# sources
if(CONFIG_SUBMODULE)
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_LIST_DIR}/*
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_LIST_DIR}
    )
endif()



