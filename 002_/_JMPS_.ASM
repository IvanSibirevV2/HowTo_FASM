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
	
section '.code' code readable executable
start:
        __setlocale_Russian
		__SharpX 20
			
		__Test.CMP.Oll je
		__Test.CMP.Oll jbe
		__Test.CMP.Oll jb
		__Test.CMP.Oll jnz
		__Test.CMP.Oll jnl
		__Test.CMP.Oll jnc
		__Test.CMP.Oll jnb
		__Test.CMP.Oll jna
		__Test.CMP.Oll jle
		__Test.CMP.Oll jl
		__Test.CMP.Oll jge
		__Test.CMP.Oll jnz
				
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]