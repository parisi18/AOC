    .data
msg_invalido:   .asciiz ": valor invalido."
msg_vel_invalid:   .asciiz ": velocidade invalida\n"
msg_maior:   .asciiz "Maior nivel: velocidade "
 
    .text
    .globl  main
 
main:
    li $t0, 0   #Input L
    li $t1, 0   #Input V
    li $t2, 0   #Iterador
    li $t3, 0   #Velocidade maxima
 
    li  $v0, 5
    syscall
    move    $t0, $v0
 
    blt $t0, 1, lesmasInvalidas
    bgt $t0, 30, lesmasInvalidas
 
loop:
    beq $t2, $t0, validaMax
    addi    $t2, $t2, 1

    li  $v0, 5
    syscall
    move    $t1, $v0
 
    blt $t1,1,velocidade_invalida
    bgt $t1,50,velocidade_invalida
    bgt $t1, $t3, setMax
 
    j loop
 
setMax:
    move $t3, $t1
    j loop
 
validaMax:
    blt $t3, 10, printLvl1
    blt $t3, 20, printLvl2
    j printLvl3
 
velocidade_invalida:
    li  $v0,1
    move    $a0,$t1
    syscall
 
    li  $v0, 4
    la $a0, msg_vel_invalid
    syscall
 
    j loop
 
lesmasInvalidas:
    li  $v0,1
    move    $a0,$t0
    syscall
 
    li  $v0, 4
    la $a0, msg_invalido
    syscall
    
    j exit
 
printLvl1:
    li  $v0, 4
    la $a0, msg_maior
    syscall
 
    li  $v0,1
    li    $a0,1
    syscall
 
    j exit
 
printLvl2:
    li  $v0, 4
    la $a0, msg_maior
    syscall
 
    li  $v0,1
    li    $a0,2
    syscall
 
    j exit
 
printLvl3:
    li  $v0, 4
    la $a0, msg_maior
    syscall
 
    li  $v0,1
    li    $a0,3
    syscall
 
    j exit
 
exit:
    li $v0, 10
    syscall