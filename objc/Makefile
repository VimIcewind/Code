CFLAGS=`gnustep-config --objc-flags` -L /usr/GNUstep/System/Library/Libraries -fconstant-string-class=NSConstantString -lobjc -lgnustep-base
CC=clang

OBJECT = hello main TimeAfterTime

all : $(OBJECT)

hello : hello.m
	$(CC) $(CFLAGS) -o hello hello.m
main : main.m
	$(CC) $(CFLAGS) -o main main.m
TimeAfterTime : TimeAfterTime.m
	$(CC) $(CFLAGS) -o TimeAfterTime TimeAfterTime.m

clean :
	rm -rf $(OBJECT) *.d

