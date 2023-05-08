# Function to print a number stored in EAX, converting it to a string

.section .text
	.global numprint

.type numprint, @function

numprint:
    

print:
	call itoa					# Convert the number to a string
    call strprint               # Call the string print function

    ret
