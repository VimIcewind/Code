#include <iostream>
#include <thread>
#include <mutex>
#include <atomic>
#include <chrono>

using namespace std;
// atomic<int> i = 0;
atomic<int> i{0};

void iplusplus() {
    int c = 10000000;  //循环次数
    while (c--) {
        i++;
    }
}

int main()
{
    chrono::steady_clock::time_point start_time = chrono::steady_clock::now();//开始时间
    thread thread1(iplusplus);
    thread thread2(iplusplus);
    thread1.join();  // 等待线程1运行完毕
    thread2.join();  // 等待线程2运行完毕
    cout << "i = " << i << endl;
    chrono::steady_clock::time_point stop_time = chrono::steady_clock::now();//结束时间
    chrono::duration<double> time_span = chrono::duration_cast<chrono::microseconds>(stop_time - start_time);
    std::cout << "共耗时：" << time_span.count() << " ms" << endl; // 耗时
    return 0;
}
