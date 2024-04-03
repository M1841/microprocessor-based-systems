.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
;         10, 02, 01, 14, 0E
	nums DB 16,  2,  1, 20, 14
	nums_len equ 5

; Compute the minimum and maximum values of an array of byte-sized positive integers
.code
start:
	MOV AH, 0
	MOV AL, 255
	MOV ECX, 0

	for_loop:
		CMP AL, nums[ECX]
		JLE endif_min
			MOV AL, nums[ECX]
		endif_min:
		
		CMP AH, nums[ECX]
		JGE endif_max
			MOV AH, nums[ECX]
		endif_max:
		
		INC CL
		CMP CL, nums_len
		JL for_loop

	PUSH 0
	CALL exit
end start

; 00xx, 00FF
; 0010, 1010
; 1002, 1002
; 1001, 1001
; 1001, 1401
; 1401, 1401
