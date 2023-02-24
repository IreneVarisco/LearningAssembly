#Si supponga di avere nel segmento dati:
#Un array list che possa contenere un numero massimo di 128 elementi
#Una variabile HEAD che indica la prima posizione libera in testa alla lista
#Si implementino le seguenti procedure:
#insert : inserisce un elemento in testa alla lista
#delete : cancella un elemento arbitrario della lista e ricompatta l�array

.data
	A: .space 512
	head: .word 0
	
.text

la $a1 A #array a

la $a0 head
lw $a0 0($a0)

jal insert

jal delete

li $v0 10
syscall

#a0 head
#a1 array
insert:
	move $t0 $fp
	addiu $fp $sp -4
	
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	addiu $sp $fp -8
	
	add $t1 $t1 1 
	
	sw $t1 A($a0)
	addi $a0 $a0 4
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	
	move $fp $t0
	jr $ra

delete:
	move $t0 $fp
	addiu $fp $sp -4
	
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	addiu $sp $fp -8
	
	
	sw $zero A($a0)
	subi $a0 $a0 4
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	
	move $fp $t0
	jr $ra
