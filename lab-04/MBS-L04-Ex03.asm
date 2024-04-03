.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
	ax_i	DB	3
	bx_i	DB	8
	eight	DB	8

;	Compute AX = 7 * ax_i - 2 * bx_i - bx_i / 8
.code
start:
;	AX = 7 * ax_i
	MOV	EAX,	7
	MUL	ax_i		; 15

;	BX = AX = 7 * ax_i
	MOV	EBX,	EAX	; 15

;	AX = 2 * bx_i
	MOV	EAX,	2
	MUL	bx_i		; 10

;	BX -= AX = 7 * ax_i - 2 * bx_i
	SUB	BL,	AL	; 05

;	AX = bx_i / 8
	MOV	EAX,	0
	MOV	AL,	bx_i
	DIV	eight		; 01

;	BX -= AX = 7 * ax_i - 2 * bx_i - bx_i / 8
	SUB	BL,	AL	; 04

;	AX = BX
	MOV	EAX,	EBX

	PUSH	0
	CALL	exit
end start

