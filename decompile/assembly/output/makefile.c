#include <stdio.h>
#include <stdlib.h>

#define MAX_COMMAND_LENGTH 100

int execute(char *command) {
    return system(command);
}

int main(void) {
    FILE *fp = fopen("makefile.txt", "r");

    if (fp == NULL) {
        perror("Erro ao abrir o arquivo makefile.txt");
        return 1;
    }

    char command[MAX_COMMAND_LENGTH];

    while (fgets(command, sizeof(command), fp) != NULL) {
        // Remover a quebra de linha do final do comando
        size_t length = strlen(command);
        if (length > 0 && command[length - 1] == '\n') {
            command[length - 1] = '\0';
        }

        int result = execute(command);

        // Verificar se a execução foi bem-sucedida
        if (result != 0) {
            fprintf(stderr, "Erro ao executar o comando: %s\n", command);
        }
    }

    fclose(fp);

    return 0;
}
