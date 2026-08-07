; NyxOS-D - Multiboot entry stub. Sets up a stack, calls the D kmain(), halts.
bits 32

MB_MAGIC    equ 0x1BADB002
MB_FLAGS    equ 0x0
MB_CHECKSUM equ -(MB_MAGIC + MB_FLAGS)

section .multiboot
align 4
    dd MB_MAGIC
    dd MB_FLAGS
    dd MB_CHECKSUM

section .bss
align 16
stack_bottom:
    resb 16384
stack_top:

section .text
global _start
extern kmain
_start:
    mov esp, stack_top
    call kmain
    cli
.hang:
    hlt
    jmp .hang
