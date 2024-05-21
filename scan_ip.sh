#!/bin/bash
for ip in $(seq 1 255); do nc -zv 192.168.1.$ip 22 -w 1 &>/dev/null && echo "192.168.1.$ip: SSH OPEN" || echo "192.168.1.$ip: SSH CLOSED"; done

# # Задаём стандартный порт ADB, который обычно равен 5555
# PORT=5555

# # Сканируем подсеть на предмет активных устройств с открытым ADB портом (это пример для подсети 192.168.1.x)
# for IP in $(seq 1 254); do
#     # Пытаемся подключиться к каждому IP в подсети
#     ADB_CONNECT=$(adb connect 192.168.1.$IP:$PORT 2>&1)
    
#     # Проверяем результат подключения
#     if [[ "$ADB_CONNECT" =~ "connected to" ]]; then
#         echo "Successfully connected to 192.168.1.$IP"
#     elif [[ "$ADB_CONNECT" =~ "unable to connect" ]]; then
#         echo "Unable to connect to 192.168.1.$IP"
#     fi
# done