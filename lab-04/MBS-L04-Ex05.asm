.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
;         0  1  2  3  4  5   6   7
	nums DB 1, 1, 2, 3, 5, 8, 13, 21
	nums_len equ 8

; Compute the average of an array of byte-sized integers
.code
start:	
; sum = 0
	MOV EAX, 0
; i = 0
	MOV ECX, 0

	nums_loop:
;   sum += nums[i]
		ADD AL, [nums + ECX]
;   i++
		ADD ECX, 1 
;  if(i < nums_len) goto nums_foreach
		CMP ECX, nums_len
		JL nums_loop

; avg = sum / nums_len
	SAR AL, 3

	PUSH 0
	CALL exit
end start

; EAX = 0
; EAX += 1  => 1  = 01
; EAX += 1  => 2  = 02
; EAX += 2  => 4  = 04
; EAX += 3  => 7  = 07
; EAX += 5  => 12 = 0C
; EAX += 8  => 20 = 14
; EAX += 13 => 33 = 21
; EAX += 21 => 54 = 36
; EAX /= 8  => 6  = 06
