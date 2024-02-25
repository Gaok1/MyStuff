#include <stdio.h>
#include <stdarg.h>

double calcularMedia(int num, ...) {
    va_list args; // Objeto va_list para acessar os argumentos variáveis
    double soma = 0.0;
    
    // Inicializa o objeto va_list com va_start
    va_start(args, num); 

    // Percorre os argumentos variáveis
    for (int i = 0; i < num; i++) {
        // Acessa o próximo argumento na lista com va_arg
        soma += va_arg(args, double); // Soma os argumentos do tipo double
        
    }

    // Finaliza o uso do objeto va_list com va_end
    va_end(args);

    // Calcula e retorna a média
    return soma / num;
}

int main() {
    // Chamada da função calcularMedia com diferentes números de argumentos
    printf("Média 1: %.2f\n", calcularMedia(3, 2.5, 3.5, 4.5));
    printf("Média 2: %.2f\n", calcularMedia(5, 1.0, 2.0, 3.0, 4.0, 5.0));
    printf("Média 3: %.2f\n", calcularMedia(2, 10.0, 20.0));
    
    return 0;
}
