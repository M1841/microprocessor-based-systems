.386
.model flat, stdcall

includelib msvcrt.lib
extern exit: proc

public start

.data
	nums1 DB 1,  3,  5
	      DB 7,  9,  11
	      DB 13, 15, 17
	      
	nums2 DB 2,  4,  6
	      DB 8,  10, 12
	      DB 14, 16, 18
	
	sum   DB 0,  0,  0
				DB 0,  0,  0
				DB 0,  0,  0

; Compute the sum of two bidimensional matrices
.code
start:
	MOV EAX, 0
	MOV EBX, 0
	MOV ECX, 0

	rows_loop:
		MOV BL, 0

		cols_loop:
			MOV CL, 0
			ADD CL, nums1[EAX + EBX]
			ADD CL, nums2[EAX + EBX]

			MOV sum[EAX + EBX], CL

			ADD BL, 1
			CMP BL, 3
			JL cols_loop

		ADD AL, 3
		CMP AL, 9
		JL rows_loop

	PUSH 0
	CALL exit
end start

; 1  + 2  = 3  = 03
; 3  + 4  = 7  = 07
; 5  + 6  = 11 = 0B
; 7  + 8  = 15 = 0F
; 9  + 10 = 19 = 13
; 11 + 12 = 23 = 17
; 13 + 15 = 27 = 1B
; 15 + 16 = 31 = 1F
; 17 + 18 = 35 = 23
