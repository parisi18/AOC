# Rafael S Parisi
# 148418
# Count positive, negative, odd an even numbers and print it each quantity
   
    .text
 
    .globl    main
 
main:
    move    $t0, $zero  #iterador          
    move    $t2, $zero  #input
    move    $t3, $zero  #usado para contar numeros positivos
    move    $t4, $zero  #usado para contar numeros negativos
    move    $t6, $zero  #usado para o resultado da comparacao
    move    $t7, $zero  #usado para contar os pares
    move    $t8, $zero  #usado para contar os impares
 
loop: 
    beq     $t0, 5, print
    addi    $t0, $t0, 1
    li      $v0, 5
    syscall
 
    move    $t2, $v0
    bgt     $t2, 0, countPositive
    blt     $t2, 0, countNegative
 
    j loop
 
countPositive:
    addi     $t3, $t3, 1
    andi     $t6, $t2, 0x0001
    beq      $t6, 0, countEven

    j   countOdd
 
 
countNegative:
    addi    $t4, $t4, 1
    andi    $t6, $t2, 0x0001
    beq     $t6, 0, countEven
 
    j   countOdd
 
 
countEven:
    addi    $t7, $t7, 1
    j   loop
 
countOdd:
    addi    $t8, $t8, 1
    j   loop
 
exit:
    li      $v0, 10                 
    syscall
 
print:
 
    li      $v0, 1                  
    move    $a0, $t7 
    syscall
 
    li      $v0, 4
    la      $a0, msg1              
    syscall  
 
    li      $v0, 1                  
    move    $a0, $t8 
    syscall
 
    li      $v0, 4
    la      $a0, msg2              
    syscall
 
    li      $v0, 1                  
    move    $a0, $t3 
    syscall
 
    li      $v0, 4
    la      $a0, msg3              
    syscall
 
    li      $v0, 1                  
    move    $a0, $t4 
    syscall
 
    li      $v0, 4
    la      $a0, msg4              
    syscall
 
    j       exit 
 
    .data
msg1:   .asciiz " valor(es) par(es)\n"
msg2:   .asciiz " valor(es) impar(es)\n"
msg3:   .asciiz " valor(es) positivo(s)\n"
msg4:   .asciiz " valor(es) negativo(s)\n"