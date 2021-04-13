function RunUntilConnected
{
    $Connected = Test-NetConnection -Computername google.nl -InformationLevel Quiet -WarningAction SilentlyContinue
    if ($Connected -ne "True") 
        {
            RunUntilConnected
        }
}


function testconnection
{
    netsh wlan connect name = "eduroam"
    $stopwatch =  [system.diagnostics.stopwatch]::StartNew()
    RunUntilConnected
    $ConnectTime = $stopwatch.ElapsedMilliseconds
    $TimeStamp = Get-Date -format "dd-MMM-yyyy HH:mm"
    $ExportTime = $TimeStamp + ";" + $ConnectTime
    Write-Host "Last Connection Time"
    Write-Host $ExportTime
    $ExportTime | out-file –append –filepath $PSScriptRoot\ConnectionTimes.csv
    netsh wlan disconnect
    testconnection
}

testconnection

