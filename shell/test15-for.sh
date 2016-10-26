#!/bin/bash
# Using for and loop to read the account of this linux server!
# Icewind 2013-01-19 00:22:02
account=`cut -d ":" -f1 /etc/passwd | sort`
echo "The following is your linux server's account"
for i in $account
do
	echo $i
done
