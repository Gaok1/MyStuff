; todo programa é limitado a system calls do SO, todo programa ao ser executado carrega:
; o stdin(descritor = 0), stdout(descritor = 1) e stderr(descritor = 2)
; para printar hello world devemos usar a system call write (que é a chamada de sistema para escrever na tela) e passar os parametros:
; 1 - descritor de arquivo (stdout = 1)


; em assembly algumas palavras sao reservadas para construçao do programa e nao linguagem de maquina direta
; global, db e section sao algumas delas
;db = define byte, define um byte na memoria, 1 byte = 8 bits
    ;db, dw,dd, dq com 1,2,4,8 bytes respectivamente um inteiro seria dd por exemplo (4 bytes)
    ;define byte, define word, define doubleword, define quadword


; como a arquitetura de vonNeumann nao difere dados e instruçooes, o programa é separado por sections para intruçoes e dados
section .data ; section para dados globais
    message: db 'hello world', 10 ; 10 é o \n em ASCII

section .text ; section para instruçoes
global _start

_start: ;rotulo para o inicio do programa

    mov rax, 1     ; o número da chamada de sistema deve ser armazenado no registrador rax
    mov rdi, 1     ; o argumento #1 em rdi: onde escrever (descritor)?
    mov rsi, message ; o argumento #2 em rsi: onde começa a string?
    mov rdx, 14     ; o argumento #3 em rdx: quantos bytes escrever?
    syscall         ; chamada de sistema para escrever na tela

    mov rax, 60    ; o número da chamada de sistema deve ser armazenado no registrador rax
    xor rdi, rdi    ; funçao de xor para zerar rdi, compara rdi xor rdi resulta em 0

    syscall        ; chamada de sistema para terminar o programa
