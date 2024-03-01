# Rafael S Parisi
# 148418

    .text
    .globl    main
 
main:
 
    la      $a0, msg1               #Address of string to print
    syscall             
 
    li      $v0,5                   #Read_int
    syscall             
 
    move    $t0, $v0                #Changes input value to $t0 register
    li      $v0,5                   #Read_int
    syscall                         #Read it
 
    move    $t1, $v0                #Changes input value to $t1 register
    li      $v0,5                   #Read_int
    syscall                         #Read it
 
    move    $t2, $v0                #Changes input value to $t2 register
 
    bgt     $t0, $t1, greaterThan   #If $t0 > $t1 go to greaterThan
    blt     $t0, $t1, lowerThan     #Else go to lowerThan
 
exit:
    li      $v0, 10                 #Exit
    syscall
 
greaterThan:
    bgt     $t0, $t2, printA        #If $t0 > $t2 go to printA
    blt     $t0, $t2, printC        #Else go to printC
 
lowerThan:
    bgt     $t1, $t2, printB        #If $t1 > $t2 go to printB
    blt     $t1, $t2, printC        #Else go to printC
 
printA:
    li      $v0, 1                  #System call code for print_int
    move    $a0, $t0                #Address of int to print
    syscall                         #Print it
    j       exit                    #Go to exit
 
printB:
    li      $v0, 1                  #System call code for print_int
    move    $a0, $t1                #Address of int to print
    syscall                         #Print it
    j       exit                    #Go to exit
 
printC:
    li      $v0, 1                  #System call code for print_int
    move    $a0, $t2                #Address of int to print
    syscall                         #Print it
    j       exit                    #Go to exit
 
    .data
msg1:   .asciiz "Maior: "