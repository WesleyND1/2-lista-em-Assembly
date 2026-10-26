.data
	#mensagens a serem exibidas
	msg1: .asciiz "Digite o valor do raio: "
	result: .asciiz "O comprimento da circunferencia e: "
.text
	main:
	# 1. Receber Raio
	li $v0, 4
	la $a0, $v0
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# 2. Calcular Comprimento da circunfeerencia
	# C = 2 * PI * r
	li $t1, 2
	li $t2, 3
	
	mul $t3, $t1, $t0
	mul $t4, $t3, $t2
	
	
	
	# 3. exibir resultado
	li $v0, 1
	move $a0, $ta
	syscall
	
	
	# 4. finalizar o programa
	li $v0, 10
	syscall 
	