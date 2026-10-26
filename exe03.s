.data
	#Mensagens a serem exibidas
	msg1: .asciiz "Digite um numero: "
	msg2: .asciiz "Digite o segundo numero: "
	result: .asciiz "A diferenca do menor para o maior e: "
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
	
	#2. Calcular Diferenca
	#Estrutura de decisao SE/SENAO
	bgt $t0, $t1, maior
	
	sub $s3, $t1, $t0
	j resultado

maior:
	sub $s3, $t0, $t1
	
resultado:	
	#exibir resultado da diferenca
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	# Fim do programa
	li $v0, 10
	syscall
	
