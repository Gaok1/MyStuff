# MyStuffEnygma - Simulação da Máquina Enigma

Enygma - Enigma Machine Simulation
This project is a simulation of the Enigma Machine, a cryptographic device used by Nazi Germany during World War II. The code is implemented in Java and employs rotor logic to perform encryption and decryption of messages.

Project Structure
Enygma.java: The main class containing the main method for program execution. It handles user interaction and calls the main functionalities.

Rotores.java: The class managing the rotors responsible for message encryption. It controls rotor rotation and utilizes the Rotor class for individual rotor operations.

Rotor.java: The class representing an Enigma Machine rotor. It shuffles the alphabet letters based on a random seed and implements input and output signal operations.

Refletor.java: The class representing the reflector of the Enigma Machine. It reflects the signal back to the rotors after passing through them.

How to Use
Initial Configuration:

Upon starting the program, an opening banner will display information about the simulation.
The user will have options such as encrypting messages, configuring rotors, restarting the simulation, or exiting the program.
Available Commands:

-e: Encrypts a message entered by the user.
-r1, -r2, -r3: Configures rotors 1, 2, and 3, respectively. The user must provide a valid number for rotor configuration.
-r: Restarts the simulation with default rotors.
-s: Exits the program.
-h: Displays information about available commands.
Operation:

After choosing an option, the user can interact with the program by entering messages to be encrypted or by making configurations to the rotors.
Termination:

Upon choosing the -s option, the program will display a closing banner and terminate execution.
Notes
The program utilizes rotor logic to simulate the Enigma Machine encryption.
Rotors can be configured individually.
The code is structured to facilitate expansion and maintenance.
This is an educational project to understand the basic concepts of the Enigma Machine and its implementation in Java. Feel free to explore, modify, and learn from the source code.





==PT-BR VERSION==
Este projeto consiste em uma simulação da Máquina Enigma, um dispositivo de criptografia utilizado pela Alemanha Nazista durante a Segunda Guerra Mundial. O código está implementado em Java e utiliza uma lógica de rotores para realizar a criptografia e decriptografia das mensagens.

Estrutura do Projeto
Enygma.java: Classe principal que contém o método main para execução do programa. Responsável pela interação com o usuário e chamada das funcionalidades principais.

Rotores.java: Classe que gerencia os rotores, responsáveis pela criptografia das mensagens. Controla a rotação dos rotores e utiliza a classe Rotor para as operações de cada rotor individualmente.

Rotor.java: Classe que representa um rotor da Máquina Enigma. Realiza o embaralhamento das letras do alfabeto de acordo com uma semente aleatória e implementa as operações de entrada e saída do sinal.

Refletor.java: Classe que representa o refletor da Máquina Enigma. Ele reflete o sinal de volta para os rotores após passar por eles.

Como Usar
Configuração Inicial:

Ao iniciar o programa, será exibido um banner de abertura, mostrando informações sobre a simulação.
O usuário terá opções como encriptar mensagens, configurar rotores, reiniciar a simulação ou sair do programa.
Comandos Disponíveis:

-e: Encripta uma mensagem digitada pelo usuário.
-r1, -r2, -r3: Configura os rotores 1, 2 e 3, respectivamente. O usuário deve fornecer um número válido para a configuração do rotor.
-r: Reinicia a simulação com rotores padrão.
-s: Encerra o programa.
-h: Exibe informações sobre os comandos disponíveis.
Operação:

Após escolher uma opção, o usuário pode interagir com o programa digitando mensagens para serem encriptadas ou realizar configurações nos rotores.
Encerramento:

Ao escolher a opção -s, o programa exibirá um banner de encerramento e finalizará a execução.
Observações
O programa utiliza a lógica de rotores para simular a criptografia da Máquina Enigma.
Os rotores podem ser configurados individualmente.
O código está estruturado para facilitar a expansão e manutenção.
Este é um projeto educacional para entender os conceitos básicos da Máquina Enigma e sua implementação em Java. Sinta-se à vontade para explorar, modificar e aprender com o código fonte.