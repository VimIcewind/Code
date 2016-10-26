#!/bin/bash
# set parameters in the if then
# 需要加上hello这个参数才会正确显示
# Icewind 2013-01-18 23:35:02
if [ "$1" = "hello" ]; then
	echo "Hello! How are you?"
elif [ "$1" = "" ]; then
	echo "You MUST input parameters"
else
	echo "The only accept parameter is hello"
fi
