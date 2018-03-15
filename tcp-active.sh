#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#echo $(date +%Y-%m-%d)
printf "%-20s %-10s %-10s %10s %-8s" 时间 发送报文数 接受报文数 总数 关系 
echo ""
while true
do 
    a=1
    recieve_message=$(netstat -t -s | awk 'NR==10 {print $1}')
    send_message=$(netstat -t -s | awk 'NR==11 {print $1}')
    total_message=`expr $recieve_message + $send_message`
    if [ "$recieve_message" -lt "$send_message" ]
    then
	more='+'
    else
	more='-'
    fi
    date=$(date +%Y-%m-%d\ %H:%M)
    printf "%-20s %-10s %-10s %-10s %-1s" "$date" "$send_message" "$recieve_message" "$total_message" "$more"
    echo ""
    sleep 60
done
