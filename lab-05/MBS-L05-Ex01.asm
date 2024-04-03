.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
;					FD FA 0E  10  06
	nums DB -3, -6, 14, 16, 6
	nums_len equ 5

; Determine the minimum and maximum values in a signed (positive and negative) integer array represented on BYTE. Write the minimum and maximum in the memory.
.code
start:
	MOV EAX, 0
	MOV ECX, 0

	MOV BH, -128
	MOV BL, 127

	for_loop:
		CMP nums[ECX], BL
		JG not_min
			MOV BL, nums[ECX]
		not_min:

		CMP nums[ECX], BH
		JL not_max
			MOV BH, nums[ECX]
		not_max:

		INC CL
		CMP CL, nums_len
		JL for_loop

	PUSH 0
	CALL exit
end start

; 807F
; 80FD -> FDFD
; FDFA -> FDFA
; FDFA -> 0EFA
; 0EFA -> 10FA
; 10FA -> 10FA

