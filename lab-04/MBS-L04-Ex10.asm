.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
;					0003 FFFA 000E 0010 0006
	nums DW 3,   -6,  14,  16,  6
	nums_len equ 10

; Determine the minimum and maximum values in a signed (positive and negative) integer array represented on WORD. Write the minimum and maximum in the memory.
.code
start:
	MOV EAX, 0
	MOV ECX, 0

	MOV BX, -32768
	MOV DX, 32767

	for_loop:
		CMP nums[ECX], DX
		JG not_min
			MOV DX, nums[ECX]
		not_min:

		CMP nums[ECX], BX
		JL not_max
			MOV BX, nums[ECX]
		not_max:

		ADD CL, 2
		CMP CL, nums_len
		JL for_loop

	PUSH 0
	CALL exit
end start


