#!/bin/bash
# Deploy Voron V0 Configuration
# This script copies local config files to the printer via SCP

PRINTER_USER="fly"
PRINTER_IP="192.168.4.127"
PRINTER_PATH="/home/fly/printer_data/config"
LOCAL_CONFIG="Config"

echo -e "\033[36mDeploying Voron V0 configuration...\033[0m"

# Copy all files from Config directory to printer
echo -e "\033[33mCopying files from $LOCAL_CONFIG to ${PRINTER_USER}@${PRINTER_IP}:${PRINTER_PATH}/\033[0m"

scp -r "${LOCAL_CONFIG}"/* "${PRINTER_USER}@${PRINTER_IP}:${PRINTER_PATH}/"

if [ $? -eq 0 ]; then
    echo -e "\033[32mDeployment successful!\033[0m"
    echo ""
    echo -e "\033[36mNext steps:\033[0m"
    echo -e "\033[37m1. Run ./restart.sh to restart firmware and load changes\033[0m"
    echo -e "\033[37m2. Test printer physically to verify changes work\033[0m"
    echo -e "\033[37m3. If successful, commit to git: git add . && git commit && git push origin main\033[0m"
else
    echo -e "\033[31mDeployment failed!\033[0m"
    exit 1
fi
