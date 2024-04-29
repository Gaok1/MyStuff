## Programa 3
#x=3;
#y=4;
#z=(15-x)+(67-y)+4;

.text

.globl _start



_start:

#s0 -> x
#s1 -> y
li s0,3
li s1,4
li t0,15
li t1,67

sub s2,t0,s0 #15-x
sub s3,t1,s1 #67-y
add s2,s2,s3
addi s2,s2,4
nop
