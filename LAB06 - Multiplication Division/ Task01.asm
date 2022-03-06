.data 
prompt: .asciiz "Entet a positive integer: "
resultMsg: .asciiz "Factorial result is: "






.text

# $t0 => entered number
# $t1 => temporary incremental variable
# $t2 => 




li $v0, 4
la $a0, prompt
syscall 


li $v0, 5
syscall


move $t0, $v0


# factorial calculation
  beqz $t0, printing
  
  move $t1, $t0
  
  move $t2, $t0

calculation:
  
  subi $t1, $t1, 1
  
  beqz $t1, printing
  
  mul $t2, $t2, $t1
  
j calculation
  
  
printing: 
  li $v0, 4
  la $a0, resultMsg
  syscall 
  
  li $v0, 1
  move $a0, $t2
  syscall


exit: 
  li $v0, 10
  syscall

