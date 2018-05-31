#include <Windows.h>
#include <process.h>

void thread(void *a)
{
    char *p;
    char *r = strtok_s("aaa", "b", &p);
    ExitThread(0);
}

int main(int argc, char *argv[])
{
    while (1) {
        CreateThread(0, 0, (LPTHREAD_START_ROUTINE)thread, 0, 0, 0);
        Sleep(5);
    }
    return 0;
}
