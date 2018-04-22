#!/usr/bin/spim -file
.data
msg0: .asciiz "\n - Grupo:\n\t- Icaro Targino;\n\t- Bruno Gomes;\n\t- Kaio Moura;\n\t- Artur Curty;\n\t- Giovanni Carvalho.\n"
msg1: .asciiz "\t *************************************\n\t ****** Sequencia de Hofstadder ******\n\t *************************************\n"
msg2: .asciiz "\t - TRABALHO DE ARQUITETURA -\t - PROFESSOR: YURI GONZAGA - "
msg3: .asciiz "\n\tEscreva o numero que você quer :\n\t"
msg4: .asciiz "\n"
msg6: .asciiz "\n VALOR FINAL \n:"

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

    #addi $s0, $v0, 1       #SOMA O VALOR EM $v0 COM 1 E ARMAZENA EM $s0
    #add $a0, $zero, 1     #SETA VALOR DE $a0 COMO 1
    jal Hofstadder
    #j Loop          #CHAMADA DA FUNÇÃO

    add $a0, $v0, $zero     #MOVE-SE ENTRE REGISTRADORES - $ZERO É A CONSTANTE 0

    li $v0, 1       #IMPRIME RESULTADO FINAL
    #la $a0, ($a1)
    syscall

    li $v0, 4       #COMANDO DE IMPRESSÃO DE UMA STRING NA TELA
    la $a0, msg6    #IMPRIME MENSAGEM ($a0 É O REGISTRADOR QUE IRÁ CONTER O VALOR A SER IMPRESSO)
    syscall         #CHAMADA DO SISTEMA

    li $v0, 10      # COMANDO DE EXIT
    syscall         # EFETUA CHAMADA AO SISTEMA

#Loop:                   #REPETE
#    beq $a0, $s0, End
#    jal Hofstadder

#    add $a2, $a0, $zero
#    add $a0, $zero, $v0

#    addi $v0, $zero, 1
#    syscall

#    li $v0, 4            #pula linha
#    la $a0, msg4
#    syscall

#    add $a0, $a2, $zero
#    addi $a0, $a0, 1
#    j Loop
#    jr $ra


Hofstadder:         #TAG DA FUNÇÃO

    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a1, 4($sp)
    sw $a0, 0($sp)

    beq $a0, 1, L1  #SE $a0 == 1 (SATISFAZ E VAI PRA L1) ou $a0 != (NÃO SATISFAZ E CONTINUA)
    beq $a0, 2, L1  #SE $a0 == 2 (SATISFAZ E VAI PRA L1) ou $a0 != (NÃO SATISFAZ E CONTINUA)

    #li $v0,1        #CHAMADA QUE IMPRIME UM INTEIRO
    #syscall

    add $a1, $a0, $zero         #a1 = a0 , vamos precisar do valor incicial de n
    addi $a0, $a0, -1          #a0 = a0 -1

    #primeira parte
    jal Hofstadder              #a(n-1)
    add $a0, $v0, $zero         #n = return de a(n-1)
    jal Hofstadder              #a(a(n-1))
    add $a0, $v0, $zero         #return de a(a(n-1))
    add $s3, $a0, $zero

    #segunda parte
    jal Hofstadder              #a(n-1)
    add $a0, $v0, $zero         #n = return de a(n-1)
    sub $a0, $a1, $a0           #return n-a(n-1)))
    jal Hofstadder              #a(n-a(n-1))
    add $a0, $v0, $zero         #return(a(n-a(n-1)))

    add $s4, $s3, $a0           #Soma H(1)+H(2)

    add $v0, $s4, $zero

    j EXIT

L1:

    add $v0, $zero, 1


EXIT:

    lw $a0, 0($sp)
    lw $a1, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

End:
    jr $ra