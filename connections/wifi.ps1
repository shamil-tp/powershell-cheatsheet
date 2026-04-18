Get-NetAdapter
# Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
Get-NetConnectionProfile
netsh wlan show profile name="NETWORK_NAME" key=clear
netsh wlan connect name="NETWORK_NAME"