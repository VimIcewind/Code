#!/bin/bash
# Programe:
#		This program shows the effect of shift function.
# History:
# 2013/11/10    Icewind     First release
#!/bin/bash
# Programe:
#		This program shows "Hello World!" in you screen.
# History:
# 2013/11/10    Icewind     First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>'$@'"
shift   # 进行第一次一个变量的shift
echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>'$@'"
shift 3 # 进行第二次三个变量的shift
echo "Total parameter number is ==>$#"
echo "Your whole parameter is   ==>'$@'"
