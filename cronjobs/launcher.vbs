Set objShell = CreateObject("Wscript.Shell")
' The 0 at the end forces absolute invisibility. The False means "don't wait for it to finish"
objShell.Run "powershell.exe -ExecutionPolicy Bypass -NoProfile -NonInteractive -File ""C:\works\ps_is_no_bs\cheatsheet\cronjobs\hello.ps1""", 0, False