.data
	#Mensagens a serem exibidas
	msg1: .asciiz "Digite o valor do comprimeto: "
	msg2: .asciiz "Digite o valor do largura: "
	msg3: .asciiz "Digite o valor do altura: "
	msg4: .asciiz "O volume do paralelepipedo e: "
.text
	main:
	#1. Receber os valores
	#valor do comprimento
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#valor da largura
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#valor da altura
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	# 2. Calcular Volume
	# V = a * b * c
	mul $t3, $t0, $t1	#$t3 = (a * b)
	mul $t3, $t3, $t2	#$t3 = ($t3 * $t2)
	
	move $s0, $t3
	
	#3. Mostrar o resultado
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall
	