cmake_minimum_required(VERSION 3.26)

# specify cross-compilers and tools
set(CMAKE_C_STANDARD                11)
set(CMAKE_C_STANDARD_REQUIRED       ON)
set(CMAKE_C_EXTENSIONS              ON)
set(CMAKE_CXX_STANDARD              17)
set(CMAKE_CXX_STANDARD_REQUIRED     ON)
set(CMAKE_CXX_EXTENSIONS            ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS	ON)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# project settings
# Set the project name
set(CMAKE_PROJECT_NAME              apm32-firmware)

# Include toolchain file
include("cmake/gcc-arm-none-eabi.cmake")

# Enable CMake support for ASM and C languages
enable_language(C ASM)

project(${CMAKE_PROJECT_NAME})
message("Build type: " ${CMAKE_BUILD_TYPE})
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/apm32f405xg_flash.ld)

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# MCU specific flags
set(TARGET_FLAGS "-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${TARGET_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb -mthumb-interwork")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffunction-sections -fdata-sections -fno-common -fmessage-length=0")

if (CMAKE_BUILD_TYPE MATCHES Debug)
    message(STATUS "Debug optimization")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g3")
elseif (CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)
    message(STATUS "Maximum optimization for speed, debug info included")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Ofast -g")
elseif (CMAKE_BUILD_TYPE MATCHES Release)
    message(STATUS "Maximum optimization for speed")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Ofast")
elseif (CMAKE_BUILD_TYPE MATCHES MinSizeRel)
    message(STATUS "Maximum optimization for size")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Os -g0")
else ()
    message(STATUS "Minimal optimization, debug info included")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Og -g")
endif ()

set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -x assembler-with-cpp -MMD -MP")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-rtti -fno-exceptions -fno-threadsafe-statics")

set(CMAKE_C_LINK_FLAGS "${TARGET_FLAGS}")

set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -T ${LINKER_SCRIPT}")

set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} --specs=nano.specs")
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--gc-sections")
set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -Wl,--print-memory-usage")

set(CMAKE_CXX_LINK_FLAGS "${CMAKE_C_LINK_FLAGS}")

# Add libraries

# Add APM32 DAL sources and includes
include("cmake/apm32-dal.cmake")

# Link directories setup
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user defined library search paths
)

# Add sources to executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user sources here
    ${APM32_DAL_CORE_SOURCES}
)

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user defined include paths
    ${APM32_DAL_CORE_INCLUDES}
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Add project symbols (macros)
target_compile_definitions(${CMAKE_PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:DEBUG>
    # Add user defined symbols
    ${APM32_DAL_CORE_DEFINES}
)

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME}
    # Add user defined libraries
)
