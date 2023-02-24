#Scrivere una procedura converti che converta in maiuscolo una stringa in input. Si
#faccia uso di una seconda procedura converti_singolo_carattere che converta solo una
#lettera minuscola alla volta.
#Non si fanno assunzione sul quali caratteri possa contenere la stringa in input.
#Suggerimento: usare SB e LB (StoreByte e LoadByte) per gestire dati non allineati.
.data 
s: .word 1
.text

li $v0 8
la $a0 s
li $a1 20
syscall

sub $a1 $a1 1
ciclo:
beq $a2 $a1 uscita
jal converti_singolo_carattere
add $a2 $a2 1

j ciclo
uscita:
la $a0 s
li $v0 4
syscall

li $v0 10
syscall

#aa carattere
converti_singolo_carattere:
	move $t0 $fp
	addiu $fp $sp 4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	
	addiu $sp $fp -8
	
	lb $t1 s($a2) #c
	beq $t1 32 spazio
	beq $t1 0 spazio
	beq $t1 10 spazio
	sub $v0 $t1 32
	sb $v0 s($a2)
	spazio:
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	
	move $fp $t0
	jr $ra
	