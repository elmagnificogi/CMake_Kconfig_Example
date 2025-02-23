# sources
if(CONFIG_FLASH)
    message(STATUS "Flash module is enabled")
    file(GLOB_RECURSE DRIVER_SOURCES
        # 加入文件夹
        ${CMAKE_CURRENT_LIST_DIR}/Flash/*.*
    )
    target_sources(${CMAKE_PROJECT_NAME} PRIVATE ${DRIVER_SOURCES})

    # include
    target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
        ${CMAKE_CURRENT_LIST_DIR}/Flash
    )
endif()

# 引入当前路径下的所有CMake文件
message(STATUS "CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")
file(GLOB CMAKE_FILES "${CMAKE_CURRENT_LIST_DIR}/*/*.cmake")
foreach(CMAKE_FILE ${CMAKE_FILES})
    include(${CMAKE_FILE})
endforeach()

# 引入当前路径下的所有子目录中的CMakeLists.txt文件
file(GLOB SUBDIRS RELATIVE ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_CURRENT_LIST_DIR}/*)
foreach(SUBDIR ${SUBDIRS})
    if(IS_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/${SUBDIR})
        if(EXISTS ${CMAKE_CURRENT_LIST_DIR}/${SUBDIR}/CMakeLists.txt)
            add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/${SUBDIR})
        endif()
    endif()
endforeach()

