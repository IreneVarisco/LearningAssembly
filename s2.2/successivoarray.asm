#Si scriva codice assembly che:

#* chieda all置tente di inserire un intero (messaggio su terminale);
#* acquisisca un intero da terminale;
#* calcoli l段ntero successivo;
#* memorizzi l段ntero ed il successivo in un array di dimensione 2 in memoria;
#* mostri all置tente i due numeri (messaggio su terminale).

.data
 s: .asciiz "inserisci un intero"
 A: .space 2
.text
li  $v0, 4
la $a0 s
syscall


li  $v0, 5
syscall

add $s0 $v0 1

add $a0 $zero $v0
li  $v0, 1
syscall

add $a0 $zero $s0
li  $s0, 1
syscall

add $s1 $zero $v0
add $s2 $zero $s0

add $s0 $zero 4

sw $s1, A
sw $s1, A($s0)