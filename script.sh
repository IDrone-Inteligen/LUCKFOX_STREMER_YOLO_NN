#!/bin/bash

# Переменные
DEVICE_IP="192.168.1.233"
DEVICE_PORT="5555"
PROGRAM_NAME="LUCKFOX_NN"
PROGRAM_FOLDER="LUCKFOX_NN"

# Устанавливаем путь к SDK
export LUCKFOX_SDK_PATH=~/LUCKFOX/luckfox-pico-main

# Создаем директорию для сборки и переходим в нее
mkdir -p build
cd build || exit 1

# Конфигурируем проект с помощью CMake
cmake .. || exit 1

# Собираем проект, используя все доступные ядра
make -j || exit 1

# Выполняем установку (проверьте, куда она происходит)
make install || exit 1

# Возвращаемся в начальную директорию
cd ..

# sftp root@192.168.1.233 <<< $'put -r luckfox_rtsp_yolov5_demo'
# scp -r $PROGRAM_FOLDER root@192.168.1.233:/root

# Выполняем запуск программы на утройстве
adb connect $DEVICE_IP:$DEVICE_PORT
adb -s $DEVICE_IP:$DEVICE_PORT push $PROGRAM_FOLDER \root
adb -s $DEVICE_IP:$DEVICE_PORT shell "cd /root/$PROGRAM_FOLDER; RkLunch-stop.sh; ./$PROGRAM_NAME;"
adb disconnect