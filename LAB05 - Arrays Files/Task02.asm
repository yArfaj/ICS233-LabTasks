.data

promptInputFile: .asciiz "\nEnter input-file name including .txt: "
promptOutputFile: .asciiz "\nEnter output-file name including .txt with length 15: "

inputFileName: .space 100
outputFileName: .space 100

inputFilename: .asciiz "/Users/yalarfaj/Desktop/untitled-Folder/KFUPM/ICS 233/LABs/LAB05/Tasks/Task2File.txt"
outputFilename: .asciiz "/Users/yalarfaj/Desktop/untitled-Folder/KFUPM/ICS 233/LABs/LAB05/Tasks/output.txt"

readData: .space 250

newLine: .asciiz "\n"
emptySpace: .asciiz " "

errorMsg: .asciiz "\nError: There is no file with the same name you entered!"

# Task2File.txt



.text
# $t0 => input-file descriptor
# $t1 => 
# $t2 => 
# $t3 => 
# $t4 => 
# $t5 => 
# $t6 => 




# prompt
li $v0, 4
la $a0, promptInputFile
syscall 


# read file name 
li $v0, 8
la $a0, inputFileName
li $a1, 100
syscall 

# open input-file 
li $v0, 13
la $a0, inputFilename
li $a1, 0
syscall 

move $s0, $v0

li $v0, 1
move $a0, $s0
syscall

bltz $s0, error


# read from file 
li $v0, 14
move $a0, $s0
la $a1, readData
li $a2, 250
syscall 

#######################################################


li $v0, 4
la $a0, newLine
syscall


li $v0, 4
la $a0, readData
syscall



#######################################################

# prompt
li $v0, 4
la $a0, promptOutputFile
syscall 

# read file name 
li $v0, 8
la $a0, outputFileName
li $a1, 15
syscall

# open output-file 
li $v0, 13
la $a0, outputFilename
li $a1, 1
syscall 


move $s1, $v0

li $v0, 1
move $a0, $s1
syscall

bltz $s1, error

# read from file 
li $v0, 15
move $a0, $s1
la $a1, readData
li $a2, 250
syscall 








j exit

error: 
    li $v0, 4
    la $a0, errorMsg
    syscall

exit: 
    li $v0, 10
    syscall



