# Get-NetAdapter
# Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
# Get-NetConnectionProfile
# netsh wlan show profile name="NETWORK_NAME" key=clear
# netsh wlan connect name="NETWORK_NAME"

# $name = netsh wlan show profile
# $filterName = ($name -match "    All User Profile     : (\w+)") -split "    All User Profile     : "
# foreach($i in $filterName){
#     $output = netsh wlan show profile name=$i key=clear
#     $password = $output | Select-String "Key Content"
#     $filteredPassword = ($password -split ":")[1].Trim()
#     Write-Host "NAME: $i `nPASSWORD: $filteredPassword`n"
# }


$profiles = netsh wlan show profiles

$names = $profiles | Select-String "All User Profile" | ForEach-Object {
    ($_ -split ":")[1].Trim()
}

foreach ($name in $names) {
    $details = netsh wlan show profile name="$name" key=clear

    $passwordLine = $details | Select-String "Key Content"
    $password = if ($passwordLine) {
        ($passwordLine -split ":")[1].Trim()
    } else {
        "No password / Open network"
    }

    Write-Host "NAME: $name"
    Write-Host "PASSWORD: $password"
    Write-Host ""
}
