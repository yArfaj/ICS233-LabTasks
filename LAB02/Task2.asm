.data 
enterA: .asciiz "Enter a: "
enterB: .asciiz "Enter b: "
enterC: .asciiz "Enter c: "

resultMsg: .asciiz "s = (a + b) - (c + 101) = "


.text 
li $v0, 4
la $a0, enterA
syscall 

li $v0, 5
syscall

move $t0, $v0 # A value => $t0
li $v0, 4
la $a0, enterB
syscall 


li $v0, 5
syscall


move $t1, $v0 # B value => $t1
li $v0, 4
la $a0, enterC
syscall 


li $v0, 5 # C value => $v0
syscall


add $t2, $t0, $t1
add $t3, $v0, 101
sub $t4, $t2, $t3


li $v0, 4
la $a0, resultMsg
syscall 

li $v0, 1
move $a0, $t4
syscall 


li $v0, 10
syscall
