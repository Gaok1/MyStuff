package LogicaRotor;

import java.util.Random;

public class Refletor {
    private int seed;
    private int cript[] = new int[26]; // vetor que representa embaralhamento do rotor

    public Refletor(int seed) {
        this.seed = seed;
        Random random = new Random(seed);
        boolean[] ocupado = new boolean[26];

        for (int i = 0; i < 26; i++) {
            int aux = random.nextInt(26);
            while (ocupado[aux]) {
                aux = random.nextInt(26);
            }
            cript[i] = aux;
            ocupado[aux] = true;
        }
    }

    public int refletir(int saida) {
        return cript[saida];
    }
    public int desrefletir(int saida){
        for (int i = 0; i < 26; i++) {
            if (cript[i] == saida) {
                return i;
            }
        }
        throw new IllegalArgumentException("Sinal de saída inválido: " + saida);
    }
}
