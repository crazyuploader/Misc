Write-Output ""
Write-Output " ##############################################"
Write-Output " ########                              ########"
Write-Output " ########  Automatic Ping Test Script  ########"
Write-Output " ########                              ########"
Write-Output " ##############################################"
Write-Output ""
Write-Output ""
Write-Output "Going to ping the following servers -"
Write-Output ""
$Servers = "1.1.1.1", "8.8.8.8", "75.2.66.166", "128.1.120.194", "google.com", "quicksight.ap-south-1.amazonaws.com", "quicksight.ap-southeast-1.amazonaws.com", "mumbaispeedtest1.airtel.in", "speedtestggn1.airtel.in", "speedtestchn1.airtel.in"
foreach ($Server in $Servers) {
    Write-Output $Server
}
Start-Sleep 5
Write-Output "#############################################################" > result.txt
Write-Output "########=====OUTPUT======OF======THE======SCRIPT=====########" >> result.txt
Write-Output "#############################################################" >> result.txt
Clear-Host
Write-Output "Starting Ping Test..."
Start-Sleep 2
Write-Output ""
foreach ($Server in $Servers) {
    Write-Output "Ping @ $Server"
    ping -n 10 $Server | Tee-Object -a result.txt
    tracert $Server | Tee-Object -a result.txt
    Clear-Host
}
Write-Output "Script Finished!"
Write-Output ""
Write-Output "Results are saved in 'result.txt' file"
Write-Output ""
pause 1
