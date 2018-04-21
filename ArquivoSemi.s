#!/usr/bin/spim -file
.data
msg0: .asciiz "\n - Grupo:\n\t- Icaro Targino;\n\t- Bruno Gomes;\n\t- Kaio Moura;\n\t- Artur Curty;\n\t- Giovanni Carvalho.\n"
msg1: .asciiz "\t *************************************\n\t ****** Sequencia de Hofstadder ******\n\t *************************************\n"
msg2: .asciiz "\t - TRABALHO DE ARQUITETURA -\t - PROFESSOR: YURI GONZAGA - "
msg3: .asciiz "\n\tEscreva o numero que você quer :\n\t"
msg4: .asciiz "\n IGUAL A 1 OU 2\n"
msg5: .asciiz "\n NAO E IGUAL A 1 OU 2\n"

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

    beq $a0, 1, L1  #SE $a0 == 1 (SATISFAZ E VAI PRA L1) ou $a0 != (NÃO SATISFAZ E CONTINUA)
    beq $a0, 2, L1  #SE $a0 == 2 (SATISFAZ E VAI PRA L1) ou $a0 != (NÃO SATISFAZ E CONTINUA)

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg5    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    add       $a1, $a0, $zero    #a1 = a0 :: ATRIBUIÇÃO PARA OUTRA VARIÁVEL DE MODO A MANTER O VALOR
    addi      $a0, $a0 , -1      #a0 = a0 -1 :: DECREMENTAÇÃO
    jal       CalcSeq            #a(n-1) :: PRIMEIRA CHAMADA RECURSIVA
    add       $a0, $v0, $zero    #n = return de a(n-1) :: ATRIBUIÇÃO DA RECURSÃO A UM $a0
    jal       CalcSeq            #a(a(n-1)) :: SEGUNDA CHAMADA RECURSIVA
    add       $a0, $v0, $zero    #n = return de a(a(n-1)) :: ATRIBUIÇÃO DA RECURSÃO DA RECURSÃO A UM $a0



    jr $ra          #RETURN (RETORNA PARA O LUGAR DE ORIGEM ONDE FOI CHAMADO)

L1:
    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg4    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    jr $ra          #RETURN (RETORNA PARA O LUGAR DE ORIGEM ONDE FOI CHAMADO)
