#!/bin/bash
# Using while and loop
# Icewind 2013-01-19 00:15:37
declare -i i
declare -i s
while [ "$i" != "101" ]
do
	s=s+i
	i=i+1
done
echo "The count is ==> $s"

