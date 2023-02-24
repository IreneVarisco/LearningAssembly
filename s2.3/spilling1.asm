#Si supponga di poter usare soltanto i registri $s0 e $t0.

#Si scriva il codice assembly che:

#* calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno moltiplicato per 3; 
#* non si utilizzi la pseudo-istruzione mul.

.text
add $t0 $zero 3
mult $t0 $t0
mflo $t0

add $s0 $zero 2
add $s0 $s0 2
add $s0 $s0 2

add $t0 $t0 $s0

add $s0 $zero 1
add $s0 $s0 1
add $s0 $s0 1

add $t0 $t0 $s0