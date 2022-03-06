.data
prompt: .asciiz "Enter a positive integer (n) to create nxn array: "
matrix: 
newLine: .asciiz "\n"
emptySpace: .asciiz " "
size: .space 4 

.text

# $t0 => the array size (n)
# $t1 => n x 4 (because each integer take 4 bytes)
# $t2 => the address of allocated memory
# $t3 => row index (i)
# $t4 => column index (j)
# $t5 => temporary value (i + j)
# $t6 => temporary memory address
# $t7 => temporary value taken from memory using (lw)
# $t8 => temporary memory address

li $v0, 4
la $a0, prompt
syscall 

li $v0, 5
syscall 

move $t0, $v0

sll $t1, $t0, 2 # multiply by 4 becaus the array will be for integers

li $v0, 9
move $a0, $t1
syscall 

move $t2, $v0 # load the base-address in $t2
move $t6, $t2

rowLoop:
    colLoop:
        add $t5, $t3, $t4 # i + j
        
        blez $t3, next1
        lw $t7, -4($t6)
        add $t5, $t5, $t7
        
        next1:
            blez $t4, next2
            sll $t8, $t0, 2
            sub $t8, $t6, $t8
            lw $t7, 0($t8)
            add $t5, $t5, $t7
        
        next2:
            sw $t5, 0($t6)
            addi $t6, $t6, 4
            addi $t3, $t3, 1

            # printing 
            li $v0, 1
            move $a0, $t5
            syscall
        
            li $v0, 4
            la $a0, emptySpace
            syscall
            
        blt $t3, $t0, colLoop
 
    li $v0, 4
    la $a0, newLine
    syscall
    
    li $t3, 0
    
    addi $t4, $t4, 1
    blt $t4, $t0, rowLoop

exit:
    li $v0, 10
    syscall
