#nome del file sorgente: rwmemoria.asm
#Si scriva il codice Assembly che effettui:
#A[99] = 5 + B[i] + C
#Si assuma che:
#• A e B siano vettori di 100 elementi, ogni elemento è un intero a 32 bit;
#• C e i siano variabili intere a 32 bit.
#Si inizializzino unicamente q

.data 
A: .space 100
B: .space 100

c: .word 2
i: .word 3

.text
	
add $t0, $zero, 8
add $t1, $zero, 392
lw $s0 B($t0)
add $s0, $zero, 10

lw $s1 c
add $s0, $s0, $s1
add $s0, $s0, 5


sw $s0, A($t1)




