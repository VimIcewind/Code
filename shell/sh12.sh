#!/bin/bash
# Programe:
#		This script only accepts te flowing parameter: one, two or three.
# History:
# 2013/11/10    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "This program will print your selection!"
read -p "Input your choice: " choice  # 暂时取消，可以替换！
case $choice in                       # 暂时取消，可以替换！
# case $1 in
    "one")
        echo "Your choice is ONE"
        ;;
    "two")
        echo "Your choice is TWO"
        ;;
    "three")
        echo "Your choice is THREE"
        ;;
    *)
        echo "Usage $0 {one|two|three}"
        ;;
esac
