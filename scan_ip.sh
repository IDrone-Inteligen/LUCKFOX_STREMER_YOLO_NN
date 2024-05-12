#!/bin/bash
for ip in $(seq 1 255); do nc -zv 192.168.1.$ip 22 -w 1 &>/dev/null && echo "192.168.1.$ip: SSH OPEN" || echo "192.168.1.$ip: SSH CLOSED"; done

# for device in `adb devices | awk '{print $1}'`; do
#   if [ ! "$device" = "" ] && [ ! "$device" = "List" ]
#   then
#     echo " "
#     echo "adb -s $device $@"
#     echo "------------------------------------------------------"
#     adb -s $device $@
#   fi
# done