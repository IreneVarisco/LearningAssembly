#nome del file sorgente: rwmemoria2.asm
#Si scriva il codice Assembly che effettui:
#A[c-1] = c*(B[A[c]] + c)/A[2*c-1]
#Si assuma che:
#• A e B siano vettori di elementi, ogni elemento è un intero a 32 bit;
#• c sia una variabile intera a 32 bit.
#Si inizializzino i dati in memoria in questo modo:
#c=2
#A[0]=-1
#A[1]=-1
#A[2]= 1
#A[3]= 4
#B[0]=-1
#B[1]= 6
#B[2]=-1
#B[3]=-1
#A[1] = 16/4

.data
c: .word 2
A: .word -1 -1 1 4
B: .word -1 6 -1 -1

.text

lw $t0 c
mul $s0 $t0 4
mul $s3 $s0 2 #2c
sub $s3 $s3 4 #2c-1

lw $s1 A($s0) #A[c]
mul $s1 $s1 4
lw $s2 B($s1) #B[A[c]]
add $s2 $s2 $t0 #B[A[c]]+c
mul $s2 $s2 $t0 #c *(B[A[c]]+c)

lw $s4 A($s3) #A[2c-1]
div $s4 $s2 $s4

sub $t1 $s0 4 #c-1
sw $s4, A($t1)


