#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//senha como constante
#define SENHA "1234" //senha padrao

int checar(char * resposta){ //funcao para checar a senha
    if(strcmp(resposta, SENHA) == 0){ //comparando a resposta com a senha
        printf("Acesso permitido\n"); //se for igual, acesso permitido
        return 1; //retornando 1 para sair do programa
    }
    printf("Acesso negado\n"); //se nao, acesso negado

    return 0; //retornando 0 para continuar o programa
}


int main(void){

    loop: //definição do loop

    char * resposta = malloc(sizeof(char) * 100); //declarando a variavel resposta
    scanf("%s", resposta); //lendo a resposta do usuario

   if( checar(resposta) ) return 0; //chamando a funcao checar
    goto loop; //voltando para o loop
}