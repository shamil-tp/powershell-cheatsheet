while ($true) {
    $time = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    
    # HARDCODED ABSOLUTE PATH
    "Heart-Beat: $time" | Out-File -FilePath "C:\works\ps_is_no_bs\heartbeat.log" -Append
    
    Start-Sleep -Seconds 5
}