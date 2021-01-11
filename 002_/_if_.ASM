;Этот пример демонстрирует тщетность стандартных макросов
;Работают они но через ДЖопу
format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
include '..\macroWin\__Console_V0.inc'
include '..\Fasm\INCLUDE\MACRO\IF.INC'
section '.idata' import data readable
__InitConsoleSectionImport
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
__InitConsoleSectionData
	a dd 0
	b dd 0
macro .IfTest a,b
{
	.if a < b
		__RValue.WriteLN `a#'<'#`b
	.endif
	.if a > b
		__RValue.WriteLN `a#'>'#`b
	.endif
	.if a <= b
		__RValue.WriteLN `a#'<='#`b
	.endif
	.if a >= b
		__RValue.WriteLN `a#'>='#`b
	.endif
	.if a,=,b
		__RValue.WriteLN `a#'='#`b
	.endif
}
	
section '.code' code readable executable
start:
        __setlocale_Russian
		__SharpX 20
		
		__RValue.WriteLN 'Привет мир!!!'
		__RValue.WriteLN 'a='
		__RValue.Read '%d',a
		__RValue.WriteLN 'b='
		__RValue.Read '%d',b
		__SharpX 20
        
		xor rax,rax
		xor rbx,rbx
		mov eax, dword[a]
		mov ebx, dword[b]
		.IfTest eax,ebx
		
		__SharpX 20
		
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]