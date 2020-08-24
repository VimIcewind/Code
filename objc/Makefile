CFLAGS=`gnustep-config --objc-flags` -L /usr/GNUstep/System/Library/Libraries -fconstant-string-class=NSConstantString -lobjc -lgnustep-base
CC=clang

OBJECT = hello main TimeAfterTime nil

all : $(OBJECT)

hello : hello.m
	$(CC) $(CFLAGS) -o hello hello.m
main : main.m
	$(CC) $(CFLAGS) -o main main.m
TimeAfterTime : TimeAfterTime.m
	$(CC) $(CFLAGS) -o TimeAfterTime TimeAfterTime.m
nil : nil.m
	$(CC) $(CFLAGS) -o nil nil.m

clean :
	rm -rf $(OBJECT) *.d

