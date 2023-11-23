
#! /bin/bash
today=$(date +%Y%m%d)
weather_report=raw_data_$today

curl wttr.in/casablanca --output $weather_report

grep °C $weather_report > temperatures.txt

# extract the current temperature
obs_temp=$(head -1 temperatures.txt | grep -oE [0-9]+ | head -8 | tail -1)
echo "Current Temperature: $obs_temp"

# extract the forecast for noon tomorrow
fc_temp=$(head -2 temperatures.txt | tail -1 | grep -oE '[0-9]+' | head -18 | tail -1)
echo "Forecast Temperature: $fc_temp"

#Store the current hour, day, month, and year in corresponding shell variables
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

#append data to a log file
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp")
echo $record>>daily_today_and_tomm_temp.log

#In crontab file, for script scheduling
#crontab -e
#0 8 * * * /home/project/rx_poc.sh