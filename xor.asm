.ORIG x3000

START   ; starts and prints a new line 
        LD R0, NEWLINE
        OUT 

        ; Prints the prompt
        LEA R0, PROMPT1
        PUTS 

        ; R1 is the counter from 0 to 4
        ; R3 is the number from user input 
        AND R1, R1, #0 ; sets the counter to 0
        AND R3, R3, #0 ; sets the number to 0

READ1   
        GETC 
        OUT ; echos the number onto the terminal

        LD R2, NEGQ
        ADD R2, R0, R2 ; checks for q and quits
        BRz QUIT 

        LD R2, NEG0
        ADD R2, R0, R2 ; checks to see if 0
        BRz ZERO1

        LD R2, NEG1
        ADD R2, R0, R2 ; checks to see if 1
        BR ONE1 ; ignores the invalid characters 

ZERO1
        ADD R3, R3, R3 ; shifts the number to the left
        BR NEXT1

ONE1
        ADD R3, R3, R3 ; shifts to the left
        ADD R3, R3, #1 ; adds 1 

NEXT1 ; to increment the counter 
        ADD R1, R1, #1
        ADD R2, R1, #-4
        BRn READ1

        STI R3, NUM1 ; store the number into R3

; Second number section 
        LD R0, NEWLINE
        OUT

        LEA R0, PROMPT2
        PUTS

        ; R1 is the counter from 0 to 4
        ; R4 is the number from the user 
        AND R1, R1, #0 ; sets the counter to 0
        AND R4, R4, #0 ; sets the number to 0

READ2
        GETC
        OUT ; echos the number on the terminal

        LD R2, NEGQ
        ADD R2, R0, R2 ; check for q and quit 
        BRz QUIT 

        LD R2, NEG0
        ADD R2, R0, R2 ; check to see if 0
        BRz ZERO2

        LD R2, NEG1
        ADD R2, R0, R2 ; check to see if 1
        BRz ONE2

        BR READ2 ; ignores the invalid characters 

ZERO2
        ADD R4, R4, R4 ; shifts to the left
        BR NEXT2

ONE2
        ADD R4, R4, R4 ; shifts to the left 
        ADD R4, R4, #1 ; add 1 

NEXT2 ; increment the counter 
        ADD R1, R1, #1 
        ADD R2, R1, #-4
        Brn READ2

        STI R4, NUM2

; ---- Process the XOR ----
        ; Load in the 2 numbers 
        LDI R3, NUM1
        LDI R4, NUM2

        ; R5 as NOT R4
        NOT R5, R4
        ; A and NOT B
        ADD R6, R3, R5

        ; R5 as NOT R3
        NOT R5, R3
        ; NOT A and B
        ADD R7, R5, R4

        ; R6 is the XOR result
        ADD R6, R6, R7

        STI R6, NUM3

QUIT
        LD R0, NEWLINE
        OUT
        LEA R0, PROMPT4
        PUTS 
        HALT

NUM1 .FILL x4000
NUM2 .FILL x4001
NUM3 .FILL x4002

NEG0 .FILL xFFD0
NEG1 .FILL xFFCF
NEGQ .FILL xFF8F

PROMPT1 .STRINGZ "Enter First Binary Number: "
PROMPT2 .STRINGZ "Enter Second Number: "
PROMPT3 .STRINGZ "The XOR function of the two numbers is: "     
PROMPT4 .STRINGZ "Thank you for playing!"

NEWLINE .FILL x000A

.END