#Si scriva un programma che:

#* chieda all�utente di inserire un array di interi di dimensione arbitraria (si scelga una dimensione massima da non eccedere). 
#* invochi una procedura P 
#* stampi il valore ritornato da P

#La procedura P � definita come segue:

#* Input: l�array inserito dall�utente e un parametro k
#* se k=0 la procedura calcola la somma di tutti gli interi in posizione (indice nell�array) dispari
#* se k=1 sommer� quelli in posizioni pari.

#Suggerimento: allocare l�array staticamente in memoria e passare alla procedura il base address (passaggio per indirizzo).

.data
	s: .asciiz "inserire lunghezza array"
	s1: .asciiz "inserire elementi array"
	.align 2
	A: .space 10
 
.text

li $v0 4
la $a0 s
syscall

li  $v0 5
syscall

add $t0 $zero $v0 #a

la $a0 A

inizio:
	beq $t0 $t4 exit
	
	li  $v0 5
	syscall

	add $t5 $zero $v0 #a
	
	sw $t5 0($a0)
	add $a0 $a0 4
	add $t4 $t4 1
	j inizio
	exit:
	li  $v0 5
	syscall

	add $a1 $zero $v0 #a
	
	la $a0 A
	jal P
	
	add $a0 $zero $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall



#input a0:array a1:parametro k
#output v0:somma dei pari o dei dispari
P:
	move $t0 $fp
	addiu $fp $sp -4
	sw $t0 0($fp)
	sw $sp -4($fp)
	sw $ra -8($fp)
	
	add $t1 $zero $zero
	la $t2 40($a0)
	beqz $a1 dispari
	beq $a1 1 ciclo
	
	dispari:
	add $a0 $a0 4
	
	ciclo:
		bgt $a0  $t2 uscita
		lw $t3 0($a0)
		add $t1 $t1 $t3
		
		add $a0 $a0 8
		j ciclo
		uscita:
		add $v0 $zero $t1
	
	lw $t0 0($fp)
	lw $sp -4($fp)
	lw $ra -8($fp)
	move $fp $t0
	jr $ra