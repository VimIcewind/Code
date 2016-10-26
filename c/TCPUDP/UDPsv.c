/************************************
*服务器端实现步骤：
*建立UDP套接字；socket
*绑定套接字到特定地址；bind
*等待并接收客户端信息；recvfrom
*处理客户端请求；
*发信息回客户端；sendto
*关闭套接字close
****************************************/

#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#define BUFSIZE 1000

int main(int argc, char *argv[])
{
	int s;
	int fd;
	int len;
	struct sockaddr_in my_addr;
	struct sockaddr_in remote_addr;
	int sin_size;
	char buf[BUFSIZE];

	memset(&my_addr, 0, sizeof(my_addr));
	my_addr.sin_family = AF_INET;
	my_addr.sin_addr.s_addr = INADDR_ANY;
	my_addr.sin_port = htons(8000);

	if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("socket");
		return 1;
	}
	if (bind(s, (struct sockaddr *)&my_addr, sizeof(struct sockaddr)) < 0) {
		perror("bind");
		return 1;
	}
	sin_size = sizeof(struct sockaddr_in);
	printf("waiting for a packet...\n");
	if ((len = recvfrom(s, buf, BUFSIZE, 0, (struct sockaddr *)&remote_addr, &sin_size)) < 0) {
		perror("recvfrom");
		return 1;
	}
	printf("received packet from %s:\n", inet_ntoa(remote_addr.sin_addr));
	buf[len] = '\0';
	printf("contents:%s\n", buf);
	close(s);
	return 0;
}
