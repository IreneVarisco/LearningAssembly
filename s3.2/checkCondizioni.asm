#Si scriva il codice assembly che esegua le seguenti istruzioni:

#```c
#		a = <intero inserito dall’utente>
#		b = <intero inserito dall’utente>
#		c = <intero inserito dall’utente>
#	
#		If ( (a>=b) && (c!=0) ){
#			z=c(a+b);
#			print z
##		}
#		else{
#			print «errore»
#		}
#```
.data 
s: .asciiz "errore"

.text
li  $v0, 5
syscall

add $s0 $zero $v0

li  $v0, 5
syscall

add $s1 $zero $v0

li  $v0, 5
syscall

add $s2 $zero $v0

bge $s0 $s1 maggioreuguale

li $v0 4
la $a0 s
syscall

li  $v0, 10
syscall

maggioreuguale:

bnez $s2 nozero
li $v0 4
la $a0 s
syscall

li  $v0, 10
syscall

nozero:

add $s3 $s0 $s1

mul $a0 $s2 $s3

li  $v0, 1
syscall
