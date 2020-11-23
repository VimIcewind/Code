section .text
global _start
_start:
	mov rax, 4	;4号调用
	mov rbx, 1	;ebx送1表示stdout
	mov rcx, msg	;字符串的首地址送入ecx
	mov rdx, 15	;字符串的长度送入edx
	int 80h		;输出字串
	mov rax, 1	;1号调用
	int 80h		;结束
msg:
	db "Hello, World!",0ah,0dh

