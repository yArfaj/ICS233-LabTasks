.data 
prompt: .asciiz "Entet withdrawal amount: "
result500: .asciiz "500 Bank note: "
result100: .asciiz "\n100 Bank note: "
result50: .asciiz "\n50  Bank note: "
result10: .asciiz "\n10  Bank note: "
result5: .asciiz "\n5   Bank note: "
result1: .asciiz "\n1   Bank note: "

.text

# $t0 => entered number
# $t1 => temporary incremental variable
# $t2 => 500
# $t3 => 100
# $t4 => 50
# $t5 => 10
# $t6 => 5
# $t7 => 1
# $t8 => temporary variable

li $v0, 4
la $a0, prompt
syscall 


li $v0, 5
syscall


move $t0, $v0



  beqz $t0, exit
  
  
  blt $t0, 500, div100
  
  
div500:
  div $t2, $t0, 500
  
  
  mul $t8, $t2, 500
  sub $t0, $t0, $t8
  
  
div100:
  
  blt $t0, 100, div50
  div $t3, $t0, 100
  
  
  mul $t8, $t3, 100
  sub $t0, $t0, $t8


div50:
  
  blt $t0, 50, div10
  div $t4, $t0, 50
  
  
  mul $t8, $t4, 50
  sub $t0, $t0, $t8
  
  
div10:
  
  blt $t0, 10, div5
  div $t5, $t0, 10
  
  
  mul $t8, $t5, 10
  sub $t0, $t0, $t8
  
  
  
div5:
  
  blt $t0, 5, div1
  div $t6, $t0, 5
  
  
  mul $t8, $t6, 5
  sub $t0, $t0, $t8
  


div1:
  
#  blt $t0, 1, printing
#  div $t7, $t0, 1
  
  
#  mul $t8, $t2, 1
#  sub $t0, $t0, $t7

beqz $t0, print500
move $t7, $t0

  


print500:
  beqz $t2, print100
  
  li $v0, 4
  la $a0, result500
  syscall 
  
  li $v0, 1
  move $a0, $t2
  syscall


print100:
  beqz $t3, print50
  
  li $v0, 4
  la $a0, result100
  syscall 
  
  li $v0, 1
  move $a0, $t3
  syscall
  
print50:
  beqz $t4, print10
  
  li $v0, 4
  la $a0, result50
  syscall 
  
  li $v0, 1
  move $a0, $t4
  syscall
  
print10:
  beqz $t5, print5
  
  li $v0, 4
  la $a0, result10
  syscall 
  
  li $v0, 1
  move $a0, $t5
  syscall
  
print5:
  beqz $t6, print1
  
  li $v0, 4
  la $a0, result5
  syscall 
  
  li $v0, 1
  move $a0, $t6
  syscall
  
print1:
  beqz $t7, exit
  
  li $v0, 4
  la $a0, result1
  syscall 
  
  li $v0, 1
  move $a0, $t7
  syscall

exit: 
  li $v0, 10
  syscall

