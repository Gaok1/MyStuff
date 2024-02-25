section .data
mssg : db "Hello World!!", 10


section .text
global _start
_start:
    
mov rax,1 ;output syscall; preparando a chamada
mov rdi,1 ;stdout //indicando o arquivo de saida como argumento
mov rsi, msg ;endereço da string
mov rdx, 10 ; quantos bytes serao escritos a partir do endereço da string
;a syscall write tem 3 argumentos, rdi, rsi e rdx (registradores para argumentos)

syscall