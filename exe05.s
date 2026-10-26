.data
	#Mensagens a serem exibidas
	msg1: .asciiz "Insira o primeiro numero: "
	msg2: .asciiz "Insira o segundo numero: "
	result: .asciiz "O resultado da somatoria e: "
.text
	main:
	#1. Receber os valores
	#primeiro numero
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#segundo numero
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# 2. identificar menor e maior
	bgt $t1, $t0, verify1    #Se $t1 > $t0, $t0 e menor
	
verify2:
	move $s0, $t1 #menor
	move $s1, $t0 #maior
	j cont_loop

verify1:
	move $s0, $t0 #menor
	move $s1, $t1 #maior

cont_loop:
	li $s2, 0     #contador em 0

loop:
	#verifica se menor ($s0) ja ultrapassou o maior
	bgt $s0, $s1, continua

	#verifica se $s0 e impar (bit 0 = 1)
	andi $t3, $s0, 1
	beq $t3, $zero, incrementa  #se for par (pula para incrementa)

	#se for impar, soma o valor de $s0 no acumulador $s2
	add $s2, $s2, $s0

incrementa:
	#avanca para o proximo numero
	addi $s0, $s0, 1
	j loop

continua:
	#mostra o resultado
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	#encerra o programa
	li $v0, 10
	syscall
	