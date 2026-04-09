Write-Host "Hello Sir This Your Reduced System Health Info"
Write-Host " "
Write-Host "=============================================="
Write-Host "=================Health Monit================="
Write-Host "=============================================="

# ==========================================
# SYSTEM HEALTH & HARDWARE MONITOR
# ==========================================

Write-Host "Initiating Hardware Telemetry..." -ForegroundColor Cyan
Write-Host "----------------------------------" -ForegroundColor DarkGray

# --- 1. BATTERY TELEMETRY ---
# Queries the physical battery controller
$battery = Get-CimInstance Win32_Battery

if ($battery) {
    $charge = $battery.EstimatedChargeRemaining
    $status = if ($battery.BatteryStatus -eq 2) { "Plugged In / Charging" } else { "Discharging" }
    
    Write-Host "Power Status:  $status" -ForegroundColor Yellow
    
    # Color-code the percentage based on health
    if ($charge -gt 50) {
        Write-Host "Battery Level: $charge%" -ForegroundColor Green
    } elseif ($charge -gt 20) {
        Write-Host "Battery Level: $charge%" -ForegroundColor Yellow
    } else {
        Write-Host "Battery Level: $charge%" -ForegroundColor Red
    }
} else {
    Write-Host "Power Status: AC Direct (No Battery Detected)" -ForegroundColor Yellow
}

Write-Host "----------------------------------" -ForegroundColor DarkGray

# --- 2. GPU RADAR ---
# Queries the motherboard for all connected video controllers
$gpus = Get-CimInstance Win32_VideoController

foreach ($gpu in $gpus) {
    # We use -match here to specifically look for your RTX card
    if ($gpu.Name -match "RTX") {
        Write-Host "Dedicated GPU: $($gpu.Name)" -ForegroundColor Magenta
        Write-Host "VRAM Status:   Available" -ForegroundColor Magenta
    } else {
        # This catches your Intel integrated graphics
        Write-Host "Integrated:    $($gpu.Name)" -ForegroundColor DarkGray
    }
}

Write-Host "----------------------------------" -ForegroundColor DarkGray
Write-Host "Diagnostics Complete." -ForegroundColor Green