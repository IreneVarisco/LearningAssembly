# Si scriva il codice che dato un intero inserito dall’utente restituisca il numero pari successivo.
.text

li  $v0, 5
syscall

add $s0 $zero 2

div $v0 $s0

mfhi $s0

beq $s0 0 pari

add $s0 $v0 1

li  $v0, 10
syscall


pari:
add $s0 $v0 2

li  $v0, 10
syscall
