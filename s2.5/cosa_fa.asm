	.data
v:	.byte 2,0,0,0,4,0,0,0
array:	.byte 2,0,0,0,3,0,0,0,5,0,0,0,7,0,0,0,11,0,0,0,13,0,0,0,17,0,0,0,19,0,0,0

	.text
	.globl main
main:
	la $s1 array #indirizzo di array
	la $s2 v #indirizzo di v

	lw $t0 0($s2) #metto il contenuto di v[0] in $t0
	addi $t0 $t0 -1 #tolgo 1 al contenuto di v[0]
	mul $t0 $t0 4 #moltiplico v[0] per 4
	add $t1 $s1 $t0 # somma l'indirizzo di array al valore di v[0] e la inserisce in t1
	lw $t2 0($t1) # t2 < array[v[0]-1] 
	addi $t2 $t2 1 #aggiunge 1 a t2

	lw $t0 4($s2) # inserisco in t0 v[1]
	addi $t0 $t0 -1 #si sottrae 1 a v[1]
	mul $t0 $t0 4 #si moltiplica v[1] per 4
	add $t3 $s1 $t0  #aggiungo v[1] all'indirizzio array e lo metto in t3
	lw $t4 0($t3) #inserisco in t4 t0[0]
	addi $t4 $t4 -1 #sottrae 1 a t4

	sw $t2 0($t3) #inserisce in t3[0] t2
	sw $t4 0($t1) #inserisce in t1[0] t4

	li $v0 10 #termino
	syscall
