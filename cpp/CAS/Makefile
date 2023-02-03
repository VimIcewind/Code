CFLAGS=-g -Og -lpthread
CC=g++

OBJECT = threadbug lock atomic

all : $(OBJECT)

.cpp.s :
	$(CC) $(CFLAGS) -S $*.cpp
.cpp.o :
	$(CC) $(CFLAGS) -c $*.cpp
.cpp :
	$(CC) $(CFLAGS) -o $@ $*.cpp

clean :
	rm -rf $(OBJECT) *.S *.s *.
