[BITS 64]

	global memcmp:function, _memcmp:function
	section .text

	; int memcmp(const void *ptr1, const void *ptr2, size_t num);
	; rdi -> const char *ptr1
	; rsi -> const char *ptr2
	; rdx -> size_t num

_memcmp:
memcmp:
	push rbp
	mov rbp, rsp	; function header

	mov r8, 0
	mov rax, 0
	mov rcx, 0
	cmp rdx, 0
	je end_memcmp

loop_memcmp:
	mov al, [rdi]
	mov r8b, [rsi]
	cmp al, r8b		; Check if the mem is equal
	jne end_memcmp		; Jump to the end if it's false
	inc rsi
	inc rdi
	inc rcx
	cmp rcx, rdx
	je end_memcmp
	jmp loop_memcmp	; Otherwise we continue

end_memcmp:
	sub al, r8b

	mov rsp, rbp ;epilogue
	pop rbp
	ret 0