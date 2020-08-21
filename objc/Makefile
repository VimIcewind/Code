CFLAGS=`gnustep-config --objc-flags` -L /usr/GNUstep/System/Library/Libraries -fconstant-string-class=NSConstantString -lobjc -lgnustep-base
CC=clang

OBJECT = hello main

all : $(OBJECT)

hello : hello.m
	$(CC) $(CFLAGS) -o hello hello.m
main : main.m
	$(CC) $(CFLAGS) -o main main.m

clean :
	rm -rf $(OBJECT) *.d

