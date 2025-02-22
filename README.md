# CMake Kconfig Example

## Directory Structure

- `.config`: Generated configuration file.
- `.config.old`: Previous configuration file.
- `.gitignore`: Git ignore file.
- `.vscode/`: VSCode configuration directory.
- `application/`: Application source code.
- `autoconf.h`: Generated header file with configuration macros.
- `build/`: Build directory.
- `cmake/`: CMake configuration files.
- `CMakeLists.txt`: Top-level CMake configuration file.
- `driver/`: Driver source code.
- `kconfig.cmake`: CMake module for Kconfig.
- `kconfig.h`: Header file for Kconfig.
- `kconfigLog.txt`: Log file for Kconfig.
- `module/`: Module source code.
- `platform/`: Platform-specific source code.
- `README.md`: This file.
- `rtos/`: RTOS source code.
- `tools/`: Tools for Kconfig.

## Dependencies
- [MinGW64](https://github.com/niXman/mingw-builds-binaries/releases)
- [CMake](https://cmake.org/)
- [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
- [Kconfiglib](https://github.com/ulfalizer/Kconfiglib)
- [python3](https://www.python.org/)

## Recommended Tools

- [J-Link Software and Documentation Pack](https://www.segger.com/downloads/jlink/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Cortex-Debug](https://marketplace.visualstudio.com/items?itemName=marus25.cortex-debug)
- [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools)

## Getting Started

Ensure that all dependencies are installed on your system and that environment variables are properly set up. And then follow the steps below to build the project.
You can using the following commands to build the project. Also, you can use the CMake Tools extension in Visual Studio Code to build the project.

### Clone the repository

```bash
git clone
```

### Generate the header file
Config project
```
python -m guiconfig
```

You can generate the header file using the following CMake custom target.

```bash
python tools/kconfig.py Kconfig .config autoconf.h kconfigLog.txt .config
```

### Make the project

You can make the project again using the following CMake custom target.

```bash
cmake --build build/Debug --target project-debug-make
```

### Build the project

You can build the project using the following CMake custom target.

```bash
cmake --build build/Debug --target project-debug-build
```

### Debug the project

Using the JLink launch configuration in the .vscode directory to debug the project. Open the project in Visual Studio Code and press F5 to start debugging.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Cortex Debug with J-Link",
            "cwd": "${workspaceRoot}",
            "executable": "./build/Debug/apm32-firmware.elf", // Change the executable path
            "request": "launch",
            "type": "cortex-debug",
            "servertype": "jlink",
            "device": "APM32F405RG",
            "interface": "swd",
            "svdFile": "./svd/APM32F40x.svd",
        },
    ]
}
```

### Ref
> https://github.com/LuckkMaker/apm32-kconfig-example