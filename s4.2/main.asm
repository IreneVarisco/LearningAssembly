#Si implementi la procedura *max* così definita:

#- Input: un intero `N` e un array `A` di `N` interi
#- Output: il valore massimo in `A`

#Si implementi la procedura *min* così definita:

#- Input: un intero `N` e un array `A` di `N` interi
#- Output: il valore minimo in `A`

#Si implementi infine il *main* che acquisisca i dati, chiami *max* e *min* e stampi i risultati restituiti.

.data
A: .word 1 2 3 4 8 5 6 7
l: .word 8

.text
la $t0 l
la $s0 A #array a
lw $s1 0($t0) #lunghezza
add $t1 $zero 4
jal max
jal min


li $v0 10
syscall

max:
	lw $a0 0($s0) # elemento
	add $t3 $s0 4 #indirizzo dopo elemento dopo
	mul $t4 $s1 4
	add $s4 $t4 $s0 
	j loopmax


loopmax:
	
	bgt $t3 $s4 return
	lw $s3, 0($t3)
	blt $a0 $s3 sostituzionemax
	add $t3 $t3 4
	j loopmax
	
sostituzionemax: 
	add $a0 $zero $s3
	j loopmax
	
min:
	lw $a0 0($s0) # elemento
	add $t3 $s0 4 #indirizzo dopo elemento dopo
	mul $t4 $s1 4
	add $s4 $t4 $s0 
	j loopmin


loopmin:
	bgt $t3 $s4 return
	lw $s3, 0($t3)
	bgt $a0 $s3 sostituzione
	add $t3 $t3 4
	j loopmin

sostituzione: 
	add $a0 $zero $s3
	j loopmin

return:
	li $v0 1
	syscall
	jr $ra
