# Programa 6
# ATENÇÃO: Use os shifts para gerar os valores muito grandes
# x = 1048576; // 2 a 20
# y = 4096; // 2 a 12
# z = x + y;

.text
.globl _start

_start:
    # s0 -> x
    # s1 -> y
    # s2 -> Z
    li s0, 2         
    li s1, 2         

    slli s0, s0, 20  
    slli s1, s1, 12  

    add s2, s0, s1   

    nop              




