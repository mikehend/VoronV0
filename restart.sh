#!/bin/bash
# Restart Voron V0 Firmware
# This script uses the Moonraker API to restart Klipper firmware

PRINTER_IP="192.168.4.127"
MOONRAKER_PORT="7125"
API_URL="http://${PRINTER_IP}:${MOONRAKER_PORT}/printer/firmware_restart"

echo -e "\033[36mRestarting Voron V0 firmware...\033[0m"

response=$(curl -s -X POST "$API_URL")

if [ $? -eq 0 ]; then
    echo -e "\033[32mFirmware restart initiated successfully!\033[0m"
    echo ""
    echo -e "\033[33mKlipper is restarting and loading new configuration...\033[0m"
    echo -e "\033[33mWait a few seconds for firmware to reload, then check printer status.\033[0m"
    echo ""
    echo -e "\033[36mNext steps:\033[0m"
    echo -e "\033[37m1. Verify printer is back online and connected\033[0m"
    echo -e "\033[37m2. Test your changes physically\033[0m"
    echo -e "\033[37m3. If successful, commit to git\033[0m"
else
    echo -e "\033[31mFailed to restart firmware!\033[0m"
    exit 1
fi
