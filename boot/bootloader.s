	BITS 16

start:
	mov ax, 07C0h
	add ax, 288
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h
	mov ds, ax

	mov ah, 0x06
	mov al, 0
	int 10h
	call cls
	mov si, text
	call print_string

	jmp $

text db 'sorry bro but there is no os', 0
	

cls:
	pusha
	mov ah, 0x00
	mov al, 0x03
	int 0x10
	popa
	ret



print_string:
	mov ah, 0Eh

.repeat:
	lodsb
	cmp al, 0
	je .done
	int 10h
	jmp .repeat

.done:
	ret


	times 510-($-$$) db 0
	dw 0xAA55
