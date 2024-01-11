# MyStuffEnygma -  Enigma Machine Simulation

## Enygma - Enigma Machine Simulation

This project is a simulation of the Enigma Machine, a cryptographic device used by Nazi Germany during World War II. The code is implemented in Java and employs rotor logic to perform encryption and decryption of messages.

### Project Structure

- `Enygma.java`: The main class containing the main method for program execution. It handles user interaction and calls the main functionalities.
  
- `Rotores.java`: The class managing the rotors responsible for message encryption. It controls rotor rotation and utilizes the Rotor class for individual rotor operations.
  
- `Rotor.java`: The class representing an Enigma Machine rotor. It shuffles the alphabet letters based on a random seed and implements input and output signal operations.
  
- `Refletor.java`: The class representing the reflector of the Enigma Machine. It reflects the signal back to the rotors after passing through them.

### How to Use

#### Initial Configuration:

Upon starting the program, an opening banner will display information about the simulation.
The user will have options such as encrypting messages, configuring rotors, restarting the simulation, or exiting the program.

#### Available Commands:

- `-e`: Encrypts a message entered by the user.
- `-r1, -r2, -r3`: Configures rotors 1, 2, and 3, respectively. The user must provide a valid number for rotor configuration.
- `-r`: Restarts the simulation with default rotors.
- `-s`: Exits the program.
- `-h`: Displays information about available commands.

### Operation:

After choosing an option, the user can interact with the program by entering messages to be encrypted or by making configurations to the rotors.

### Termination:

Upon choosing the `-s` option, the program will display a closing banner and terminate execution.

### Notes

- The program utilizes rotor logic to simulate the Enigma Machine encryption.
- Rotors can be configured individually.
- The code is structured to facilitate expansion and maintenance.
- This is an educational project to understand the basic concepts of the Enigma Machine and its implementation in Java. Feel free to explore, modify, and learn from the source code.
