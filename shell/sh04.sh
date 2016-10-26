#!/bin/bash
# Programe:
#		User inputs 2 integer number: program will cross these two number.
# History:
# 2013/11/10    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo -e "You SHOULD input 2 numbers, I will cross them! \n"
read -p "first number: " firstnum
read -p "second number: " secnum
total=$(($firstnum*$secnum))
echo -e "\nThe result of $firstnum x $secnum is ==> $total"
