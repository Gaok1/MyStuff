section .data
    codes: db '0123456789ABCDEF' ; Array de caracteres que representa os dígitos hexadecimais


;exibir o valor de rax em formato hexadecimal
section .text
global _start
_start:

    ; Configuração dos registradores
    mov rax, 0x1122334455667788 ; Número de 64 bits a ser convertido para hex
    ;colocando um numero de rax
    mov rdi, 1                  ; Descritor de arquivo (stdout)
    mov rdx, 1                  ; Número de bytes a serem escritos por syscall
    mov rcx, 64                 ; Contador para o loop ( rcx inicia em 64)

    lea rsi, [codes]            ; Carrega o endereço da string 'codes' em rsi
    
.loop:
    push rax                    ; Salva rax na pilha 
    sub rcx, 4                  ; Subtrai 4 do contador rcx (64 bits / 4 = 16 dígitos hexadecimais)

    sar rax, cl                 ; Desloca bits para a direita usando o contador como quantidade de bits
  
    and rax, 0xf                ; Máscara para manter apenas os últimos 4 bits (um dígito hexadecimal)

    add rsi, rax                ; Adiciona o valor do dígito a rsi para apontar para o caractere correto

    mov rax, 1                  ; Número da syscall para write
    push rcx                    ; Salva rcx na pilha
    syscall                     ; Escreve o dígito atual

    pop rcx                     ; Restaura rcx
    pop rax                      ; Restaura rax

    test rcx, rcx                ; Testa se rcx é zero (fim do loop)
    jnz .loop                   ; Se não for zero, continua o loop

    mov rax, 60                 ; Número da syscall para exit
    xor rdi, rdi                ; Código de saída zero (encerramento bem-sucedido)
    syscall                     ; Chama a syscall exit