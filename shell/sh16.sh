#!/bin/bash
# Programe:
#		Use id, finger command to check system account's information.
# History:
# 2013/11/12    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

users=$(cut -d ':' -f 1 /etc/passwd)    # 截取帐号名称
for username in $users
do
    id $username
    finger $username
done
