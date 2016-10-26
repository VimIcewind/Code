#!/bin/bash
# This program is used to study if then
# Icewind 2013-01-18 23:28:28
echo "Press y or Y to continue"
read yn
if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
	echo "script is running..."
else
	echo "STOP"
fi
