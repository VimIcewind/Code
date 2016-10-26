#!/bin/bash
# Programe:
#		Using netstat and grep to detet WWW,SSH,FTP and Mail services.
# History:
# 2013/11/11    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. 先作一些告知的动作而已~
echo "Now, I will detect your Linux server's services!"
echo -e "The www, ftp, ssh and mail will be detect!\n"

# 2. 开始进行一些测试的工作，并且也输出一些资讯！
testing=$(netstat -tuln | grep ":80")   # 侦测看 port 80 在否？
if [ "$testing" != "" ]; then
    echo "WWW is running in your system."
fi
testing=$(netstat -tuln | grep ":22")   # 侦测看 port 22 在否？
if [ "$testing" != "" ]; then
    echo "SSH is running in your system."
fi
testing=$(netstat -tuln | grep ":21")   # 侦测看 port 21 在否？
if [ "$testing" != "" ]; then
    echo "FTP is running in your system."
fi
testing=$(netstat -tuln | grep ":25")   # 侦测看 port 25 在否？
if [ "$testing" != "" ]; then
    echo "Mail is running in your system."
fi
