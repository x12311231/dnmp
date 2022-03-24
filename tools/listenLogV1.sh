#!/bin/bash

#project_dir=`pwd`
#FILE=${project_dir}/www/vanke/apps/web/logs/`date +%Y%m%d`/web.log
#echo $FILE
FILE=$1
#判断nohup已包含FILE时，退出监听

temp_last_time=0
append_string='============================我是分割线======================='
while true;
do
    last_time=$(stat -c %Y $FILE)
    if [[ ${last_time} != ${temp_last_time} ]];then
        temp_last_time=${last_time}
        read_last_string=`awk 'END {print}' $FILE`
        if [[ ${read_last_string} != ${append_string} ]];then
            echo ${append_string} >> $FILE
        fi
    fi
    sleep 5
done
