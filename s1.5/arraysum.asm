
#Si scriva il codice Assembly che effettui:
#A[12] = h + A[8];
#Si assuma che:
#• h sia una variabile memorizzata nel segmento dati;
#• A sia un array di 15 elementi memorizzato nel segmento dati;
#Si inizializzino h e A con valori a piacere utilizzando delle direttive per l’assembler
#nel segmento dati.

	.data 
	A: .word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	h: .word 7
	
	.text
	
	add $t0, $zero, 28
	add $t1, $zero, 44
	lw $s0 A($t0)
	lw $s1 h
	
	add $s3, $s0, $s1
	
	sw $s3, A($t1)