# hello_proc.S
.section .data
output:
    .ascii "Hello world\n"
.section .text
.globl __start
__start:
    call    print_s

    # exit
    movl    $1, %eax
    movl    $0, %ebx
    int     $0x80
    
print_s:
    movl    $4, %eax    
    movl    $1, %ebx 
    movl    $output, %ecx
    movl    $12, %edx
    int     $0x80
    ret