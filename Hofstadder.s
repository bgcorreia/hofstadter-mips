#!/usr/bin/spim -file
.data
msg0: .asciiz "\n - Grupo:\n\t- Icaro Targino;\n\t- Bruno Gomes;\n\t- Kaio Moura;\n\t- Artur Curty;\n\t- Giovanni Carvalho.\n"
msg1: .asciiz "\t *************************************\n\t ****** Sequencia de Hofstadder ******\n\t *************************************\n"
msg2: .asciiz "\t - TRABALHO DE ARQUITETURA -\t - PROFESSOR: YURI GONZAGA - "
msg3: .asciiz "\n\tEscreva o numero que você quer :\n\t"

.text
.globl main
main:

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 4     #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0,  msg0  #IMPRIME MENSAGEM
    syscall        #CHAMADA DO SISTEMA

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0,  5          #CHAMADA QUE LÊ INTEIRO
    syscall             #CHAMADA DO SISTEMA



    li $v0, 10 # comando de exit
    syscall # efetua a chamada ao sistema