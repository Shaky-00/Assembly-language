# exchange near ascii
.section .data
stringvar:
    .ascii  "0123456789abcdef"
.section .text
.globl __start
__start:
    mov     $8, %ecx    # loop for 8 times
    mov     $stringvar, %ebx
L1:
    movb    (%ebx), %al
    xchgb   %al, 1(%ebx)
    movb    %al, (%ebx)
    inc     %ebx
    inc     %ebx
    loop    L1

    # output
    movl    $4, %eax
    movl    $1, %ebx
    movl    $stringvar, %ecx
    movl    $16, %edx
    int     $0x80

    # exit
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80