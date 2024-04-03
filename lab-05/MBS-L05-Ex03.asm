.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
  num DW 1580

; Count how many bits equal to 1 exist in a word value found in the memory
.code
start:
  MOV EAX, 0
  MOV ECX, 0

  for_loop:
    MOV AX, num
    AND AX, 1
    
    CMP AX, 0
    JE not_one
      INC CL
    not_one:

    SAR num, 1
    CMP num, 0
    JNE for_loop

	PUSH 0
	CALL exit
END start

