.data
x: .word 10
y: .word 10


.text
.globl main

main:
    la s0,x
    la s1,y
    lw t0,0(s0)
    lw t1,0(s1)
    # if x ==y
    beq t0,t1,if_eq
    not_eq:
        slt t2,t0,t1 # t2 = t0 < t1
        beq t2,zero,exit # se t2 == 0, então t0 >= t1, sair
        addi t0,t0,1 # t0++
        j not_eq #enquanto x<y, ira somar 1 a x

    if_eq:
        addi t1,t1,100
        j not_eq #enquanto x<y, ira somar 1 a x
        j exit

    exit:
        sw t0,0(s0)
        sw t1,0(s1)
        nop
    