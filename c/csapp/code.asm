	.file	"code.c"
	.intel_syntax noprefix
	.globl	accum
	.bss
	.align 4
	.type	accum, @object
	.size	accum, 4
accum:
	.zero	4
	.text
	.globl	sum
	.type	sum, @function
sum:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-20], edi
	mov	DWORD PTR [rbp-24], esi
	mov	eax, DWORD PTR [rbp-24]
	mov	edx, DWORD PTR [rbp-20]
	add	eax, edx
	mov	DWORD PTR [rbp-4], eax
	mov	edx, DWORD PTR accum[rip]
	mov	eax, DWORD PTR [rbp-4]
	add	eax, edx
	mov	DWORD PTR accum[rip], eax
	mov	eax, DWORD PTR [rbp-4]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sum, .-sum
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-4)"
	.section	.note.GNU-stack,"",@progbits
