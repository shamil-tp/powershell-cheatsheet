while($true){
$time = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
"Heart-Beat:$time" | Out-File -FilePath heartbeat.log -Append
Start-Sleep -Seconds 5
}
