    .data
        msg: .asciiz "idioma:ingles"
     
    .text
     
    .globl main
     
    main:
    
        li $t0, 0   #Input K
        
        li  $v0, 5
        syscall
        move    $t0, $v0
        
        li $v0,8        # take in input
        la $a0, buffer  # load byte space into address
        li $a1, 20      # max length of input
        move $t0,$a0    # save string to t0
        syscall
    
        li $v0,4        # print string
        la $a0, buffer  # load byte space into address
        syscall
        
        
        
        blt $t0, 2, exit
        bgt $t0, 100, exit
        
        li $v0, 4
        la $a0, msg
        syscall
        
    exit:
        li $v0, 10
        syscall