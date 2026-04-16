$time = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
"The scheduled task ran flawlessly at: $time" | Out-File -FilePath "C:\works\test.txt" -Append