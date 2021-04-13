function TestConnect 
{
    netsh wlan disconnect
    netsh wlan connect name="eduroam"
    Get-Date
    ping 8.8.8.8
    TestConnect
}

Testconnect
