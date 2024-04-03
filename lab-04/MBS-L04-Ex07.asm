.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

; Implement the following:
; if(AX > BX) {
;   AX = AX + 1;
;	} else {
;   BX = BX + 1;
; }
.code
start:
	MOV AX, 6
	MOV BX, 12

	CMP AX, BX
	JG if__then

	if__else:
		ADD BX, 1
		JMP end_if

	if__then:
		ADD AX, 1
		JMP end_if

	end_if:

	PUSH 0
	CALL exit
end start
