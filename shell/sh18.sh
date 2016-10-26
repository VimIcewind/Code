#!/bin/bash
# Programe:
#		User input dir name, I find the permission of files.
# History:
# 2013/11/12    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. 先看看这个目录是否存在
read -p "Please input a directory: " dir
if [ "$dir" == "" -o ! -d "$dir" ]; then
    echo "The $dir is NOT exist in your system."
    exit 1
fi

# 2. 开始测试文件
filelist=$(ls $dir)        # 列出所有该目录下的文件名称
for filename in $filelist
do
    perm=""
    test -r "$dir/$filename" && perm="$perm readable"
    test -w "$dir/$filename" && perm="$perm writable"
    test -x "$dir/$filename" && perm="$perm executable"
    echo "The file $dir/$filename's permission is $perm"
done
