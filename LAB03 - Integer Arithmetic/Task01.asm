.data

prompt: .asciiz "Enter a signed number : "
resultMessage: .asciiz "The result of multiplying it by 24.5 is :"


.text

la $a0, prompt
li $v0, 4
syscall

li $v0, 5
syscall

move $t0, $v0 # entered value => $t0


sll $t1, $t0, 4
sll $t2, $t0, 3
srl $t3, $t0, 1

add $t1, $t1, $t2
add $t1, $t1, $t3 
syscall


la $a0, resultMessage
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall


li $v0, 10
syscall
