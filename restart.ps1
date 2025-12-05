# Restart Voron V0 Firmware
# This script uses the Moonraker API to restart Klipper firmware

$PRINTER_IP = "192.168.4.127"
$MOONRAKER_PORT = "7125"
$API_URL = "http://${PRINTER_IP}:${MOONRAKER_PORT}/printer/firmware_restart"

Write-Host "Restarting Voron V0 firmware..." -ForegroundColor Cyan

try {
    $response = Invoke-RestMethod -Uri $API_URL -Method Post
    Write-Host "Firmware restart initiated successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Klipper is restarting and loading new configuration..." -ForegroundColor Yellow
    Write-Host "Wait a few seconds for firmware to reload, then check printer status." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Verify printer is back online and connected" -ForegroundColor White
    Write-Host "2. Test your changes physically" -ForegroundColor White
    Write-Host "3. If successful, commit to git" -ForegroundColor White
} catch {
    Write-Host "Failed to restart firmware!" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    exit 1
}
