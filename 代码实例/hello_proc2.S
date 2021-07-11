# hello_proc.S: use push and stack
.section .data
output:
    .ascii "Hello world\n"
.section .text
.globl __start
__start:
    push    $12
    push    $output
    call    print_s

    # exit
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80

print_s:
    movl    $4, %eax
    movl    $1, %ebx
    movl    4(%esp), %ecx
    movl    8(%esp), %edx
    int     $0x80
    ret