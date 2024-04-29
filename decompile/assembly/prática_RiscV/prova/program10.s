.text
.globl _start
_start:
   
    beq t0, t1, label; # if t0 == t1 then label
    bne t0, t1, label # if t0 != t1 then label
    bge t0, t1, label # if t0 >= t1 then label
    bgt t0, t1, label # if t0 > t1 then label
    blt t0, t1, label # if t0 < t1 then label
    ble t0, t1, label # if t0 <= t1 then label
    
    
    label:
    
    
nop
