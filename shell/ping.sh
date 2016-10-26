#!/bin/sh
pingcmd()
{
        prefix="SERVER $1 PING $2"
        ping -w 2 -c 2 $2>/dev/null
        ret=$?
        if [ $ret -eq 0 ] 

        then printf "$prefix OK\n"
        else printf "$prefix ERROR\n"
        fi
        return 0
}
echo "---------------------------------------"
echo "     核心区     PING FROM   C3850A     "
echo "---------------------------------------"
server0="172.16.233.1"
server1="172.16.233.1"
server2="172.16.233.2"
server3="172.16.233.3"
server4="172.16.232.1"
server5="172.16.232.2"
server6="172.16.232.3"
server7="172.16.230.1"
server8="172.16.230.2"
pingcmd $server0 $server1
pingcmd $server0 $server2
pingcmd $server0 $server3
pingcmd $server0 $server4
pingcmd $server0 $server5
pingcmd $server0 $server6
pingcmd $server0 $server7
pingcmd $server0 $server8
echo ""

