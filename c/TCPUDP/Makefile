all: TCPsv TCPcli UDPsv UDPcli

TCPsv : TCPsv.o
	gcc -o TCPsv TCPsv.o
TCPsv.o : TCPsv.c
	gcc -c TCPsv.c
TCPcli : TCPcli.o
	gcc -o TCPcli TCPcli.o
TCPcli.o : TCPcli.c
	gcc -c TCPcli.c

UDPsv : UDPsv.o
	gcc -o UDPsv UDPsv.o
UDPsv.o : UDPsv.c
	gcc -c UDPsv.c
UDPcli : UDPcli.o
	gcc -o UDPcli UDPcli.o
UDPcli.o : UDPcli.c
	gcc -c UDPcli.c

clean:
	rm -rf TCPsv TCPcli UDPsv UDPcli *.o
