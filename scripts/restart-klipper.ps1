# Restart Klipper on Voron V0
# Usage: .\restart-klipper.ps1

$PRINTER_IP = "192.168.4.127"
$PRINTER_USER = "fly"

Write-Host "Restarting Klipper..." -ForegroundColor Cyan
ssh ${PRINTER_USER}@${PRINTER_IP} "curl -X POST http://localhost:7125/printer/firmware_restart"
Write-Host "Klipper restart command sent." -ForegroundColor Green
