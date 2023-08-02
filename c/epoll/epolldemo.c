/* TCP服务器端步骤：
 * 创建套接字  socket()
 * 绑定套接字  bind()  ------> listen()
 * 设置套接字为监听模式，进入被动接受连接请求状态
 * 接受请求，建立连接  recv()
 * 读写数据    send()
 * 终止连接    close()
 ******************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1000
#define MAX_EVENTS 10

void setnonblocking(int fd);
void do_use_fd(int fd);

int main(int argc, const char *argv[])
{

	struct epoll_event ev, events[MAX_EVENTS];
	int listen_sock, conn_sock, nfds, epollfd;
	int s;
	int fd;
	int len;
	int n;

	struct sockaddr_in my_addr, local;
	struct sockaddr_in remote_addr;

	int sin_size, addrlen;
	char buf[BUFSIZE];

	/* Set up listening socket, 'listen_sock' (socket(), bind(), listen()) */
	memset(&my_addr, 0, sizeof(my_addr));
	my_addr.sin_family = AF_INET;
	my_addr.sin_addr.s_addr = INADDR_ANY;
	my_addr.sin_port = htons(8000);

	if ((s = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
		perror("socket");
		return 1;
	}

	if (bind(s, (struct sockaddr *)&my_addr, sizeof(struct sockaddr)) < 0) {
		perror("bind");
		return 1;
	}

	listen(s, 5);
	sin_size = sizeof(struct sockaddr_in);

	if ((fd = accept(s, (struct sockaddr *)&remote_addr, &sin_size)) < 0) {
		perror("accept");
		return 1;
	}

	printf("accept client %s\n", inet_ntoa(remote_addr.sin_addr));
	len = send(fd, "Welcome to my serve\n", 21, 0);

	while ((len = recv(fd, buf, BUFSIZE, 0)) > 0) {
		buf[len] = '\0';
		printf("%s\n", buf);

		if (send(fd, buf, len, 0) < 0) {
			perror("write");
			return 1;
		}
	}

	/* Set up listening socket, 'listen_sock' (socket(), bind(), listen()) */

	epollfd = epoll_create(10);
	if (epollfd == -1) {
		perror("epoll_create");
		exit(EXIT_FAILURE);
	}

	ev.events = EPOLLIN;
	ev.data.fd = listen_sock;
	if (epoll_ctl(epollfd, EPOLL_CTL_ADD, listen_sock, &ev) == -1) {
		perror("epoll_ctl: listen_sock");
		exit(EXIT_FAILURE);
	}

	addrlen = sizeof(struct sockaddr_in);
	for (;;) {
		nfds = epoll_wait(epollfd, events, MAX_EVENTS, -1);
		if (nfds == -1) {
			perror("epoll_pwait");
			exit(EXIT_FAILURE);
		}

		for (n = 0; n < nfds; ++n) {
			if (events[n].data.fd == listen_sock) {
				conn_sock = accept(listen_sock, (struct sockaddr *)&local, &addrlen);
				if (conn_sock == -1) {
					perror("accept");
					exit(EXIT_FAILURE);
				}
				setnonblocking(conn_sock);
				ev.events = EPOLLIN | EPOLLET;
				ev.data.fd = conn_sock;
				if (epoll_ctl(epollfd, EPOLL_CTL_ADD, conn_sock, &ev) == -1) {
					perror("epoll_ctl: conn_sock");
					exit(EXIT_FAILURE);
				}
			} else {
				do_use_fd(events[n].data.fd);
			}
		}
	}

	close(fd);
	close(s);


	return 0;
}

void setnonblocking(int fd)
{

}

void do_use_fd(int fd)
{

}
