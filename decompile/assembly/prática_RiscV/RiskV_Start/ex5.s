# Programa 5
#x=3;
#y=4;
#z=((15*x)+(67*y))*4;

.text

.globl _start



_start:

#s0 -> x
#s1 -> y
#s2 -> Z

li s0,3
li s1,4

li t0,15
li t1,67

mul t2,t0,s0
mul t3,t1,s1
add t2,t2,t3
mul s2,t2,s1

nop
