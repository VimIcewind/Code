#!/bin/bash
# Programe:
#		Using for .... loop to print 3 animals
# History:
# 2013/11/12    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

for animal in dog cat elephant
do
    echo "There are ${animal}s... "
done
