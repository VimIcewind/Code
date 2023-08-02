all : mysqldemo select crud

mysqldemo : mysqldemo.c
	gcc -o mysqldemo mysqldemo.c -I/usr/include/mysql/ -L/usr/lib64/mysql/ -lmysqlclient -lz
select : select.c
	gcc -o select select.c -I/usr/include/mysql/ -L/usr/lib64/mysql/ -lmysqlclient -lz
crud : crud.c
	gcc -o crud crud.c -I/usr/include/mysql/ -L/usr/lib64/mysql/ -lmysqlclient -lz
clean :
	rm -rf mysqldemo select crud
