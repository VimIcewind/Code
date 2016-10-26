#!/bin/bash
# Using until and loop
# Icewind 2013-01-19 00:17:26
declare -i i
declare -i s
until [ "$i" = "101" ]
do
	s=s+i
	i=i+1
done
echo "The count is ==> $s"
