.data
Amore: .word 

.text
.globl main

main:
    la s0,Amore
    lw s1, 4(s0)
    slli s1,s1,2
    sw s1,8(s0)
    nop

