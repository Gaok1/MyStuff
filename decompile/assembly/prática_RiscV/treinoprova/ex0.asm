.data
x: .word 5
y: .word 20
z: .word 0

.text
.globl main

main:
    la s0,x
    la s1,y
    la s2,z


loop:
    lw t0,0(s0)
    lw t1,0(s1)
    slt t2,t0,t1 #enquanto x<y
    beq t2,zero,fimLoop
    addi t0,t0,5
    sw t0,0(s0)
    sw t0,0(s2)
    j loop

fimLoop:
    lw t0,0(s2)
    lw t1,0(s0)
    beq t0,t1,exit #se z==x, sai
    nop
    nop
exit:
    lw t0,0(s1) #antes de sair, y = y+100
    addi t0,t0,100
    sw t0,0(s1)
    nop

