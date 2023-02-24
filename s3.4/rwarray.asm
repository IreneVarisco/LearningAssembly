#* inizializzi il segmento dati con un array di 13 interi scelti a piacere;
#* chieda all’utente di inserire tre interi *a*, *b* e *c*;
#* se *c=0*,  scambi l’*a*-esimo elemento dell’array con il *b*-esimo;
#* se *c=1*, sovrascriva il *b*-esimo elemento dell’array con il valore dell’*a*-esimo elemento;
#* se *c=-1*, sovrascriva l’*a*-esimo elemento dell’array con il valore del *b*-esimo elemento;
#* se *c* ha un altro valore stampi la stringa *«comando non riconosciuto»* e non effettui modifiche all’array.

.data
 A: .word 1 2 3 4 5 6 7 8 9 10 11 12 13
 s: .asciiz "comando non riconosciuto"
 
.text
li  $v0 5
syscall

add $s0 $zero $v0#a

li  $v0, 5
syscall

add $s1 $zero $v0 #b

li  $v0, 5
syscall

add $s2 $zero $v0 #c

beqz $s2 zero #se c è uguale a 0
beq $s2 1 uno #se c è uguale a 1
beq $s2 -1 meno #se c è uguale a -1

li $v0 4
la $a0 s
syscall

li  $v0, 10 #exit
syscall

zero:


  
mul $s0 $s0 4 #indirizzo a
mul $s1 $s1 4 #indirizzo b


lw $s4 A($s0) #A[a]
lw $s5 A($s1) #A[b]

#add $s6 $zero $s4

sw $s5 A($s0) #metto in A[a] A[b]
sw $s4 A($s1) #metto in A[b] A[a](copia)

li  $v0, 10 #exit
syscall

uno: #A[b]< A[a]
mul $s1 $s1 4 #indirizzo b
mul $s0 $s0 4 #indirizzo a

lw $s4 A($s0) #A[a]
lw $s5 A($s1) #A[b]

sw $s4 A($s5)

li  $v0, 10 #exit
syscall

meno: #A[a]< A[b]
mul $s0 $s0 4 #indirizzo a
mul $s1 $s1 4 #indirizzo b

lw $s4 A($s0) #A[a]
lw $s5 A($s1) #A[b]

sw $s5 A($s4)

li  $v0, 10 #exit
syscall


