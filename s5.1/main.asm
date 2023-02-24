#Procedura somma :
#Input: due interi a e b
#output: la somma a+b
#Procedura prodotto_s
#input: due interi a e b
#output: il prodotto a*b
#la procedura prodotto_s non utilizzi istruzioni di moltiplicazione ( mult et
#simila), ma calcoli il prodotto effettuando chiamate multiple alla procedura somma
#Esempio
#Il prodotto 3x2 è svolto come 3+3 oppure 2+2+2

.text

li $v0 5
syscall

add $a0 $zero $v0

li $v0 5
syscall

add $a1 $zero $v0

jal somma
add $a2 $zero $a0
add $a0 $zero $v0
li $v0 1
syscall

add $a0 $zero $a2
jal moltiplicazione

li $v0 10
syscall



#input a0=a a1=b
#output a+b  
somma:
	move $t0 $fp
	addiu $fp $sp -4

	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	
	add $v0 $a0 $a1

	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra
	
moltiplicazione:
	move $t0 $fp
	addiu $fp $sp -4
	
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	
	addiu $sp $fp -8
	
	add $t1 $zero $a1
	add $a1 $zero $a0
	
	ciclo:
		beq $t1 1 uscita
		jal somma
		add $a0 $zero $v0
		
		sub $t1 $t1 1
		j ciclo
	uscita:
		li $v0 1
		syscall
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra