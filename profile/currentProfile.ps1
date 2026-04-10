Clear-Host

Write-Host "    Hello Sir    `n" -BackgroundColor Yellow -ForegroundColor Black
Write-Host "Welcome back to the terminal." -ForegroundColor Cyan
Write-Host "System Memory: $([math]::Round((Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)) GB Free" -ForegroundColor DarkGray

function gs {git status}

function gti {
    Write-Host "hello this is automation for Git commit and push"
$result = git status
$lec = $LASTEXITCODE
# Write-Host "$result ..................................."
if($lec -ne 0){
    Write-Host "Sir this is not a git repository `n `n If you want I can init an empty git repository for you `n please respond with [Y/N]"
    $val = Read-Host "Sir May Initialize an empty git repository in the current repo [Y/N]"
    if($val -eq 'y'){
        git init
        Start-Sleep -Seconds 1
        write-host "Sir Initialize empty repo you can start commiting"
        Start-Sleep -Seconds 1
    }
}
if($result -match "nothing to commit"){
    Write-Host "Sir I found Nothing to commit please make any changes to commit"
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
}
# SEGAKAI
function s {
    Clear-Host
    Set-Location -Path \/works
    $projects = Get-ChildItem
$i = 1
$j = 1
foreach ($project in $projects) {
    # This forces every item to take up exactly 30 characters of terminal space
    $formattedName = $project.Name.PadRight(30)
    if($j -ne $x){
        write-host "$j-[ " -NoNewline

    }
    $x = $j
    Write-Host $formattedName -NoNewline -ForegroundColor Cyan
    
    # Break the line every 3 items
    if ($i % 3 -eq 0) {
        $j++
        Write-Host "`n" # An empty Write-Host creates a perfectly clean new line
    }
    $i++
}

Write-Host ""

}

#KURAMA
function fox{
    params(
        # Parameter help description
        [Parameter(Mandatory = $false)]
        [ValidateSet("github","gemini","gpt","youtube")]
        [string]$url
    )
    if($url -eq "github"){
        Start-Process firefox github.com/shamil-tp
    }elseif ($url -eq "gemini") {
        Start-Process firefox gemini.goolge.com
    }elseif($url -eq "gpt"){
        Start-Process firefox chatgpt.com
    }elseif($url -eq "youtube"){
        Start-Process firefox youtube.com
    }else{
        #validate url here
        Start-Process firefox $url
    }
}