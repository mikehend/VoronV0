#!/bin/bash
# Reset CAN Bus on Voron V0
# This script can be copied to the printer and run locally
# Usage: ./reset-canbus.sh

echo "Resetting CAN bus..."

# Bring down the CAN interface
echo "  1. Bringing down can0..."
sudo ip link set can0 down
sleep 2

# Bring up the CAN interface
echo "  2. Bringing up can0..."
sudo ip link set can0 up
sleep 2

# Query for devices
echo "  3. Checking for CAN devices..."
~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0

echo ""
echo "If no devices found, press the RESET button on the EBB36 board, then run:"
echo "  curl -X POST http://localhost:7125/printer/firmware_restart"
