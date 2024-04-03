.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
	nums1	DD	1, 2, 3
	nums2	DD	0, 0, 0

; Copy values from one array to another in reverse order, using the stack
.code
start:
	MOV	EAX,	0

; Save the address of nums1 in the source index register
	LEA	ESI,	nums1
; Save the address of nums2 in the destination index register
	LEA	EDI,	nums2
	
; Push the values of nums1 onto the stack
	PUSH	[ESI]
	ADD	ESI,	4
	PUSH	[ESI]
	ADD	ESI,	4
	PUSH	[ESI]

; Pop the values from the stack into nums2
	POP	[EDI]
	ADD	EDI,	4
	POP	[EDI]
	ADD	EDI,	4
	POP	[EDI]
	
	PUSH	0
	CALL	exit
end start
