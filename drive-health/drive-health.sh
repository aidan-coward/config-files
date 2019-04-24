#!/bin/bash
# this script is passed a uuid and runs a smart

main_fn () {

	uuid="$1"
	disk="/dev/disk/by-uuid/$uuid"
	time="$(smartctl -c $disk | grep -A 1 Extended | awk "NR==2{print;exit}" | sed 's/[^0-9]*//g')"
	log_file="/home/aidan/documents/linux/arch/log-files/drive-health/drive-health-$(date +%Y-%m-%d)-$uuid.log"
	report_file="/home/aidan/documents/linux/arch/log-files/drive-health/drive-health-$(date +%Y-%m-%d)-$uuid-report.log"
	wait_time="num=$(($time + 5))"


	echo "uuid of the disk is $uuid"
	echo "wait time is: $wait_time minutes"
	echo "log file will be $log_file"
	
	echo "creating log file"
	touch "$log_file"
	echo "changing owner of log file"
	chown aidan "$log_file"
	
	echo "Starting SMART long test"
	smartctl -t long $disk
	
	echo "waiting for test to finish"
	sleep "$time"m
	
	echo "copying overall health to file"
	echo "Overall health of disk:" >> $log_file
	smartctl -H $disk
	
	echo "copying test results to log file"
	echo "smartctl -l selftest $disk" >> $log_file
	smartctl -l selftest $disk >> $log_file
	
	echo "smartctl -a $disk" >> $log_file
	smartctl -a $disk >> $log_file
	
	echo "copying important results to report file"
	echo "A value greater than 0 in any of these fields is a possible indicator of impending drive failure" >> $report_file
	grep -E "Reallocated_Sector_Ct|Reported_Uncorrect|Command_Timeout|Reallocated_Event_Ct|Current_Pending_Sector|Offline_Uncorrectable|Soft_Read_Error_Rate" $log_file | awk '{print $1,$2,$10}' >> $report_file
	
	echo "emailing test results"
	mail -s "drive health report '$(date +%Y-%m-%d)'" aidan.coward@gmail.com < $report_file
}

echo "making list of uuids"
uuid_list="$(lsblk -o NAME,UUID | grep 'sd[a-z]1' | cut -c12- | tr '\n' ' ')"

echo "putting uuids into array"
uuid_list_array=(${uuid_list})

echo "running function for each uuid"
for current_uuid in "${uuid_list_array[@]}";
do
	main_fn $current_uuid
done

