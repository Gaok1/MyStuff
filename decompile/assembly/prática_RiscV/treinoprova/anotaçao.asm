beq = desvia se for igual -> beq,s0,s1, label
bne = desvia se for diferente -> bne, s0,s1,label
blt = desvia se for menor -> blt s0,s1, label (branch less than)
bge = desvia se for maior ou igual -> bge s0,s1,label 
bltu = desvia se for menor -> blt s0,s1, label (branch less than unsigned) !despreza sinal 
bgeu = desvia se for maior ou igual -> bge s0,s1,label  !despreza sinal 


set 1 if less than
slt s0,t0,t1
sltu s0,t0,t1 !despreza sinal

slti s0,t0,15 !utiliza imediato
sltiu so,t0,23 !despreza sinal

## Indocincionais
j label -> pula para a label sem condiçao
jr ra  -> endereço de retorno
ret  ->  comando para retornar 
jal a0, label  -> salva endereço do proximo comando para aplicar ret
jal ra, label -> 
jalr a0,al,0 ->
jal label //endereço do proximo comando é salvo em ra

.text

.globl _start

_start:



li t0 ,100
li t1,10

li s0,0#a = s0;
li s1,0 #i = s1;
loop1:
    bge s1,t0,FIMloop1 # i >=100 -> para
    li s2,0 #j = 0#  j = s2;
    loop2:
        bge s2,t1,FIMloop2 #  j >= 10
        add s0,s0,s1 # a +=i
        sub s0,s0,s2 # a -= j

        addi s2,s2,2 #j+=2
        j loop2
    FIMloop2:
    addi s1,s1,1 # i++
    j loop1
FIMloop1:





.data
A: .word 1,3,5,7,9
B: .word 2,4,6,8,10
C: .word 0,0,0,0,0



