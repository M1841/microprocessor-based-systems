.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
  ;		   	FD  FA  0E  10  06
	nums DB -3, -6, 14, 16, 6
	nums_len equ 5

; Determine the minimum and maximum values in a signed (positive and negative) integer array represented on BYTE. Write the minimum and maximum in the memory
; Use one procedure which computes the minimum and another for the maximum
.code

min PROC
  MOV BL, 127
  MOV ECX, 0

  min_for_loop:
    CMP nums[ECX], BL
    JG not_min
      MOV BL, nums[ECX]
    not_min:

    INC CL
    CMP Cl, nums_len
    JL min_for_loop
  RET
min ENDP

max PROC
  MOV BH, -128
  MOV ECX, 0

  max_for_loop:
    CMP nums[ECX], BH
    JL not_max
      MOV BH, nums[ECX]
    not_max:

    INC CL
    CMP CL, nums_len
    JL max_for_loop
  RET
max ENDP

start:
  CALL min
  CALL max

	PUSH 0
	CALL exit
END start

