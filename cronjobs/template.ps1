# function tem{
#     # 1. The Action
# $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -WindowStyle Hidden -NoProfile -NonInteractive -File C:\works\FinalTask\runner.ps1"

# # 2. The Trigger (Runs every day at 9:00 AM)
# $trigger = New-ScheduledTaskTrigger -Daily -At 9:00AM

# # 3. The Identity (Runs completely silently under your profile)
# $badge = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType S4U -RunLevel Highest

# # 4. The Laptop Fix (Runs even if unplugged)
# $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

# # 5. Lock it into Windows
# Register-ScheduledTask -TaskName "MyFinalTask" -Action $action -Trigger $trigger -Principal $badge -Settings $settings -Force

# Write-Host "Task successfully and permanently installed." -ForegroundColor Green
# }

function hello {
    param (
        [string]$name
    )
    if($name){
        Write-Host "hello $name funcitioning works"
    }
    else{
        Write-Host "please enter a name"
    }
    
}

$n = Read-Host "enter your name"

hello($n)