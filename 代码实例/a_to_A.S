# a to A
.section .data
iostring:
    .asciz  "ab1g2hA0H56po9wK78nB"
.section .text
.globl __start
__start:
    mov     $iostring, %ebx
    mov     %ebx, %edx
L1:
    mov     (%edx), %al
    test    %al, %al
    je      L2
    subb    $'a', %al
    cmp     $25, %al
    ja      L3
    addb    $'A', %al
    mov     %al, (%edx)
L3:
    inc     %edx
    jmp     L1
    
L2:
    sub     %ebx, %edx

    # output
    movl    $4, %eax
    movl    $1, %ebx
    movl    $iostring, %ecx
    int     $0x80

    # exit
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80