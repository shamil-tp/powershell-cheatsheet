# Turn on the flight recorder and save the output
Start-Transcript -Path "C:\works\ps_is_no_bs\cheatsheet\cronjobs\debug-log.txt" -Force

# Force errors to actually crash the script so we can catch them
$ErrorActionPreference = "Stop"

# Your exact original code
Get-Date | Out-File -FilePath "C:\works\ps_is_no_bs\cheatsheet\cronjobs\test.txt" -Append

# Turn off the recorder
Stop-Transcript