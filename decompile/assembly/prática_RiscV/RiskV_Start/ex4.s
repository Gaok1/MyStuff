## Programa 4
# x=1;
# y=5*x+15;

.text

.globl _start



_start:

#s0 -> x
#s1 -> y
li s0,2
li s1,5
mul s1,s0,s1
addi s1,s1, 15
nop
