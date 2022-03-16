#####################	Description: MMIO		#####################
#############################################################################
main:

	li $t0, 0xffff0000 # Address of keyboard control register
wait_kb: 
	lw $t1, 0($t0)#  Read the keyboard control register
	andi $t1, $t1, 1 # Extract ready bit
	beqz $t1, wait_kb # loop back while not ready
	lw $a0, 4($t0) # Get character from keyboard
	j dp


dp:
	li $t0, 0xffff0008 # Address of display control register

wait_dp: 
	lw $t1, 0($t0) # Read the display control register
	andi $t1, $t1, 1 # Extract ready bit
	beqz $t1, wait_dp # loop back while not ready
	
	# change letters to capital & vice versa
	move $t2, $a0
	
	blt $t2, 'A', next
	bgt $t2, 'z', next
	ble $t2, 'Z', changeToSmall
	bge $t2, 'a', changeToCapital
	
	j next
	
	changeToCapital:
	subi $t2, $t2, 32
	
	j next
	
	changeToSmall:
	addi $t2, $t2, 32
	
	next:
	move $a0, $t2
	sw $a0, 4($t0) # Send character to display
	j main

exit:
li $v0, 10
syscall

