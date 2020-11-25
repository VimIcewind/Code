CFLAG=-g -Wall

OBJECT=envdemo environ

ALL: $(OBJECT)

envdemo: envdemo.c
	gcc -o envdemo envdemo.c
environ: environ.c
	gcc -o environ environ.c

clean:
	rm -rf EnvTest $(OBJECT)
