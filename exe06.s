.data
	#Mensagens a serem exibidas
	msg_num:      .asciiz "\nDigite um numero positivo: "
	msg_invalido: .asciiz "Valor invalido! Apenas numeros positivos sao permitidos.\n"
	msg_maior:    .asciiz "\nMaior valor: "
	msg_menor:    .asciiz "\nMenor valor: "

.text
.globl main

main:
    li $t0, 0          #contador inicia em 0 
    li $t1, 10         #total de numeros a receber

loop:
    # Verifica se já lemos os 10 números válidos
    beq $t0, $t1, exibe_resultados

    # Exibe a mensagem solicitando o número
    li $v0, 4
    la $a0, msg_num
    syscall

    #le o numero digitado pelo usuario
    li $v0, 5
    syscall
    move $t2, $v0

    #verificacao: Se $t2 < 0 (bltz= se menor que zero), invalida
    bltz $t2, numero_invalido

    #se for o primeiro numero valido ($t0 == 0)
    beq $t0, $zero, armazenar_valores

    #atualiza o maior: se $t2 > $s0 (maior)
    bgt $t2, $s0, atualiza_maior
testa_menor:
    #atualiza o menor: Se $t2 < $s1 (menor)
    blt $t2, $s1, atualiza_menor
    j avanca_contador

armazenar_valores:
    move $s0, $t2      # $s0 armazena o maior valor
    move $s1, $t2      # $s1 armazena o menor valor
    j avanca_contador

atualiza_maior:
    move $s0, $t2
    j testa_menor

atualiza_menor:
    move $s1, $t2

avanca_contador:
    addi $t0, $t0, 1   #incrementa o contador de numeros validos
    j loop

numero_invalido:
    #mensagem para numeros negativos
    li $v0, 4
    la $a0, msg_invalido
    syscall
    j loop

exibe_resultados:
    #mostra o maior numero
    li $v0, 4
    la $a0, msg_maior
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    #mostra o menor numero
    li $v0, 4
    la $a0, msg_menor
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    #encerra o programa
    li $v0, 10
    syscall