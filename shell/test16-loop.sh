#!/bin/bash
# Using until
# Icewind 2013-01-19 00:25:04
echo "Press Y/y to stop"
until [ "$yn" = "y" ] || [ "$yn" = "Y" ]
do
	read yn
done
echo "Stop here"
