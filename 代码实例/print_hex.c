#include <stdio.h>

void print_hex(unsigned int x)
{
    unsigned char c;
    unsigned char buf[11];
    int i;

    buf[0] = '0', buf[1] = 'x', buf[10] = 0;
    for(i=0; i<8; i++)
    {
        c = (x & 0xf);
        if(c < 10)  
            c |= 0x30;
        else
            c = (c-10) + 0x61;
        buf[9-i] = c;
        x >>= 4;
    }
    printf("%s", buf);
    return;
}

int main()
{
    print_hex(0x9812abcd);
    return 0;
}