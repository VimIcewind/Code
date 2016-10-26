#!/bin/bash
# Programe:
#		Show "Hello" from $1.... by using case .... esac
# History:
# 2013/11/11    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

case $1 in
    "hello")
        echo "Hello, how are you?"
        ;;
    "")
        echo "You MUST input parameters, ex> {$0 someword}"
        ;;
    *)  # 其实就相当于万用字节，0~无穷多个任意字节之意！
        echo "Usage $0 {hello}"
        ;;
esac
