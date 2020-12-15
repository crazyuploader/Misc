echo ""
echo " ##############################################"
echo " ########                              ########"
echo " ########  Automatic Ping Test Script  ########"
echo " ########                              ########"
echo " ##############################################"
echo ""
echo ""
echo "Going to ping the following servers -"
echo ""
echo "1.1.1.1"
echo "8.8.8.8"
echo "75.2.66.166"
echo "google.com"
echo "quicksight.ap-south-1.amazonaws.com"
echo "quicksight.ap-southeast-1.amazonaws.com"
echo "13.76.131.0"
sleep 5
echo "#############################################################" > result.txt
echo "########=====OUTPUT======OF======THE======SCRIPT=====########" >> result.txt
echo "#############################################################" >> result.txt
clear
echo "Starting Ping Test..."
sleep 2
echo ""
echo "Ping @ 1.1.1.1"
ping -n 10 1.1.1.1 | tee -a result.txt
echo ""
clear
echo "Ping @ 8.8.8.8"
ping -n 10 8.8.8.8 | tee -a result.txt
echo ""
clear
echo "Ping @ 75.2.66.166"
ping -n 10 75.2.66.166 | tee -a result.txt
echo ""
clear
echo "Ping @ google.com"
ping -n 10 google.com | tee -a result.txt
echo ""
clear
echo "Ping @ quicksight.ap-south-1.amazonaws.com"
ping -n 10 quicksight.ap-south-1.amazonaws.com | tee -a result.txt
echo ""
clear
echo "Ping @ quicksight.ap-southeast-1.amazonaws.com"
ping -n 10 quicksight.ap-southeast-1.amazonaws.com | tee -a result.txt
echo ""
clear
echo "Ping @ 13.76.131.0"
ping -n 10 13.76.131.0 | tee -a result.txt
echo ""
clear
echo "Script Finished!"
echo ""
echo "Results are saved in 'result.txt' file"
echo ""
pause 1