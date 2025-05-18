BITS 16                 ; directive telling NASM to work in 16 bits mode

start:
	mov ax, 0x7C0		; Set up 4K stack space after this bootloader
	add ax, 288		    ; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096

	mov ax, 0x7C0		; Set data segment to where we're loaded
	mov ds, ax


	mov si, text_string	; Put string position into SI
	call print_string	; Call our string-printing routine

	; Load C kernel from sector 2
	mov ah, 0x02        ; BIOS read sector function
    mov al, 1           ; Number of sectors to read (1 for now)
    mov ch, 0           ; Cylinder 0
    mov cl, 2           ; Sector 2 (1-based)
    mov dh, 0           ; Head 0
    mov dl, 0           ; Drive 0 (floppy)
	mov bx, 0x1000      ; Load to ES:BX = 0x1000:0x0000
    mov es, bx
    xor bx, bx          ; BX = 0
    int 0x13            ; BIOS disk read

	; Jump to C kernel entry point (kernel_main at 0x1000:0x0000)
    jmp 0x1000:0x0000
	jmp $			    ; Jump here - infinite loop!

text_string:
    db 'Welcome from ASM!', 0  ; null-terminated

print_string:			; Routine: output string in SI to screen
	mov ah, 0xE		    ; int 10h 'print char' function

.repeat:
	lodsb			    ; Get character from string
	cmp al, 0
	je .done		    ; If char is zero, end of string
	int 0x10			; Otherwise, print it
	jmp .repeat

.done:
	ret

	times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
	dw 0xAA55		    ; The standard PC boot signature
