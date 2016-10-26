#!/bin/bash
# Programe:
#		You input your demobilization date, I calculate how many days
#       before you demobilize.
# History:
# 2013/11/11    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. 告知使用者这支程序的用途，并且告知应该如何输入日期格式？
echo "This program wll try to calculate :"
echo "How many days before your demobilization date..."
read -p "Please input your demobilization date (YYYYMMDD ex>20090401): " date2

# 2. 测试一下，这个输入的内容是否正确？利用正则表达式
date_d=$(echo $date2 | grep '[0-9]\{8\}')   # 看看是否是八个数字
if [ "$date_d" == "" ]; then
    echo "You input the wrong date format..."
    exit 1
fi

# 3. 开始计算日期
declare -i date_dem=`date --date="$date2" +%s`  # 退伍日期秒数
declare -i date_now=`date +%s`                  # 现在日期秒数
declare -i date_total_s=$date_dem-$date_now # 剩余秒数统计
declare -i date_d=$(($date_total_s/60/60/24))     # 转为日数
if [ "$date_total_s" -lt "0" ]; then               # 判断是否退伍
    echo "You had been demobilization before: " $((-1*$date_d)) " days ago."
else
    declare -i date_h=$(($(($date_total_s-$date_d*60*60*24))/60/60))
    echo "You will demobilize after $date_d days and $date_h hours."
fi
