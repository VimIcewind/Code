#!/bin/bash
# Using for and loop
# Icewind  2013-01-19 00:13:06
declare -i s 
for (( i=1; i<=100; i=i+1 ))
do
	s=s+i
done
echo "The count is ==> $s"

