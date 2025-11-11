

global loader
MAGIC_NUMBER equ 0x1BADB002
FLAGS equ 0x0
CHECKSUM equ -MAGIC_NUMBER
KERNEL_STACK_SIZE equ 4096

section .text
align 4
	dd MAGIC_NUMBER
	dd FLAGS
	dd CHECKSUM


loader:
	mov eax, 0xCAFEBABE
        mov esp, kernel_stack + KERNEL_STACK_SIZE

;	extern kmain

;	call kmain

;	mov word [0x000B8000], 0x4128
  ; Ecriture "HELLO WORLD" à l'écran
    mov word [0x000B8000 + 0], 0x0F48    ; 'H' fg=15 blanc, bg=0 noir
    mov word [0x000B8000 + 2], 0x0F45    ; 'E'
    mov word [0x000B8000 + 4], 0x0F4C    ; 'L'
    mov word [0x000B8000 + 6], 0x0F4C    ; 'L'
    mov word [0x000B8000 + 8], 0x0F4F    ; 'O'
    mov word [0x000B8000 + 10], 0x0F20   ; ' ' (espace)
    mov word [0x000B8000 + 12], 0x0F57   ; 'W'
    mov word [0x000B8000 + 14], 0x0F4F   ; 'O'
    mov word [0x000B8000 + 16], 0x0F52   ; 'R'
    mov word [0x000B8000 + 18], 0x0F4C   ; 'L'
    mov word [0x000B8000 + 20], 0x0F44   ; 'D'

	mov word [0xB8000 + 0xA0], 0x0F43
        mov word [0xB8000 + 0x140], 0x0F48
        mov word [0xB8000 + 0x1e0], 0x0F45
        mov word [0xB8000 + 0x280], 0x0F44
        mov word [0xB8000 + 0x320], 0x0F59

    ;mov word [0xB8000 + 22], 0x0E41 ça donne un A en jaune ^^

.loop:
	jmp .loop
section .bss
        align 4
        kernel_stack:
                resb KERNEL_STACK_SIZE

