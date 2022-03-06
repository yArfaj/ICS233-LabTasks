.data 
prompt: .asciiz "Enter character: "
resultMessage: .asciiz "\nThe result is: "



.text 
la $a0, prompt
li $v0, 4
syscall



li $v0, 12
syscall 

move $t0, $v0





# for capital letters
blt $t0, 'Z', convertToSmall
 

# for small letters
j convertToCapital



##############################

convertToSmall: 
addi $t0, $t0, 32

j exit

##############################

convertToCapital: 
subi $t0, $t0, 32

##############################

exit:
la $a0, resultMessage
li $v0, 4
syscall


li $v0, 11
move $a0, $t0
syscall


li $v0, 10
syscall

