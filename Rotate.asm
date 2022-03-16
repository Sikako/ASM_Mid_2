TITLE Subtract, Version 2         (Rotate.asm)

; Subject:System Engineering
; Author:Sikako
; ----------------------------------------------------------------------------------------------------------------------------
; Using a loop and indexed addressing, write code that rotate the members of a 32-bit integer array forward one position.    |
; The value at the end of the array must wrap around to the first position. For example, the array [10,20,30,40,50]          |
; would be transformed into [50,10,20,30,40].																			     |
; ----------------------------------------------------------------------------------------------------------------------------

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
    ExitProcess PROTO,dwExitCode:DWORD

.data

	Source BYTE "This is the source string",0
	Target BYTE SIZEOF source DUP('#')


.code
	main PROC
		mov  ecx, SIZEOF Source
		mov  esi, OFFSET Source
		
	; store strings in stack

	L1:
		mov  eax, [esi]
		push eax					; push into stack
		inc  esi					
		loop L1

		mov ecx, SiZEOF Target
		mov esi, OFFSET Target		; point to Target

	; pop strings reversely

	L2:
		pop eax
		mov [esi], al
		call WriteChar
		inc esi
		loop L2



		exit
	main ENDP
	END main