#include <stdio.h>

int main(int argc, char *argv[])
{
    int data[10];
    int i = 0;
    do {
        data[++i] = 0;
    } while (i <= 10);
    return 0;
}

