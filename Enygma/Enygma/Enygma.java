import LogicaRotor.*;

import java.util.Scanner;

public class Enygma {
    private Rotores logicaRotores;
    
    Enygma(int rotor1, int rotor2, int rotor3) {
        logicaRotores = new Rotores(rotor1, rotor2, rotor3);
    }

    public static int[] prepareCripto(String mess) {
        int size = mess.length();
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) { // a - z = 0 - 25
            if(mess.charAt(i) >= 97 && mess.charAt(i) <= 122)
            arr[i] = (int) mess.charAt(i) - 97;
        }
        return arr;
    }

    public void Criptografar(String mensagem) {
        while (mensagem != null && !mensagem.equals("")) {
        
        String nova = "";
        int arr[] = prepareCripto(mensagem);
        for (int i = 0; i < mensagem.length(); i++) {
            arr[i] = this.logicaRotores.criptografar(arr[i]);
            nova += (char) (arr[i] + 97);
        }
        System.out.println(nova);
        mensagem = MyIO.readLine().toLowerCase();
    }
    
    }

    public static void main(String[] args) {
        Enygma machine = new Enygma(10, 11, 12);

        abertura();
        

        String mensagem = "";
        do {
            System.out.println("-h para comandos:");
            mensagem = MyIO.readLine().toLowerCase();
            if (mensagem.equals("-e")) {
                machine.Criptografar(MyIO.readLine().toLowerCase());
            }else if(mensagem.equals("-h")){
                Help();
            }else if(mensagem.equals("-c")){
                machine.Configurar(machine);
            }
            else if(mensagem.equals("-r")){
                machine = new Enygma(10, 11, 12);
            }
            else if(mensagem.equals("-s")){
                System.out.println("Saindo...");
            }
            else{
                System.out.println("Comando invalido!");
            }
        } while (!mensagem.equals("-s"));

        encerrar();
    }

    public static void abertura() {
        System.out.println("============================");
        System.out.println("        E N Y G M A         ");
        System.out.println("============================");
        System.out.println("  Programa de Simulação      ");
        System.out.println("     da Máquina Enigma       ");
        System.out.println("============================");
        System.out.println("  Desenvolvido por: Gaok1");
        System.out.println();
    }

    public static void Help(){
         System.out.println("============================");
        System.out.println("        E N Y G M A         ");
        System.out.println("============================");
        System.out.println("  Comandos:                  ");
        System.out.println("  -h: Ajuda                  ");
        System.out.println("  -c : Configurar rotores    ");               
        System.out.println("  -e : Encriptar             ");
        System.out.println("  -d : Decriptar             ");
        System.out.println("  -s : Sair                  ");
        System.out.println("-r : reiniciar               ");
        System.out.println("============================");
        System.out.println("  Desenvolvido por: Gaok1");
        System.out.println();
    }

    public  void Configurar(Enygma machine){
        System.out.println("============================");
        System.out.println("        E N Y G M A         ");
        System.out.println("============================");
        System.out.println("  Configurar rotores:        ");
        System.out.println("  -r1 : Rotor 1              ");
        System.out.println("  -r2 : Rotor 2              ");
        System.out.println("  -r3 : Rotor 3              ");
        System.out.println("  -s : Sair                  ");
        System.out.println("============================");
        System.out.println("  Desenvolvido por: Gaok1");
        System.out.println();
        String message = GetMessage();
        // poderia manipular com array,mas ja fiz até aqui assim e to com preguiça de mudar
        if(message.equals("-r1")){
            System.out.println("Digite o numero do rotor 1: ");
            int num = MyIO.readInt();
            if(num > 26 || num < 0){
                System.out.println("Numero invalido!");
            }
            else{
                machine.logicaRotores.setRotor1(num);
            }
            // setar o rotor 1
        }
        else if(message.equals("-r2")){
            System.out.println("Digite o numero do rotor 2: ");
            int num = MyIO.readInt();
            if(num > 26 || num < 0){
                System.out.println("Numero invalido!");
            }
            else{
                machine.logicaRotores.setRotor2(num);
            }
            // setar o rotor 2
        }
        else if(message.equals("-r3")){
            System.out.println("Digite o numero do rotor 3: ");
            int num = MyIO.readInt();
            machine.logicaRotores.setRotor3(num);
            if(num > 26 || num < 0){
                System.out.println("Numero invalido!");
            }
            else{
                machine.logicaRotores.setRotor2(num);
            }
            // setar o rotor 3
        }
        else if(message == "-s"){
            System.out.println("Saindo...");
            // sair
        }
        else{
            System.out.println("Comando invalido!");
            // comando invalido
        }


    }

    public static String GetMessage(){
        String message = MyIO.readLine().toLowerCase();
        return message;
    }

    

    public static void encerrar() {
        System.out.println("============================");
        System.out.println("  Programa Enigma encerrado. ");
        System.out.println("   Obrigado por usar!        ");
        System.out.println("============================");
    }
}
