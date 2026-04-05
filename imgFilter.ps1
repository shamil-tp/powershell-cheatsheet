$myImages = Get-ChildItem -Path "$env:USERPROFILE\Downloads" -Filter "*.jpg"
$targetFileName = Read-Host "enter the folder name please"
$targetLocation = "$env:USERPROFILE\Downloads"

New-Item -Path $targetLocation -Name "$targetFileName" -ItemType Directory -Force

foreach($file in $myImages){
	Move-Item -Path $file.FullName -Destination "$env:USERPROFILE\Downloads\$targetFileName"
	Write-Host "Moved: $($file.Name)" -ForegroundColor Green
}
Write-Host "Image cleanup for jpg completed" -ForegroundColor Cyan