CFLAGS=`gnustep-config --objc-flags` -L /usr/GNUstep/System/Library/Libraries -fconstant-string-class=NSConstantString -lobjc -lgnustep-base
CC=clang

OBJECT = hello hi

all : $(OBJECT)

hello : hello.m
	$(CC) $(CFLAGS) -o hello hello.m
hi : hi.m
	$(CC) $(CFLAGS) -o hi hi.m

clean :
	rm -rf $(OBJECT) *.d

