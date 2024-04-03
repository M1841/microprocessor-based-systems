.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start 

; Implement the following:
; for(i = 0; i < n; i++) {
;   AX = AX + 1
; }
.code
start:
	MOV AX, 3
	MOV ECX, 7
	
	for_loop:
		INC AX
	LOOP for_loop

	PUSH 0
	CALL exit
end start
