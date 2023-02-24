#*nome del file sorgente: branch3equal.asm*

#Si implementi la procedura branch3equal così definita:

#- Input: tre valori interi, due indirizzi del segmento testo
#- Output: nessuno

#Se i tre valori interi sono uguali viene fatto un salto al primo indirizzo del segmento
#testo. Se i tre valori sono tutti diversi fra loro viene fatto un salto al secondo indirizzo del segmento testo. 
#In ogni altro caso, non viene effettuato nessun salto e l’esecuzione procede da PC + 4.

.text
li  $v0 5
syscall

add $a0 $zero $v0 #a

li  $v0, 5
syscall

add $a1 $zero $v0 #b

li  $v0, 5
syscall

add $a2 $zero $v0 #c

la $a3 fra
la $t0 bro


addi $sp $sp -4
sw $t0 ($sp)

jal branch3

li  $v0, 10
syscall

# branch 3
# a0 a1 a2  i 3 valori in input
# a3 a4     2 indirizzi segmento testo
#output nessuno

branch3:
	move $t0 $fp
	addiu $fp $sp -4
	
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	
	lw $t0 ($sp)
	addi $sp $sp 4
	beq $a0 $a1 eq
	bne $a0 $a1 ne
	j jump
	
	eq:
	beq $a1 $a2 eq2
	j jump
	
	eq2:
	jr $a3
	
	ne:
	bne $a1 $a2 ne2
	j jump
	
	ne2:
	jr $t0
	
	jump:
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	
	move $fp $t0
	jr $ra
	
	
fra:
	li $s0 1
	li  $v0, 10
	syscall


bro:
	li $s1 1
	li  $v0, 10
	syscall
