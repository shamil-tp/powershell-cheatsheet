Clear-Host

Write-Host "Hello Sir This Your Reduced System Health Info"
Write-Host " "
Write-Host "=============================================="
Write-Host "================ Health Monit ================"
Write-Host "=============================================="
Write-Host "`n"

Write-Host "    BATTERY STATUS  " -ForegroundColor Black -BackgroundColor White
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

Write-Host "`n"
Write-Host "    GPU STATUS  " -ForegroundColor Black -BackgroundColor White

$gpus = Get-CimInstance Win32_VideoController
write-host "Total Number of Graphics Cards: $($gpus.Count)" -ForegroundColor DarkMagenta

foreach ($gpu in $gpus) {
    if ($gpu.Name -match "RTX") {
        Write-Host "Dedicated GPU: $($gpu.Name)" -ForegroundColor Magenta
        Write-Host "VRAM Status:   Available" -ForegroundColor Magenta
    } else {
        Write-Host "Integrated:    $($gpu.Name)" -ForegroundColor DarkGray
    }
}

Write-Host "----------------------------------" -ForegroundColor DarkGray
Write-Host "`n"

Write-Host "    RAM STATUS  " -ForegroundColor Black -BackgroundColor White

$rams = Get-CimInstance Win32_PhysicalMemory
write-host "Total Number of RAM Cards: $($rams.Count)" -ForegroundColor DarkMagenta
$i = 1
$totalRam = 0
foreach($ram in $rams){
    Write-Host "RAM $i" -ForegroundColor Yellow
    Write-Host "Manufacturer: $($ram.Manufacturer)" -ForegroundColor Green
    Write-Host "SerialNumber: $($ram.SerialNumber)" -ForegroundColor Green
    Write-Host "Capacity: $($ram.Capacity / 1GB) GB" -ForegroundColor DarkRed
    Write-Host " "
    $i++
    $totalRam = $totalRam + ($ram.Capacity / 1GB)
}
Write-Host "Total RAM of Device: $totalRam GB" -ForegroundColor Cyan

Write-Host "----------------------------------" -ForegroundColor DarkGray
Write-Host "`n"

Write-Host "    PROCESSOR INFO  " -ForegroundColor Black -BackgroundColor White

$processors = Get-CimInstance Win32_Processor
# write-host "Total Number of Processors: $($processors.Count)" -ForegroundColor DarkMagenta
$i = 1
foreach($processor in $processors){
    Write-Host "Processor $i" -ForegroundColor Yellow
    Write-Host "Name: $($processor.Name)" -ForegroundColor Green
    Write-Host "Clock Speed Max: $($processor.MaxClockSpeed / 1000)" -ForegroundColor Green
    Write-Host "Manufacturer: $($processor.Manufacturer)" -ForegroundColor DarkCyan
    Write-Host " "
    $i++
}

Write-Host "----------------------------------" -ForegroundColor DarkGray
Write-Host "Diagnostics Complete." -ForegroundColor Green

while ($true) {
    $freq = (Get-Counter '\Processor Information(_Total)\Processor Frequency').CounterSamples.CookedValue
    $ghz = [math]::Round($freq / 1000, 2)

    $scaled = [int]($ghz * 10)

    $bars  = "#" * $scaled
    $lines = "-" * (40 - $scaled)

    $output = "CPU: $ghz GHz [$bars$lines]"

    Write-Host "`r$output" -NoNewline

    Start-Sleep -Milliseconds 500
}