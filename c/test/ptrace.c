#include <stdio.h>
#include <sys/ptrace.h>

int main()
{
    if (ptrace(PTRACE_TRACEME, 0, 1, 0) < 0) {
        printf("DEBUGGING... Byen");
        return 1;
    }
    printf("Hellon");
    return 0;
}
