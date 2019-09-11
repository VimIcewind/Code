/*
 * Send a UDP datagram to the daytime server on some other host.
 * read the reply, and print the time and date on the server.
 */

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFSIZE 150	/* arbitrary size */

void err_sys(const char* x)
{
	perror(x);
	exit(1);
}

int main()
{
	struct sockaddr_in serv;
	char buff[BUFFSIZE];
	int sockfd, n;

	if ((sockfd = socket(PF_INET, SOCK_DGRAM, 0)) < 0)
		err_sys("socket error");

	bzero((char *) &serv, sizeof(serv));
	serv.sin_family = AF_INET;
	serv.sin_addr.s_addr = inet_addr("127.0.0.1");
	serv.sin_port = htons(13);

	if (sendto(sockfd, buff, BUFFSIZE, 0, (struct sockaddr *) &serv, sizeof(serv)) != BUFFSIZE)
		err_sys("sendto error");

	if ((n = recvfrom(sockfd, buff, BUFFSIZE, 0, (struct sockaddr *) NULL, (socklen_t *) NULL)) < 2)
		err_sys("recvfrom error");
	buff[n - 2] = 0;	/* null terminate */
	printf("%s\n", buff);

	exit(0);
}
