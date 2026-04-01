.ORIG x3000

START ; starts and prints a new line 
LD, RO NEWLINE
PUTS

; Prints the prompt
LEA R0, PROMPT 1
PUTS 

; R1 is the counter from 0 to 4
; R3 is the number from user input 
ADD R1, R1, #0 ; sets the counter to 0
ADD R3, R3, #0 ; sets the number to 0

READ1
GETC
OUT ; echos the number onto the terminal

ADD R2, R0, #-133 ; checks for q and quits
BRz QUIT 
ADD R2, R0, #-48 ; checks to see if 0
BRz ZERO
ADD R2, R0, #-49 ; checks to see if 1

BR READ1; ignores the invalid characters 

ZERO
ADD R3, R3, R3 ; shifts the number to the left
BR NEXT1

ONE
ADD R3, R3, R3 ; shifts to the left
ADD R3, R3, #1 ; adds 1 

NEXT1 ; to increment the counter 
; !!!! check this 
ADD R1, R1, #1
ADD R2, R1, #-4
BRn READ1

ST R3, NUM1 ; store the number into R3

; ----- Second number


