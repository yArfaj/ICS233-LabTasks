.data
arr: .word 12, 17
  
.text

# Arithmetic Overflow Exception
li   $t0, 0x7fffffff  # $t0 = MAX_INT
addi $t2, $t0, 1


# Store Address Exception
la   $t0, arr
lw   $t0, 1($t0)


# Trap Exception
teq $t5, $zero


# Breakpoint Exception
break



exit:
li $v0, 10
syscall



.ktext 0x80000180
li $v0, 4
la $a0, exceptionAddress
syscall

li $v0, 34
mfc0 $a0, $14
syscall

li $v0, 4
la $a0, exceptionCode
syscall

li $v0, 1
mfc0 $a0, $13
srl $t0, $a0, 2
move $a0, $t0
syscall


li $v0, 4
la $a0, continue
syscall

_skip:
mfc0 $a0, $14
addi $a0, $a0, 4
mtc0 $a0, $14

eret
.kdata 

exceptionAddress: .asciiz "Exception caused by instraction at address: "
exceptionCode: .asciiz "\nException Code = "
continue: .asciiz "\nIgnore and continue program ...\n\n"











