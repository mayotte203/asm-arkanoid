.model small
.stack 100h
.data
messageWelcome db "Arkanoid",0Dh ,0Ah   
               db "Controls:",0Dh ,0Ah
               db "Left/Right arrow - move paddle",0Dh ,0Ah
               db "Up - shoot",0Dh ,0Ah
               db "Esc - exit",0Dh ,0Ah
               db "Enter - start",0Dh ,0Ah,
               db "BY POZHILAYA SKUMBRIYA",0Dh ,0Ah, '$' 
messageWin     db "*               YOU WIN                *",0Dh ,0Ah
               db "*                                      *",0Dh ,0Ah
               db "*              SCENARIO                *",0Dh ,0Ah
               db "*            GAME DESIGN               *",0Dh ,0Ah
               db "*             PRODUCTION               *",0Dh ,0Ah
               db "*           AND DIRECTION              *",0Dh ,0Ah
               db "*                                      *",0Dh ,0Ah
               db "*           HIDEO KOJIMA               *",0Dh ,0Ah, '$'
screenBuffer db 1000 dup(0)
playField db 396 dup(00h)
level db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
      db 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h 
      db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
      db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
      db 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h 
      db 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h
      db 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
      db 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h  

     
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h	  
	  db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h	  
	  db 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h	  
	  db 20h, 20h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 20h, 20h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  

levelCount dw 88
           dw 46

      
currentLevel dw 0     

verticalMovement dw 0
horizontalMovement dw 0
                  
ballPositionY dw 18
ballPositionX dw 11
                   
paddlePosition dw 0                   
previousTime dw 0    
score dw 0                       
winCount dw 0
.code
jmp main
  
printScore proc near
    pusha
    xor cx, cx    
    mov ax, score
    xor dx, dx 
    mov si, 10
loadStack:   
    div si 			  		
    add dl, '0'
    push dx    
    xor dx, dx 
    inc cx        
    cmp ax, 0
    jne loadStack   
    mov bx, 466      
printStack:
    pop dx 
    push ds
    mov ax, 0b800h
    mov ds, ax
    mov [bx], dl
    inc bx
    mov [bx], 07h
    inc bx
    pop ds           
    loop printStack          
    popa 
    ret   
endp    
  
initScreen proc near
    push cx
    push ax
    push si
    push ds  
    push bx
    push dx     
    mov ax, 0b800h
    mov ds, ax 
        
    xor bx, bx
    mov cx, 1000
    loopScreen:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    loop loopScreen
    
    xor si, si
    mov ax, 40
    firstLine:
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    dec ax
    cmp ax, 0
    je firstLineEnd
    jmp firstLine
    firstLineEnd:
    mov ax, 23
    columns:
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    add si, 76
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    dec ax
    cmp ax, 0
    je columnsEnd
    jmp columns
    columnsEnd:
    mov ax, 40
    secondLine:
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    dec ax
    cmp ax, 0
    je secondLineEnd
    jmp secondLine
    secondLineEnd:
    mov cx, 2
    glass:
    mov al, 80
    mul cl
    add ax, 4
    mov si, ax
    mov [si], ' '
    inc si
    mov [si], 70h
    add si, 45
    mov [si], ' '
    inc si
    mov [si], 70h
    inc cx
    cmp cx, 23
    je glassEnd
    jmp glass
    glassEnd:
    mov cx, 2
    glassBottom:
    mov al, 2
    mul cl
    add ax, 160
    mov si, ax
    mov [si], ' '
    inc si
    mov [si], 70h
    inc cx
    cmp cx, 26
    je glassBottomEnd
    jmp glassBottom
    glassBottomEnd:
    mov [454], 'S' 
    mov [456], 'c'
    mov [458], 'o'
    mov [460], 'r'
    mov [462], 'e'
    mov [464], ':'
    xor bh, bh
    mov dh, 25
    mov ah, 02
    int 10h  
    pop dx
    pop bx
    pop ds
    pop si
    pop ax
    pop cx
    ret
endp

initPlayField proc near
    push cx
    push bx
    push ax  
    push es
    push di
    push si
      
    mov ax, ds
    mov es, ax
    mov si, offset level
    mov di, offset playField  
    mov cx, currentLevel 
    loop12:   
    add si, 396
    loop loop12:
    mov cx, 396
    loop11:
    movsb
    loop loop11    
    mov bx, offset levelCount
    mov cx, currentLevel
    loop13:     
    add bx, 2
    loop loop13
    mov ax, [bx]
    mov winCount, ax
    pop si
    pop di
    pop es 
    pop ax
    pop bx
    pop cx
    ret
endp

displayPlayField proc near
    push ax
    push es
    push cx
    push di
    push si
    mov ax, 0B800h
    mov es, ax
    mov cx, 19
    mov di, 247
    mov si, offset playField
    loop1:
    push cx
    mov cx, 22
    loop2:
    movsb
    inc di
    loop loop2
    add di, 36
    pop cx
    loop loop1
    pop si
    pop di
    pop cx
    pop es
    pop ax
    ret
endp
        

printLose proc near    
    push ds
    mov ax, 0b800h
    mov ds, ax
    mov bx, 820 
    mov [bx], 'Y'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'o'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'u'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'l'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'o'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov bx, 896   
    mov [bx], 'P'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'r'
    inc bx
    mov [bx], 07h
    inc bx        
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'E'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'n'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 't'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'r'
    inc bx
    mov [bx], 07h
    inc bx 
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    pop ds
    ret
endp

displayPaddle proc near       
    push ds
    
    mov bx, offset paddlePosition
    mov dx, [bx]
    
    mov ax, 0b800h
    mov ds, ax
    mov bx, 1767
    mov cx, 22
    loop21:    
    mov [bx], 00h
    add bx, 2
    loop loop21   
    mov bx, 1767
    add bx, dx
    add bx, dx
    mov cx, 4
    loop31:    
    mov [bx], 0E0h
    add bx, 2
    loop loop31
    
    pop ds    
    ret
endp

welcomeScreen proc near 
    push ax
    push bx 
    push dx
    push ds    
    mov ax, 0B800h
    mov ds, ax
    xor bx, bx
    mov cx, 1000
    loopScreenWelcome:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    loop loopScreenWelcome
    pop ds
    mov ah, 9h
    mov dx, offset messageWelcome
    int 21h          
    
    waitEnterWelcome: 
    mov ah, 1
    int 16h
    jz waitEnterWelcome
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    je EnterWelcome
    cmp ah, 01h
    jne waitEnterWelcome
    mov ah, 00
    mov al, 03
    int 10h
    mov ah, 4Ch
    int 21h
    EnterWelcome:
    pop dx
    pop bx
    pop ax      
    ret
endp

moveBall proc near  
    push dx    
    cmp verticalMovement, 0
    jne moveDown
    cmp ballPositionY, 0
    jne notUpCol
    mov verticalMovement, 1
    notUpCol:              
    jmp horizontalCheck
    moveDown:
    cmp ballPositionY, 18
    jne notDownCol         
    mov bx, offset paddlePosition
    mov ax, [bx]
    cmp ax, ballPositionX
    jg paddleLose
    add ax, 3
    cmp ax, ballPositionX
    jl paddleLose
    mov verticalMovement, 0
    jmp notDownCol
    paddleLose:
    mov ax, 01h
    pop dx
    ret
    notDownCol: 
    horizontalCheck:
    cmp horizontalMovement, 0
    jne moveLeft
    cmp ballPositionX, 21
    jne changeBallPos
    mov horizontalMovement, 1
    jmp changeBallPos
    moveLefT:   
    cmp ballPositionX, 0
    jne changeBallPos   
    mov horizontalMovement, 0
    changeBallPos: 
    cmp horizontalMovement, 1
    jne moveRight
    dec ballPositionX 
    call checkCollision
    cmp dx, 00h
    je verticalMove
    inc ballPositionX
    mov horizontalMovement, 0  
    jmp verticalMove
    moveRight:
    inc ballPositionX 
    call checkCollision 
    cmp dx, 00h
    je verticalMove
    dec ballPositionX
    mov horizontalMovement, 1 
    verticalMove:
    cmp verticalMovement, 1
    jne moveUp
    inc ballPositionY 
    call checkCollision  
    cmp dx, 00h
    je moveEnd
    dec ballPositionY 
    mov verticalMovement, 0
    jmp moveEnd
    moveUp:
    dec ballPositionY  
    call checkCollision
    cmp dx, 00h
    je moveEnd
    inc ballPositionY  
    mov verticalMovement, 1
    moveEnd:   
    call checkCollision  
    xor ax, ax
    pop dx
    ret
endp

displayBall proc near           
    push ax
    push bx
    push cx
    push ds     
    mov bx, offset ballPositionY
    mov ax, [bx]
    add ax, 3
    mov cl, 80
    mul cl                      
    mov bx, offset BallPositionX
    mov cx, [bx]
    add ax, cx
    add ax, cx
    add ax, 7
    mov bx, ax
    mov ax, 0b800h
    mov ds, ax
    mov [bx], 70h
    pop ds
    pop cx
    pop bx
    pop ax
    ret
endp

checkCollision proc near    
    push ax
    push bx
    push cx    
    xor dx, dx
    mov bx, offset ballPositionY
    mov ax, [bx]
    mov cl, 22
    mul cl
    mov bx, offset ballPositionX
    mov cx, [bx]
    add ax, cx
    mov bx, offset playField
    add bx, ax
    cmp [bx], 00h
    je notCollision
    add score, 10
    dec winCount
    call printScore
    mov dx, 01h 
    mov [bx], 00h
    and ax, 01h
    cmp ax, 00h
    je deleteInc
    dec bx
    mov [bx], 00h
    jmp notCollision
    deleteInc:
    inc bx
    mov [bx], 00h
    notCollision: 
    pop cx
    pop bx
    pop ax
    ret
endp

paddleStart proc near
    mov bx, offset paddlePosition
    mov ax, [bx]
    add ax, 2
    mov ballPositionX, ax
    mov ballPositionY, 18
    mov horizontalMovement, 0
    mov verticalMovement, 0 
    call displayPlayField
    call displayBall   
    call displayPaddle
    paddleLoop:
    mov ah, 1
    int 16h
    jz noKeyPressed1
    xor ah, ah
    int 16h
    cmp ah, 4Dh
    jne notRight1
    cmp paddlePosition, 18
    jge notRight1
    inc paddlePosition
    inc ballPositionX
    call displayPlayField
    call displayPaddle 
    call displayBall    
    notRight1:  
    cmp ah, 4Bh
    jne notLeft1
    cmp paddlePosition, 0
    je notLeft1
    dec paddlePosition
    dec ballPositionX
    call displayPlayField
    call displayPaddle 
    call displayBall
    notLeft1:
    cmp ah, 01h
    jne notEscape1
    jmp exit
    notEscape1:
    cmp ah, 1ch
    jne notEnter1
    ret
    notEnter1: 
    noKeyPressed1:
    jmp paddleLoop
    ret
endp    

printWin proc near   
    push ax
    push bx 
    push dx
    push ds    
    xor bh, bh
    mov dh, 4
    xor dl, dl
    mov ah, 02
    int 10h
    mov ax, 0B800h
    mov ds, ax
    xor bx, bx
    mov cx, 1000
    loopScreenWin:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    loop loopScreenWin
    pop ds
    mov ah, 9h
    mov dx, offset messageWin
    int 21h          
    
    waitEnterWin: 
    mov ah, 1
    int 16h
    jz waitEnterWin
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    je EnterWin
    cmp ah, 01h
    jne waitEnterWin
    mov ah, 00
    mov al, 03
    int 10h
    mov ah, 4Ch
    int 21h
    EnterWin:
    xor bh, bh
    mov dh, 25
    mov ah, 02
    int 10h
    pop dx
    pop bx
    pop ax      
    ret
endp

main:
    mov ax, @data
    mov ds, ax
    mov ah, 00
    mov al, 01
    int 10h       
    call welcomeScreen
    
    restart:
    mov score, 0 
    mov currentLevel, 0
    mov previousTime, 0  
    mov ballPositionY, 18
    mov ballPositionX, 11
    mov horizontalMovement, 0
    mov verticalMovement, 0    
    call initScreen
    call printScore 
    call initPlayField
    call checkCollision   
    call displayPlayField
    call displayBall   
    call displayPaddle
    call paddleStart
    mov ah, 01h
    xor cx, cx
    xor dx, dx
    int 1ah     
    start:                     
    mov ah, 1
    int 16h
    jz noKeyPressed
    xor ah, ah
    int 16h
    cmp ah, 4Dh
    jne notRight
    cmp paddlePosition, 18
    jge notRight
    inc paddlePosition
    call displayPlayField
    call displayPaddle 
    call displayBall    
    notRight:  
    cmp ah, 4Bh
    jne notLeft
    cmp paddlePosition, 0
    je notLeft
    dec paddlePosition
    call displayPlayField
    call displayPaddle 
    call displayBall
    notLeft:
    cmp ah, 01h
    jne notEscape
    jmp exit
    notEscape: 
    noKeyPressed: 
    mov ah, 00h
    int 1ah
    push dx
    mov ax, previousTime
    sub dx, ax
    mov ax, dx
    pop dx
    cmp ax, 3
    jl notMove
    mov previousTime, dx
    call moveBall 
    cmp ax, 00h
    je notLose
    call printLose
    jmp waitEnter
    notLose:  
    call displayPlayField
    call displayPaddle 
    call displayBall
    notMove:
    cmp winCount, 0
    jne start
    inc currentLevel
    cmp currentLevel, 2
    jne notWin
    call printWin
    jmp restart
    notWin:  
    mov previousTime, 0  
    mov ballPositionY, 18
    mov ballPositionX, 11
    mov horizontalMovement, 0
    mov verticalMovement, 0    
    call initScreen
    call printScore 
    call initPlayField
    call checkCollision   
    call displayPlayField
    call displayBall   
    call displayPaddle
    call paddleStart
    mov ah, 01h
    xor cx, cx
    xor dx, dx
    int 1ah      
    jmp start
    waitEnter:
    mov ah, 1
    int 16h
    jz waitEnter
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    jne notEnter
    jmp restart
    notEnter:
    cmp ah, 01
    jne waitEnter:  
exit:
mov ah, 00
mov al, 03
int 10h
mov ah, 4Ch
int 21h
end main

; +-+-+-+-+ +-+-+-+-+-+-+
; |F|U|C|K| |A|S|M|!|!|!|
; +-+-+-+-+ +-+-+-+-+-+-+




