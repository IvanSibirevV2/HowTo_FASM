format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'

include '..\macroWin\__Console_V0.inc'

section '.idata' import data readable
__InitConsoleSectionImport
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
__InitConsoleSectionData
	_str db 'QWESSSЫЫSSS<<sss>>',0
	_str2 db 255 dup(0)
	_char db '*',0	

	
section '.code' code readable executable
start:
__setlocale_Russian	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	__RValue.WriteLN 'Удаление символа из строки'
	__RValue.WriteLN 'Введите строку символов длиной до 255 символов:'
	;__RValue.Read '%s',_str
	;__Write _N
	__WriteLN _str
	__WriteLN _str2
	;rax - указатель первой строки
	;rbx - Символ первой строки
	;rcx - указатель второй строки
	xor rax,rax
	mov eax,_str
	xor rcx,rcx
	mov ecx,_str2
	m_20210115_1152:
		mov bl,byte [eax]
		mov byte [_char],bl
		;;;
			cmp bl,'S'
			jne m_20210115_1214
			JMP m_20210115_1213
				m_20210115_1214:
				mov byte [ecx],bl
				add ecx,1
			m_20210115_1213:
		;;;
		add eax,1
		mov bl,byte [eax]
	cmp bl,0
	jne m_20210115_1152
	__WriteLN _str
	__WriteLN _str2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]