#Utilizzando le syscall rese disponibili dall'emulatore MARS implementare un programma che:

#* Richieda all'utente attraverso una finestra di dialogo l'inserimento di un numero intero `NUM`
#* Estragga un numero casuale `R` nel range `[-NUM,NUM]`, (il seed del generatore di numeri casuali può essere inizializzato con un qualsiasi numero intero)
#* Sommi `R` al numero inserito `NUM` : `RESULT = NUM + R`
#* Mostri all'utente attraverso una nuova finestra di dialogo il nuovo credito dell'utente dopo la scommessa (`RESULT`).

.data
s: .asciiz "inserisca un numero"

.text
li  $v0, 4
la $a0 s
syscall


li  $v0, 5
syscall

sub $a0 $zero $v0

add $a1 $zero $v0

li  $v0, 42
syscall

add $a0 $a0 $a1

li  $v0, 1
syscall