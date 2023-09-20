ALL: ubbconfig Tclient Tserver

tuxconfig: ubbconfig
	tmloadcf -y ubbconfig
Tclient: Tclient.c
	buildclient -f Tclient.c -o Tclient -v
Tserver: Tserver.c
	buildserver -f Tserver.c -o Tserver -s TOUPPER -v

