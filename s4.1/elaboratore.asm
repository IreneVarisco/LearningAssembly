#*nome del file sorgente: elaboratore.asm*

#Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma, differenza, moltiplicazione e divisione tra due numeri interi.

#Input: i due operandi e un terzo parametro per la selezione dell’operazione.

#Output: risultato (nel caso della divisione restituisce anche il resto).

#Si scriva poi il main dove:

#* vengono chiesti all’utente operandi e operatore;
#* il risultato dell’operazione è mostrato a terminale.

.data

s: .asciiz "inserire 2 numeri e un operatore"
op: .word 1

.text
li $v0 4
la $a0 s
syscall

li  $v0 5
syscall

add $s0 $zero $v0 #a

li  $v0, 5
syscall

add $s1 $zero $v0 #b

li  $v0, 8
la $a0 op
li $a1 2
syscall

lb $s2 op #c


beq $s2 '+' somma
beq $s2 '-' sottrazione
beq $s2 '*' moltiplicazione 
beq $s2 '/' divisione

somma:
add $a0 $s0 $s1
li  $v0, 1 
syscall
j uscita

sottrazione:
sub $a0 $s0 $s1
li  $v0, 1 
syscall
j uscita

moltiplicazione:
mul $a0 $s0 $s1
li  $v0, 1 
syscall
j uscita

divisione:
div $a0 $s0 $s1
li  $v0, 1 
syscall
j uscita

uscita:
li  $v0, 10 #exit
syscall
