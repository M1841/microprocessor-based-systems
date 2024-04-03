.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
  arr DB '1', '*', 'A', 'a', 'B', '2', '3', '#', 'x', 'a', '1', 'E', 'e', '/'
  arr_len equ 14
  arr1 DB arr_len dup(0)
  arr2 DB arr_len dup(0)

; Given an array of ASCII characters, create another 2 arrays. The first will contain the numbers in the initial array and the second will contain the small letters.
.code
start:
  LEA EAX, arr1
  LEA EBX, arr2
  MOV ECX, 0

  for_loop:
    CMP arr[ECX], 'a'
    JB not_small_letter
    CMP arr[ECX], 'z'
    JA not_small_letter
      MOV DL, arr[ECX]
      MOV [EBX], DL
      INC EBX
      JMP not_digit
    not_small_letter:
    
    CMP arr[ECX], '0'
    JB not_digit
    CMP arr[ECX], '9'
    JA not_digit
      MOV DL, arr[ECX]
      MOV [EAX], DL
      INC EAX
    not_digit: 

    INC CL
    CMP CL, arr_len
    JL for_loop

	PUSH 0
	CALL exit
END start

