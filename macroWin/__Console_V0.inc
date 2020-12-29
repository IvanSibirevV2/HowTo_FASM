;Макросы Фасм консоль винда
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __InitConsoleSectionImport
{
;;section '.idata' import data readable
	library kernel,'kernel32.dll',\
			msvcrt,'msvcrt.dll'
	import kernel,\
		   ExitProcess,'ExitProcess'
	import msvcrt,\
		   setlocale,'setlocale',\
		   printf,'printf',\
		   scanf,'scanf',\
		   system,'system'
}
macro __InitConsoleSectionData
{
;;section '.data' data readable writeable
		_Russian db 'Russian',0
        _Pause db 'pause',0
		_N db 13,10,0
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __setlocale_Russian
{
	cinvoke setlocale,0,_Russian
}
macro __Write _Char
{
cinvoke printf,_Char
}
macro __WriteLN _Char
{
__Write _Char
__Write _N
}
macro __RValue.Write Char
{
local m_data,_Char
jmp m_data
	_Char db Char,0
m_data:
	cinvoke printf,_Char
}
macro __RValue.WriteLN Char
{
__RValue.Write Char
__Write _N
}
macro __RValue.Read fmat,[param]
{
COMMON
;COMMON - Деректива, после которой программной
;код повторяется для всей групповой переменной
;[param]
;FORWARD/REVERSE (В Прямом/В Обратном порядке)- Деректива, после которой программной
;код повторяется для каждого элемента
;групповой переменной [param] 
local m_data,_fmat
jmp m_data
	_fmat db fmat,0
m_data:
	cinvoke scanf,_fmat,param
}
macro __SharpX _count
{
	local m_1
	push rcx
	xor ecx,ecx
	mov ecx,_count
	m_1:
		push rcx
		__RValue.Write '#'
		pop rcx
		dec ecx
		cmp ecx,0
	jnl	m_1
	__Write _N
	pop rcx
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;