# =========================================================
# 1. THE ENGINE (Your custom reusable tool)
# =========================================================
function Install-MyTask {
    param(
        [Parameter(Mandatory=$true)]
        [string]$path,

        [Parameter(Mandatory=$true)]
        [string]$taskName,

        [Parameter(Mandatory=$true)]
        $Trigger 
    )
    
    Write-Host "Building task: $taskName..." -ForegroundColor Cyan

    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -NoProfile -NonInteractive -File `"$path`""
    $badge = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType S4U -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $Trigger -Principal $badge -Settings $settings -Force

    Write-Host "Task '$taskName' successfully installed!" -ForegroundColor Green
}

# =========================================================
# 2. THE EXECUTION (Where you actually fire the tool)
# =========================================================

# Build the specific trigger
$weeklyTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 2:00AM

# Hand it to your function
Install-MyTask -path "C:\works\LogSweeper.ps1" -taskName "SundaySweeper" -Trigger $weeklyTrigger