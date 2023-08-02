// 信号量定义
typedef struct semaphore {
	int value; // 信号量值
	struct pcb *list; // 信号量队列指针
} semaphore;

// P操作
void P(semaphore s)
{
	s.value--;
	if (s.value < 0)
		asleep(s.list);
}

// V操作
void V(semaphore s)
{
	s.value++;
	if (s.value <= 0)
		wakeup(s.list);
}

// 初始化互斥信号量
semphore mutex;
mutex.value = 1;

// 进程 P1
P1()
{
	// 申请访问共享内存
	P(mutex);
	// 访问共享内存
	// 释放共享内存
	V(mutex);
}

// 进程 P2
P2()
{
	// 申请访问共享内存
	P(mutex);
	// 访问共享内存
	// 释放共享内存
	V(mutex);
}


semphore S;
S.value = 0;

PA()
{
	// 代码 1;
	// 代码 2;
	V(S);
	// 代码 3;
}

PB()
{
	P(S);
	// 代码 4;
	// 代码 5;
	// 代码 6;
}
