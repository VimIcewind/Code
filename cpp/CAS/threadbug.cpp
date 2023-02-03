#include <iostream>
#include <thread>
#include <mutex>
#include <unistd.h>

using namespace std;

int  i = 0;
mutex mut;

void iplusplus() {
    int c = 10000000;  //循环次数
    while (c--) {
        i++;
    }
}
int main()
{
    thread thread1(iplusplus);  //建立并运行线程1
    thread thread2(iplusplus);  //建立并运行线程2
    thread1.join();  // 等待线程1运行完毕
    thread2.join();  // 等待线程2运行完毕
    cout << "i = " << i << endl;
    return 0;
}
