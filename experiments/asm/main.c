#include <stdio.h>

int main() {
    int src = 5;
    int dst; 

    asm (
        "mov %1, %0\n\t"
        "add %1, %0"
        : "=r" (dst)
        : "r" (src)
    );
    
    printf("%d\n", dst);

    return 0;
}
