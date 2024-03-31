.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
	x1	DB	1
	x2	DB	1
	x3	DB	2
	X4	DB	3
	x5	DB	5
	x6	DB	6
	six	DB	6

;	Average of 6 numbers
.code
start:
	MOV	EAX,	0

	;	AL += x1 + x2 + x3 + x4 + x5 + x6
	ADD	AL,	x1	; 01
	ADD	AL,	x2	; 02
	ADD	AL,	x3	; 04
	ADD	AL,	x4	; 07
	ADD	AL,	x5	; 0C
	ADD	AL,	x6	; 12

	;	AL /= 6
	DIV	six		; 03	

	PUSH	0
	CALL	exit
end start
