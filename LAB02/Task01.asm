.data 
prompt: .asciiz "please enter your name: "
enteredName: .space  30
welcomingMsg: .asciiz "Hello "



.text 
li $v0, 4
la $a0, prompt
syscall 

li $v0, 8
la $a0, enteredName
li $a1, 30
syscall

li $v0, 4
la $a0, welcomingMsg
syscall 

li $v0, 4
la $a0, enteredName
syscall 


li $v0, 10 
syscall
