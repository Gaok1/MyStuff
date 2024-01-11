package LogicaRotor;

import java.util.Random;

public class Rotores {
    Rotor r1;
    Rotor r2;
    Rotor r3;
    Refletor refletor;

    public Rotores(int rotacao1, int rotacao2, int rotacao3) {
        Random rand = new Random(2);

        int seed1 = rand.nextInt();
        int seed2 = rand.nextInt();
        int seed3 = rand.nextInt();
        int seedRefletor = rand.nextInt();
        r1 = new Rotor(seed1, rotacao1);
        r2 = new Rotor(seed2, rotacao2);
        r3 = new Rotor(seed3, rotacao3);
        refletor = new Refletor(seedRefletor);
    }
    //setter para o rotores
    public void setRotor1(int num){
       r1.setRotacao(num);
    }

    public void setRotor2(int num){
        r2.setRotacao(num);
    }
    public void setRotor3(int num){
        r3.setRotacao(num);
    }

    public int criptografar(int entrada) {
        if(r1.rodar() == 1){
            if(r2.rodar() == 1){ // gira a cada volta completa de r1
                r3.rodar(); // gira a cada volta completa de r2
            }
        }
        int saida = r1.getSinalEntrada(entrada);
        saida = r2.getSinalEntrada(saida);
        saida = r3.getSinalEntrada(saida);
        saida = refletor.refletir(saida);
        saida = r3.getSinalSaida(saida);
        saida = r2.getSinalSaida(saida);
        saida = r1.getSinalSaida(saida);
        return saida;
    }


}