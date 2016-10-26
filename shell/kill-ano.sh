#!/bin/bash
a=`/bin/ps -A | grep vsftpd-ano | awk '{print $1}'`
kill -9 $a
