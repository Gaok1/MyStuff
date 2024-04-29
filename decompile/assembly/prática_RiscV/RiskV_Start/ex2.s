.text

.globl _start



_start:
# x -> S0
#Y -> S1

li s0, 1
li t2,5
sub t0,t2,s0 #5 - x
addi s1, t0,15 # (5-x) + 15
nop
