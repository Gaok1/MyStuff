#x = o maior inteiro possível; // Ou seja, uma palavra de 32 bits com todos os bits igual a 1
#y = 8192;
#z = x - 4y;

.text
.globl _start

_start:
    # s0 -> x
    # s1 -> y
    # s2 -> z
    li s0,1
    slli s0,s0,31
    li t0,1
    sub s0,s0,t0

    li s1, 2     
    slli s1, s1, 13 
    li t0,4
    mul s1,s1,t0

    sub s2,s0,s1

    nop  

            