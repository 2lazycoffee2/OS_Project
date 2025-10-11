global loader 

MAGIC_NUMBER equ 0xBADB002	; valeur magique
FLAGS equ 0x0			; drapeau multiboot
CHECKSUM equ -MAGIC_NUMBER	; calcul le checksum : magic num + checksum + flags

section .text:			; début de code comme en armv4 avec "section intervec"
align 4				; le code devra aligner 4 octets
	dd MAGIC_NUMBER		; l'écrit dans le code machine 
	dd FLAGS
	dd CHECKSUM

loader:				; label loader : def comme point d'entré lié au script
	mov eax, 0xCAFEBABE	;
.loop :
	jmp .loop		; boucle infinie.

; seules choses faites, initialisation de 3 cste, écriture de 0xCAFEBABE dans eax.
