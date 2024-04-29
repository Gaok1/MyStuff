.data 
vec: .word 1,2,3,4,5,6,7,8,9,10 # vetor de 10 elementos

.text
.globl _start
# incrementar 1 em todos os elementos do vetor
# i = s0
_start:
    li s0,0
    li s1,4

loop:
    slti t0,s0,10         # true se i < 10
    beq t0,zero,fimloop   # branch para fimloop se i >= 10
    mul t1,s0,s1          # calcular o offset do elemento atual do vetor
    la t2,vec             # carregar o endereço base do vetor
    add t2,t2,t1          # adicionar o offset ao endereço base
    lw t3,0(t2)           # carregar o valor do elemento atual do vetor
    addi t3,t3,1          # incrementar o valor
    sw t3,0(t2)           # armazenar de volta no vetor
    addi s0,s0,1          # incrementar o índice i
    j loop                # loop
fimloop:
    # seu código aqui após o loop, se necessário
    nop
