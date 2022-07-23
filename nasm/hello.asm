;
;

	global _start


	section .text

_start:	mov rax, 1 ; system call for wwrite
	mov rdi, 1	; file handle 1 is stdout
	mov rsi, message	; address of the string to output
	mov rdx, 13		; number of bytes
	syscall			; invoke operating system to do the write
	mov rax, 60		; system call for exit
	xor rdi, rdi		; exit code 0
	syscall			; invoke operating system to exit

	section .data
message: db	"Hello, World", 10	; note new line at the end
