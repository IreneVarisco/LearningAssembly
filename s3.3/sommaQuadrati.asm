#Si scriva il codice che calcola la somma dei primi N-1 numeri elevati al quadrato. Nel caso in cui l’i-esimo numero da aggiungere sia multiplo del valore iniziale della somma, si termini il ciclo for.
#```
#		V=<intero inserito dall’utente>;
#		N=<intero inserito dall’utente>;
#	
#		Sum = V;
#		for (i=1; i<N; i++)
#		{
#		If ((i*i)%V==0){
##			print «break»;
#			break;
#		}
	
#		Sum+=i*i;
#		}
#		print Sum
#```

.data 
s: .asciiz "break"


.text
li  $v0, 5
syscall

add $s0 $zero $v0 # V
add $s4 $zero $v0 #sum

li  $v0, 5
syscall

add $s1 $zero $v0 #N

add $s3 $zero 1 #i
for:
bge $s3 $s1 uscita

mul $t0 $s3 $s3
div $t0 $s0
mfhi $t0
beqz $t0 if

add $s4 $s4 $t0 # sum += i*i

add $s3 $s3 1
j for 
uscita:

li  $v0, 1
add $a0 $zero $s4
syscall

li  $v0, 10
syscall


if:
li $v0 4
la $a0 s
syscall
j uscita