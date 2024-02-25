section .data
; db = define byte
exmp1: db 5, 16, 8, 4, 2, 1 ;definimos armazem de bytes para os valores 5, 16, 8, 4, 2, 1
;ou seja 
exmp2: times 999 db 42 ;times n comand é diretiva para repetir o comando n vezes// times 999 (db 42)
exmp3: dw 999
message: db 'hello world',10 ;definimos armazem de bytes para a string hello world e 1 byte(10) e 10 é '\n em ascii
                                                                                    ;para quebra de linha


