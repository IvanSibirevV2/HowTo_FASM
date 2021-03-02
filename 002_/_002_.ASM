format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\Fasm\INCLUDE\win64a.inc'
include '..\macroWin\__Console_V0.inc'
section '.idata' import data readable
__InitConsoleSectionImport
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
__InitConsoleSectionData
	a dd 0
	b dd 0
	
macro __qwe [_str]
{
__RValue.WriteLN '???'
COMMON
__RValue.WriteLN '!!!'
FORWARD
__RValue.WriteLN _str
REVERSE
__RValue.WriteLN _str
}
	
	
section '.code' code readable executable
start:
        __setlocale_Russian
		__qwe 'Хочу пять','По машинно ориентированному программированию','ПЖЛСТ'
		__SharpX 20
		
		;__WriteLN _hellow
		
		__RValue.WriteLN 'Привет мир!!!'
		
		__RValue.WriteLN 'Input a b: '
		__WriteLN _N
		__Write _N
		__RValue.Read '%d %d',a,b
        ;cinvoke scanf,fmat,a,b
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]
        