char *str = "Hello world!\n";

void print()
{
	asm("movq $13, %%rdx \n\t"
	"movq %0, %%rcx \n\t"
	"movq $0, %%rbx \n\t"
	"movq $4, %%rax \n\t"
	"int $0x80 \n\t"
	::"r"(str):"rdx","rcx","rbx");
}

void exit()
{
	asm("movq $42, %rbx \n\t"
	"movq $1, %rax \n\t"
	"int $0x80 \n\t");
}

void nomain()
{
	print();
	exit();
}
