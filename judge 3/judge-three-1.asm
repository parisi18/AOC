# Rafael S Parisi
# 148418
# Print how many positive values exists

    .text
    .globl    main

main:
    move    $t0, $zero            
    move    $t2, $zero 
    move    $t3, $zero
 
loop: 
    beq     $t0, 6, print
    addi    $t0, $t0, 1
    li      $v0, 5
    syscall
 
    move    $t2, $v0
    bgt     $t2, 0, countOne
    j loop
 
countOne:
    addi    $t3, $t3, 1
    j   loop
 
exit:
    li      $v0, 10                 
    syscall
 
print:
    li      $v0, 1                  
    move    $a0, $t3 
    syscall
    
    li      $v0, 4
    la      $a0, msg1              
    syscall                        
 
    j       exit 

    .data
msg1:   .asciiz " valores positivos"