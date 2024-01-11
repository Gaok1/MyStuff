package LogicaRotor;

//O ROTOR É composto de 26 entradas, uma para cada letra do alfabeto, e 26 saídas
//O rotor é um dispositivo de substituição monoalfabética
// cada rotor possui embaralhamento diferentes em circuistos internos

import java.util.Random;


class Rotor{
    int embaralhamento[] = new int[26]; //vetor que representa embaralamento do rotor
    //entrada e saida devem ser correspondentes (entrada -> saida assim como saida -> entrada)

    private int seed; //semente para o random
    int rotacao; // simula a rotacao do rotor
    Rotor(int seed, int rotacao) {
        this.seed = seed; //seed para o embaralhamento dos rotores
        this.rotacao = rotacao;

        Random random = new Random(seed);
        boolean[] ocupado = new boolean[26];

        for (int i = 0; i < 26; i++) {
            int aux = random.nextInt(26);
            while (ocupado[aux]) { //garante que nao há numeros iguais
                aux = random.nextInt(26);
            }
            embaralhamento[i] = aux;
            ocupado[aux] = true;
        }
    }

    public void setRotacao(int rotacao){
        this.rotacao = rotacao;
    }

    int getSinalEntrada(int entrada) {
        entrada = (entrada + rotacao) % 26;
        return embaralhamento[entrada];
    }

    int getSinalSaida(int saida) {

        for (int i = 0; i < 26; i++) {
            if (embaralhamento[i] == saida) {
                int num = ((i - rotacao) % 26);
                if (num < 0) num*= -1;
                return num; 
            }
        }
        throw new IllegalArgumentException("Sinal de saída inválido: " + saida);
    }

    int rodar(){
        rotacao = (rotacao + 1) % 26;
        if(rotacao == 0) return 1;
        else return 0;
        
    }

    

}