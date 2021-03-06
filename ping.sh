#!/usr/bin/env bash

LIST="1.1.1.1 8.8.8.8 128.1.120.194 213.179.210.198 google.com quicksight.ap-south-1.amazonaws.com quicksight.ap-southeast-1.amazonaws.com mumbaispeedtest1.airtel.in speedtestdel.airtelbroadband.in speedtestchn1.airtel.in"

echo "=================================="
echo "=== Automatic Ping Test Script ==="
echo "=================================="
echo ""
echo ""
echo "Going to Ping/Trace Following Server(s) -"
echo ""
for SERVER in ${LIST}; do
    echo "${SERVER}"
done
sleep 5
clear
echo "Starting Ping Test..."
sleep 2
clear
echo "=============================" >  result.txt
echo "=== Output of the Script ====" >> result.txt
echo "=============================" >> result.txt
for SERVER in ${LIST}; do
    echo "" >> result.txt
    echo "Ping/Trace @ ${SERVER}"
    echo ""
    ping -c 10 "${SERVER}" | tee -a result.txt
    echo ""
    echo "" >> result.txt
    traceroute -A "${SERVER}" | tee -a result.txt
    clear
done
clear
echo "Script Finished!"
echo ""
echo "Results are saved in 'result.txt' file"
