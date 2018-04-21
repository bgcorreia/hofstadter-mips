#!/usr/bin/spim -file
.data
msg0: .asciiz "\n - Grupo:\n\t- Icaro Targino;\n\t- Bruno Gomes;\n\t- Kaio Moura;\n\t- Artur Curty;\n\t- Giovanni Carvalho.\n"
msg1: .asciiz "\t *************************************\n\t ****** Sequencia de Hofstadder ******\n\t *************************************\n"
msg2: .asciiz "\t - TRABALHO DE ARQUITETURA -\t - PROFESSOR: YURI GONZAGA - "
msg3: .asciiz "\n\tEscreva o numero que você quer :\n\t"
msg4: .asciiz "\n ESTOU DENTRO DA FUNCTION\n"

.text
.globl main         #MAIN()
main:               #PONTO DE ENTRADA

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg2    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0,  msg0   #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg1    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg3    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    li $v0,  5      #CHAMADA QUE LÊ INTEIRO
    syscall         #CHAMADA DO SISTEMA

    add $a0, $v0, $zero      #VALOR LIDO FICA EM $a0
    jal Hofstadder          #CHAMADA DA FUNÇÃO
    add $a0, $v0, $zero     #MOVE-SE ENTRE REGISTRADORES - $ZERO É A CONSTANTE 0

    li $v0, 10      # COMANDO DE EXIT
    syscall         # EFETUA CHAMADA AO SISTEMA

Hofstadder:         #TAG DA FUNÇÃO

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg4    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA



    jr $ra          #RETURN (RETORNA PARA O LUGAR DE ORIGEM ONDE FOI CHAMADO)