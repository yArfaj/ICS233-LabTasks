.data 
prompt: .asciiz "Enter two integer values: "
equal0: .asciiz "The two numbers are equals "
notEqual0: .asciiz "The two numbers are NOT equals "


.text 

li $v0, 4
la $a0, prompt
syscall 


li $v0, 5
syscall

move $t0, $v0 # First value => $t0
li $v0, 5
syscall

move $t1, $v0 # Second value => $t1
syscall


beq $t0, $t1, equal
li $v0, 4
la $a0, notEqual0
syscall

j exit

equal:
li $v0, 4
la $a0, equal0
syscall 


exit:
li $v0, 10
syscall

