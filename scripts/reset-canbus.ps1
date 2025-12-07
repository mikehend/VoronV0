# Reset CAN Bus on Voron V0
# Run this script when the EBB36 toolhead is not responding
# Usage: .\reset-canbus.ps1

$PRINTER_IP = "192.168.4.127"
$PRINTER_USER = "fly"

Write-Host "Resetting CAN bus on Voron V0..." -ForegroundColor Cyan

# Bring down the CAN interface
Write-Host "  1. Bringing down can0..." -ForegroundColor Yellow
ssh ${PRINTER_USER}@${PRINTER_IP} "sudo ip link set can0 down"

# Wait a moment
Start-Sleep -Seconds 2

# Bring up the CAN interface
Write-Host "  2. Bringing up can0..." -ForegroundColor Yellow
ssh ${PRINTER_USER}@${PRINTER_IP} "sudo ip link set can0 up"

# Wait for interface to stabilize
Start-Sleep -Seconds 2

# Query for devices
Write-Host "  3. Checking for CAN devices..." -ForegroundColor Yellow
$result = ssh ${PRINTER_USER}@${PRINTER_IP} "~/klippy-env/bin/python ~/klipper/scripts/canbus_query.py can0"

Write-Host ""
Write-Host "CAN Bus Query Result:" -ForegroundColor Green
Write-Host $result

if ($result -match "Total 0 uuids found") {
    Write-Host ""
    Write-Host "WARNING: No CAN devices found!" -ForegroundColor Red
    Write-Host "You need to press the RESET button on the EBB36 board physically." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "After pressing reset, run this script again or restart Klipper with:" -ForegroundColor Yellow
    Write-Host "  .\restart-klipper.ps1" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "CAN bus is working! Restarting Klipper..." -ForegroundColor Green
    ssh ${PRINTER_USER}@${PRINTER_IP} "curl -X POST http://localhost:7125/printer/firmware_restart"
    Write-Host "Klipper restarted successfully." -ForegroundColor Green
}
