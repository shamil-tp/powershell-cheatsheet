$FileName = Read-Host "enter your file name"
# New-Item -ItemType File -Name "$FileName.txt" 
New-Item -ItemType File -Name "$FileName.txt" -Value "This is the text inside my file!"
Write-Host "Created $FileName.txt Please check your folder"