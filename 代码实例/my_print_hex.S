# print_hex homework

# main.S
.section .data
var:    .int 0x8912abcd, 0, 0x1234
.section .text
.globl __start
__start:
    sub     $4, %esp

    mov     var, %eax
    mov     %eax, (%esp)
    call    print_hex

    mov     var+4, %eax
    mov     %eax, (%esp)
    call    print_hex

    mov     var+8, %eax
    mov     %eax, (%esp)
    call    print_hex

    # exit
    mov     $1, %eax
    mov     $0, %ebx
    int     $0x80   

# print_hex.S
.section .text
.globl print_hex
print_hex:
    push    %ebp
    mov     %esp, %ebp
    sub     $16, %esp
    mov     %ebx, 12(%esp)
    mov     8(%ebp), %eax
    movb    $' ', 11(%esp)
    lea     10(%esp), %ecx
    lea     3(%esp), %eax
    test    %eax, %eax
    jnz     L1
    movb    $'0', (%ecx)
    dec     %ecx
    jmp     L5
L1:
    jns     L4
    neg     %eax
L4:
    test    %eax, %eax
    jz      L5
    mov     %eax, %edx
    andb    $0xf, %dl
    cmpb    $10, %dl
    jb      L2
    addb    $0x57, %dl
    jmp     L3
L2:
    orb     $0x30, %dl
L3:
    movb    %dl, (%ecx)
    dec     %ecx
    shrl    $4, %eax
    cmp     %ebx, %ecx
    jae     L4
L5:
    movb    $'x', (%ecx)
    dec     %ecx
    movb    $'0', (%ecx)
    mov     8(%ebp), %eax
    test    %eax, %eax
    jns     L6
    dec     %ecx
    movb    $'-', (%ecx)
L6:
    lea     12(%esp), %edx
    sub     %ecx, %edx
    mov     $4, %eax
    mov     $1, %ebx
    int     $0x80
    mov     12(%esp), %ebx
    leave
    ret