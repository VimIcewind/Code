#!/bin/bash
# 这个脚本用于引用两个变量，顺便比较一下"与'的异同
# 2013-01-18 22:50:22
# Writeen by Icewind
name="Icewind"
myname1="My name is $name"
myname2='My name is $name'
echo $name
echo $myname1
echo $myname2
unset name myname1 myname2
