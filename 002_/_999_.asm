format PE64 console
entry _start

include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'

section '.idata' import data readable
	library kernel,'kernel32.dll',\
			msvcrt,'msvcrt.dll'
	import kernel,\
		   ExitProcess,'ExitProcess'
	import msvcrt,\
		   setlocale,'setlocale',\
		   printf,'printf',\
		   scanf,'scanf',\
		   system,'system'
			   
section '.data' data readable writeable			   
	x db '6',0
    msg db  "x =  ",0
	m1 db "x<5",0
	m2 db "x>7",0
	_N db 13,10,0
    ;len equ $ - msg
	;x resb 1	
	_mask db '%d',0	
	_Fin db 'TheFin',0	
	_Russian db 'Russian',0
	_Pause db 'pause',0
	
	
section '.code' code readable executable
;global _start
_start:
cinvoke setlocale,0,_Russian
cinvoke printf,msg
cinvoke scanf,_mask, x
cinvoke printf,_N

	xor eax,eax
    mov al, byte [x]
    cmp eax, 5
jl m_else_1
jmp m_end_1

	m_else_1:
	;;mov eax, 2
	;;;;;;;;;;;;;;;;;;;;;
	push rax
	cinvoke printf,m1
	
	cinvoke printf,_N
	pop rax
m_end_1:


 cmp eax, 7
 jg m_else_2
 jmp m_end_2

	 m_else_2:
	 ;;mov eax, 2
	 ;;;;;;;;;;;;;
	 cinvoke printf,m2
	 cinvoke printf,_N
 m_end_2:
 
cinvoke printf,_N
cinvoke printf,_Fin
	cinvoke printf,_N
cinvoke system,_Pause
invoke ExitProcess, 0