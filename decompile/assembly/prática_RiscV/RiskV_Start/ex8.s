## Programa 8
# Considere a seguinte instrução iniciando um programa:
#ori x8, x0, 0x01
# Usando apenas instruções lógicas e instruções de deslocamento, continue o programa de forma que ao final, tenhamos o seguinte conteúdo no registrador $8:
#x8 = 0xFFFFFFFF

.text
.globl _start

_start:
    li t0,1
    ori x8, x0, 0x01
    srl x8,x8,t0 #vira 0
    sub x8,x8,t0# 0 - 1, vira 0xFFFFFFFF

    nop              




