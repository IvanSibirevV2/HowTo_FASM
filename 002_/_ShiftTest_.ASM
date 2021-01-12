format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
include '..\macroWin\__Console_V0.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.idata' import data readable
__InitConsoleSectionImport
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
__InitConsoleSectionData
	a dd 0
	b dd 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
macro __Test.ROR_ROL
{
	;;;;;;;;;;;;;;;;
	XOR RAX,RAX
	MOV RAX, 110101B
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "ROR AX,1"
	ROR AX,1
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "ROR AX,2"
	ROR AX,2
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "ROL AX,1"
	ROL AX,1
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "ROL AX,2"
	ROL AX,2
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
}
macro __Test.SHR_SHL
{
	;;;;;;;;;;;;;;;;
	XOR RAX,RAX
	MOV RAX, 110101B
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "SHR AX,1"
	SHR AX,1
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "SHR AX,2"
	SHR AX,2
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "SHL AX,1"
	SHL AX,1
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
	;;;;;;;;;;;;;;;;
	__RValue.WriteLN "SHL AX,2"
	SHL AX,2
	__RValue.Write 'AX='
	__BiTest_AX
	__RValue.WriteLN 'B'
}
	
section '.code' code readable executable
start:
        __setlocale_Russian
		__SharpX 20
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		xor eax,eax
		mov ax, 1000000000000000b
		__BiTest_Oll
		; ;;;
		; __RValue.Write 'AX='
		; __BiTest_AX
		; __RValue.WriteLN 'B'
		; ;;;
		; push rax
		; __RValue.WriteLN 'Flag=**N*ODITSZ*A*P*C'
		; __RValue.Write 'Flag='
		; __BiTest_Flag
		; __RValue.WriteLN 'B'
		; pop rax
		; __RValue.Write 'AX='
		; __BiTest_AX
		; __RValue.WriteLN 'B'
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;bt  ax,15 ; тестирует бит в регистре
		__BiTest_Oll
		
		; ;;;
		; __RValue.Write 'AX='
		; __BiTest_AX
		; __RValue.WriteLN 'B'
		; ;;;
		; __RValue.WriteLN 'Flag=**N*ODITSZ*A*P*C'
		; __RValue.Write 'Flag='
		; __BiTest_Flag
		; __RValue.WriteLN 'B'
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		
		
		;__Test.ROR_ROL
		;__Test.SHR_SHL
		;__BiTest_Oll
		
		;bt  ax,15 ; тестирует бит в регистре
		;__BiTest_Oll
		__SharpX 20
		
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]