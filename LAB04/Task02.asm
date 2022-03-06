.data 
prompt: .asciiz "Enter an integer: "
negativeOdd: .asciiz "Your number is a negative odd number." 
negativeEven: .asciiz "Your number is a negative even number." 
positiveOdd: .asciiz "Your number is a positive odd number." 
positiveEven: .asciiz "Your number is a positive even number." 
zero: .asciiz "You entered a zero value." # $t2 => 0


.text

# print prompt msg
la $a0, prompt
li $v0, 4
syscall

# read an integer
li $v0, 5
syscall

move $t0, $v0 # move the integer to $t0

andi $s0, $t0, 1

bgtz $t0, positive
bltz $t0, negative
j zeroMsg

negative: 
beqz $s0, negativeEvenMsg # this mean it is even
j negativeOddMsg


positive: 
beqz $s0, positiveEvenMsg # this mean it is even
j positiveOddMsg





#################################################  Messages  #################################################
negativeOddMsg:
la $a0, negativeOdd
li $v0, 4
syscall

j exit

negativeEvenMsg:
la $a0, negativeEven
li $v0, 4
syscall

j exit

positiveOddMsg:
la $a0, positiveOdd
li $v0, 4
syscall

j exit

positiveEvenMsg:
la $a0, positiveEven
li $v0, 4
syscall

j exit

zeroMsg: 
la $a0, zero
li $v0, 4
syscall


exit:
li $v0, 10
syscall





