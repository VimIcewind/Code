#!/bin/bash
# program: Using case mode
# Written by Icewind
# date: 2013-01-18 23:59:15
# content: I will use this program to study the case mode!
# 1.print this program
echo "Press your select one, two, three"
read number
case $number in
	one)
	echo "your choice is one"
	;;
	two)
	echo "your choice is two"
	;;
	three)
	echo "your choice is three"
	;;
	*)
	echo "Usage {one|two|three}"
	exit 1
esac

