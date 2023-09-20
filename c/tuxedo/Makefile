OBJECT = tuxconfig Tclient Tclienta Tserver 
ALL: $(OBJECT)

tuxconfig: ubbconfig
	tmloadcf -y ubbconfig
Tclient: Tclient.c
	buildclient -f Tclient.c -o Tclient -v
Tclienta: Tclienta.c
	buildclient -f Tclienta.c -o Tclienta -v
Tserver: Tserver.c
	buildserver -f Tserver.c -o Tserver -s TOUPPER -v

clean:
	rm -rf $(OBJECT)
