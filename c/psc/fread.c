#include <stdio.h>
#include <string.h>

int main()
{
    FILE *stream;
    char msg[] = "this is a test";
    char buf[20];

    if ((stream = fopen("dummy.fil", "w+")) == NULL) {
        fprintf(stderr, "cannot open output file.\n");
        return 1;
    }

    /* write some data to the file */
    fwrite(msg, 1, strlen(msg) + 1, stream);
    /* seek to the beginning of the file */
    fseek(stream, 0, SEEK_SET);
    /* read the data and dispaly it */
    fread(buf, 1, strlen(msg) + 1, stream);
    printf("%s\n", buf);
    fclose(stream);
    system("pause");
    return 0;
}
