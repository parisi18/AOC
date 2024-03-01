# Rafael S Parisi
# 148418
#First Assembly project
 
    .text
    .globl    main

main:
    la       $a0, msg1                #Address of string to print
    syscall             
 
    li       $v0,5                    #Read_int
    syscall                           #Read it
    move     $t0, $v0                 #Changes input value to $t0 register
 
    li       $t1, 0                   #Loads zero to $t1
    bgt      $t0, $t1, greaterThan    #If $t0 > $t1 goes to greaterThan
 
    li       $v0, 4                   #Print_string
    la       $a0, msg2                #Address of string to print
    syscall                           #Print it
 
    j        exit                     #Jump to exit
 
exit:
    li       $v0, 10                  #Exit
    syscall
 
greaterThan:
    add      $t0, $t0, $t0            #Move $t0 + $t0 into $t0
    li       $v0, 1                   #system call code for print_int
    move     $a0, $t0                 #Move result to an output register
    syscall                           #Print it
    j        exit                     #Jump to exit
 
    .data
msg1:   .asciiz "Enter the number and wait for the result...  "
msg2:   .asciiz "Invalid number."