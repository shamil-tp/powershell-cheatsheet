Write-Host "hello this is automation for Next Js"
Set-Location ../
$result = git status

if($result -match "nothing to commit"){
    Write-Host "Sir I found Nthing to commit please make any changes to commit"
}else{
    git status
    Start-Sleep -Seconds 1
    Write-Host "Staging Changes for commiting" -ForegroundColor Yellow
    git add .
    
    Start-Sleep -Seconds 1
    Write-Host "Commiting Staged Changes" -ForegroundColor Yellow
    $message = Read-Host "Please Enter A Message for commiting: " -ForegroundColor Blue
    git commit -m "$message"
    
    $query = Read-Host "Sir Do you want to push this to the remote Now ? [Y/N]"

    if($query -eq "Y"){
        Start-Sleep -Seconds 1
        Write-Host "Pushing to Remote" -ForegroundColor Yellow
        git push -u origin main
    }
    
}
Set-Location .\NextJs