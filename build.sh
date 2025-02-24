#!/bin/bash

# 提示用户选择预设
echo "请选择一个预设:"
options=("Debug" "Release" "Test")

# 设置自定义提示符
PS3="请输入选项编号: "

select opt in "${options[@]}"
do
    case $opt in
        "Debug"|"Release"|"Test")
            PRESET=$opt
            break
            ;;
        *) echo "无效选项 $REPLY";;
    esac
done

echo "您选择了 $PRESET, 开始构建项目...请先确认config变换"

CONFIG_FILE="./$PRESET.config"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "配置文件 $CONFIG_FILE 不存在，创建一个空白文件..."
    touch "$CONFIG_FILE"
fi

# change project properties
export KCONFIG_CONFIG=./$PRESET.config
python -m guiconfig
# generate .config file
echo "生成config文件..."
python tools/kconfig.py Kconfig $PRESET.config autoconf.h kconfigLog.txt $PRESET.config
# create a build directory and make project
echo "创建预设目录..."
cmake --preset $PRESET
# build project
echo "开始build..."
cmake --build --preset $PRESET