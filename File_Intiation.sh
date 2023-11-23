#Create log file and write header row
touch daily_today_and_tomm_temp.log

header=$(echo "year  month  day  obs_temp  fc_temp")
echo $header >> daily_today_and_tomm_temp.log


