#Si scriva codice assembly che:

#* chieda all’utente di inserire un intero (messaggio su terminale);
#* acquisisca un intero da terminale;
#* calcoli l’intero successivo;
#* mostri all’utente il risultato (messaggio su terminale).
.data
 s: .asciiz "inserisci un intero"
.text
li  $v0, 4
la $a0 s
syscall


li  $v0, 5
syscall

add $a0 $v0 1
li  $v0, 1
syscall
 