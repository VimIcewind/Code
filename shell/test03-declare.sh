#!/bin/bash
# This program is used to "declare" variables
# 2013-01-18 22:58:56
# Icewind
number1=2*3+5*13-32+25
declare -i number2=2*3+5*13-32+25
echo "Your result is ==> $number1"
echo "Your result is ==> $number2"
unset number1 number2
