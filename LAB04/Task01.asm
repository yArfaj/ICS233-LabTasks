.data

prompt: .asciiz "Enter an integer: "
binary: .asciiz "Binary representation of the integer is: "
number_of_1s: .asciiz "\nThe number of 1's is: "




.text 
# print prompt msg
la $a0, prompt
li $v0, 4
syscall


# read an integer
li $v0, 5
syscall

move $t0, $v0 # move the integer to $t0

la $a0, binary
li $v0, 4
syscall

move $a0, $t0
li $v0, 35
syscall


la $t1, 0 # counting var



calculating_1s_algorithm:
beqz $t0, exit

andi $s0, $t0, 1

# if the number is odd, then add 1 to the $t1
blez $s0, next
addi $t1, $t1, 1

next:
srl $t0, $t0, 1
j calculating_1s_algorithm


exit:
la $a0, number_of_1s
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall








