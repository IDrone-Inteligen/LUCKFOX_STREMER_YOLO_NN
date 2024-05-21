#!/bin/bash

# Получаем список подключенных устройств, исключая первую строку (заголовок)
CONNECTED_DEVICES=$(adb devices | grep -v List | awk '{print $1}')

# Проверяем, есть ли подключенные устройства
if [ -z "$CONNECTED_DEVICES" ]; then
    echo "No devices found. Please connect a device."
    exit 1
fi

# Работаем с каждым устройством
for DEVICE in $CONNECTED_DEVICES; do
    echo "Working with device: $DEVICE"
    # Здесь можно добавить другие команды ADB для работы с устройством
    # Например, устанавливаем приложение:
    # adb -s $DEVICE install path_to_your_app.apk
done