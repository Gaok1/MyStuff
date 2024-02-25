loop:                   ; Início do loop
    mov     ecx, 64h    ; 'd' // Tamanho 64h = 100
    call    malloc      ; Aloca memória para a string (scanf espera um buffer para a string)
    mov     [rbp+resposta], rax ; Armazena o endereço alocado em resposta
    mov     rax, [rbp+resposta] ; Carrega o endereço da string alocada
    mov     rdx, rax     ; Configura rdx com o endereço da string (argumento para scanf)
    lea     rax, Format  ; Carrega o endereço da string de formato "%s"
    mov     rcx, rax     ; Configura rcx com o endereço da string de formato (argumento para scanf)
    call    scanf        ; Chama scanf para ler a string do usuário
    mov     rax, [rbp+resposta] ; Carrega o endereço da string alocada novamente
    mov     rcx, rax     ; Configura rcx com o endereço da string (argumento para checar)
    call    checar       ; Chama a função checar para verificar a string
    test    eax, eax     ; Testa o resultado da função checar
    jz      short loop   ; Se a verificação falhar (resultado igual a zero), pula para o início do loop


; Attributes: bp-based frame

; int __cdecl checar(char *resposta)
public checar
checar proc near

resposta= qword ptr  10h ; Reserva espaço na pilha para o parâmetro resposta 

push    rbp              ; Salva o valor atual do registrador de base da pilha (rbp)
mov     rbp, rsp         ; Inicializa o registrador de base da pilha (rbp) com o valor atual do ponteiro de pilha (rsp)
sub     rsp, 20h         ; Reserva espaço na pilha para variáveis locais (subtraindo 20h do ponteiro de pilha)

mov     [rbp+resposta], rcx ; Armazena o valor do parâmetro resposta no espaço reservado na pilha
mov     rax, [rbp+resposta] ; Carrega o valor do parâmetro resposta em rax

lea     rdx, Str2        ; Carrega o endereço da string "1234" em rdx
mov     rcx, rax         ; Configura rcx com o endereço da string resposta
call    strcmp           ; Chama a função strcmp para comparar as duas strings
test    eax, eax         ; Testa o resultado da função strcmp (se eax for zero, as strings são iguais)
jnz     short loc_140001809 ; Se as strings não forem iguais, pula para loc_140001809

lea     rax, Buffer      ; Carrega o endereço da string "Acesso permitido" em rax
mov     rcx, rax         ; Configura rcx com o endereço da string Buffer
call    puts             ; Chama a função puts para imprimir a string
mov     eax, 1           ; Configura eax com 1 (indicando sucesso)
jmp     short loc_14000181D ; Pula para loc_14000181D

loc_140001809:
lea     rax, aAcessoNegado ; Carrega o endereço da string "Acesso negado" em rax
mov     rcx, rax         ; Configura rcx com o endereço da string Buffer
call    puts             ; Chama a função puts para imprimir a string
mov     eax, 0           ; Configura eax com 0 (indicando falha)

loc_14000181D:
add     rsp, 20h         ; Libera o espaço na pilha reservado para variáveis locais
pop     rbp              ; Restaura o valor anterior do registrador de base da pilha (rbp)
retn                    ; Retorna da função
checar endp
