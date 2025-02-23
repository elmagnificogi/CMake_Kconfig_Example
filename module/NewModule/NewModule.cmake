message(STATUS "NewModule Add")
# sources
if(CONFIG_NewModule)
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

# 引入当前路径下的所有CMake文件
message(STATUS "CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")
file(GLOB CMAKE_FILES "${CMAKE_CURRENT_LIST_DIR}/*/*.cmake")
foreach(CMAKE_FILE ${CMAKE_FILES})
    include(${CMAKE_FILE})
endforeach()

