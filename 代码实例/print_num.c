#include <stdio.h>

char s[] = "ab1g2hA0H56po9wK78nB\0";
int main()
{
    char *p, *q;
    p = q = s;
    while(*p != 0)
    {
        if(*p >= '0' && *p <= '9')
        {
            *p = *q;
            q++;
        }
        p++;
    }
    *q = 0;
    printf("%s", s);
    return 0;
}