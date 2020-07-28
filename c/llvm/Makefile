ALL : hi hi.ll hi.bc hi.as.bc hi.dis.ll

hi : hi.c
	clang -o hi hi.c
hi.ll : hi.c
	clang -S -emit-llvm hi.c -o hi.ll
hi.bc : hi.c
	clang -c -emit-llvm hi.c -o hi.bc
hi.as.bc : hi.ll
	llvm-as hi.ll -o hi.as.bc
hi.dis.ll : hi.bc
	llvm-dis hi.bc -o hi.dis.ll

clean :
	rm -rf hi hi.o hi.ll hi.bc hi.dis.ll hi.as.bc
