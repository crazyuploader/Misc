#!/usr/bin/env bash

LIST="1.1.1.1 8.8.8.8 128.1.120.194 213.179.210.198 google.com quicksight.ap-south-1.amazonaws.com quicksight.ap-southeast-1.amazonaws.com mumbaispeedtest1.airtel.in speedtestdel.airtelbroadband.in speedtestchn1.airtel.in"

# Get client IP and AS number
CLIENT_IP=$(curl -s http://ifconfig.me)
CLIENT_AS=$(whois "${CLIENT_IP}" | grep -i 'origin' | awk '{print $2}' | head -n 1)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
FIRST_SERVER=$(echo "${LIST}" | awk '{print $1}')
FIRST_SERVER_AS=$(whois "${FIRST_SERVER}" | grep -i 'origin' | awk '{print $2}' | head -n 1)

# Filename with timestamp and AS number
RESULT_FILE="result_${TIMESTAMP}_${FIRST_SERVER_AS}.txt"

echo "=================================="
echo "=== Automatic Ping Test Script ==="
echo "=================================="
echo ""
echo "Client IP: ${CLIENT_IP}"
echo "Client AS Number: ${CLIENT_AS}"
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

# Write header to result file
echo "=============================" >  "${RESULT_FILE}"
echo "=== Output of the Script ====" >> "${RESULT_FILE}"
echo "=============================" >> "${RESULT_FILE}"
echo "Client IP: ${CLIENT_IP}" >> "${RESULT_FILE}"
echo "Client AS Number: ${CLIENT_AS}" >> "${RESULT_FILE}"
echo "Timestamp: ${TIMESTAMP}" >> "${RESULT_FILE}"
echo "" >> "${RESULT_FILE}"

# Ping and Traceroute for each server
for SERVER in ${LIST}; do
    echo "" >> "${RESULT_FILE}"
    echo "Ping/Trace @ ${SERVER}" >> "${RESULT_FILE}"
    echo ""
    ping -c 10 "${SERVER}" | tee -a "${RESULT_FILE}"
    echo ""
    traceroute -A "${SERVER}" | tee -a "${RESULT_FILE}"
    clear
done

clear
echo "Script Finished!"
echo ""
echo "Results are saved in '${RESULT_FILE}' file"
