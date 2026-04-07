Write-Host "hello this is automation for Next Js"
Set-Location ../
$result = git status

if ($result) {
    <# Action to perform if the condition is true #>
    git add .
    git commit -m "new commit"
}else {
    Write-Host "noting to commit"
}
Set-Location .\NextJs