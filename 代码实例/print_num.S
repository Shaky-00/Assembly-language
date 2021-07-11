# print_num.S
.section .data
iostring:
    .asciz "ab1g2hA0H56po9wK78nB"
.section .text
.globl __start
__start:
    mov     $iostring, %ebx
    mov     %ebx, %edx
L1:
    mov     (%ebx), %al
    test    %al, %al
    je      L2
    cmp     $'0', %al
    jb      L3
    cmp     $'9', %al
    ja      L3
    mov     %al, (%edx)
    inc     %edx
L3:
    inc     %ebx
    jmp     L1
L2: 
    mov     %al, (%edx)

    # output
    movl    $4, %eax
    movl    $1, %ebx
    movl    $iostring, %ecx
    sub     %ecx, %edx
    int     $0x80

    # exit
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80
    