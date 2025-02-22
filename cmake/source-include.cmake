# User sources
file(GLOB_RECURSE USER_SOURCES
    "application/*.*"
)

# User includes
set(USER_INCLUDES
    "application"
    "application/include"
)

# User defines
set(USER_DEFINES
    "APM32F405xx"
    "USE_DAL_DRIVER"
)