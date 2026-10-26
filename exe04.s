.data
	#Mensagens a serem exibidas
	msg1: .asciiz "Digite a primeira nota: "
	msg2: .asciiz "Digite a segunda nota: "
	msg3: .asciiz "Digite a terceira nota: "
	msg4: .asciiz "Digite a quarta nota: "
	
	media: .asciiz "A media aritmetica e: "
	msg5: .asciiz "\nAPROVADO"
	msg6: .asciiz "\nEXAME"
	msg7: .asciiz "\nREPROVADO"
	
.text
	main:
	#1. Receber os valores
	#primeira nota
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	#segunda nota
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	#terceira nota
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	#quarta nota
	li $v0, 4
	la $a0,msg4
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	#2. Calcular media
	add $s0, $t0, $t1	
	add $s1, $t2, $t3
	add $s2, $s0, $s1
	
	li $t4, 4
	div $s3, $s2, $t4
	
	#Exibir media
	li $v0, 4
	la $a0, media
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
	
	#3. Verificar Media
	#Aprovado
	li $t0, 6
	bge $s3, $t0, aprov
	
	#Exame
	li $t0, 3
	bge $s3, $t0, exam
	
	#Retido
	li $t0, 3
	blt $s3,$t0, retido 
	
	
aprov:
	li $v0, 4
	la $a0, msg5
	syscall
	j continua

exam:
	li $t0, 6
	blt $s3, $t0, exame
	exame:
		li $v0, 4
		la $a0, msg6
		syscall
		j continua
retido:
	li $v0, 4
	la $a0, msg7
	syscall


continua:
	#encerrar o Programa
        li $v0, 10
        syscall
	
	