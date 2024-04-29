.data
array: .word 5,1,2,8,23,100,7,5,8,9 # 10 posições de 4 bytes cada

.text
.globl main


main:
la s0, array #base do array -> modifique para caso usar outro array
li s1, 0 #i -> começa de 0
li a0, 10 #tamanho do array  -> modifique para caso usar outro array
forI:
 #enquanto i < 10 -1 -> i < 9 !== i>=9
    bge s1, a0, Ordenado
    mv s2, s1 #j = i
    addi s2,s2,1 #j = i + 1

    mv t0,s1 #i
    slli t0,t0,2 #i*4
    add t0,t0,s0 #&array[i]

    mv s3,t0 #&array[i]
    lw s4,0(s3)#array[i] -> maior value
    ForJ:
    #comparar array[j] com array[maiorIndice] 
        bge s2,a0, fimForI #j >= 10 -> volta para o forI
        slli t0, s2, 2
        add t0, t0,s0 #indice do array[j]
        lw t1,0(t0) #array[j]
        bge t1,s4, naoTroca #array[j] < array[i] -> troca
        troca:
            sw t1,0(s3) #array[j] = array[maiorIndice]
            sw s4,0(t0) #array[maiorIndice] = array[j]
            mv s4,t1 #maiorIndice = array[j]

        naoTroca:
        addi s2,s2,1 #j++
        j ForJ
    fimForI:
    addi s1,s1,1 #i++
    j forI
Ordenado:
