# Deploy Voron V0 Configuration
# This script copies local config files to the printer via SCP

$PRINTER_USER = "fly"
$PRINTER_IP = "192.168.4.127"
$PRINTER_PATH = "/home/fly/printer_data/config"
$LOCAL_CONFIG = "Config"

Write-Host "Deploying Voron V0 configuration..." -ForegroundColor Cyan

# Copy all files from Config directory to printer
Write-Host "Copying files from $LOCAL_CONFIG to ${PRINTER_USER}@${PRINTER_IP}:${PRINTER_PATH}/" -ForegroundColor Yellow

scp -r "${LOCAL_CONFIG}/*" "${PRINTER_USER}@${PRINTER_IP}:${PRINTER_PATH}/"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Deployment successful!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Run .\restart.ps1 to restart firmware and load changes" -ForegroundColor White
    Write-Host "2. Test printer physically to verify changes work" -ForegroundColor White
    Write-Host "3. If successful, commit to git: git add . && git commit && git push origin main" -ForegroundColor White
} else {
    Write-Host "Deployment failed!" -ForegroundColor Red
    exit 1
}
