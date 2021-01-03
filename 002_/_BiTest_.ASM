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

	
section '.code' code readable executable
start:
        __setlocale_Russian
		__SharpX 20
		__Test.__BiTest_AL
		__Write _N
		__Test.__BiTest_AX
		__Write _N
		__Test.__BiTest_EAX
		__Write _N
		__Test.__BiTest_RAX
		__Write _N
		
		MOV RAX, 100001B
		MOV RBX, 100011B
		MOV RCX, 100111B
		MOV RDX, 101111B
		__BiTest_Oll
		
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]