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
		_BraceCurlyBegin db '{',0
		_BraceCurlyEnd db '}',0
		_0 db '0',0
		_1 db '1',0
		_2 db '2',0
		_3 db '3',0
		_4 db '4',0
		_5 db '5',0
		_6 db '6',0
		_7 db '7',0
		_8 db '8',0
		_9 db '9',0
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Консольный минимум				          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __setlocale_Russian{cinvoke setlocale,0,_Russian}
macro __Write _Char{
push rax
push rbx
push rcx
push rdx
pushf
	cinvoke printf,_Char
popf
pop rdx
pop rcx
pop rbx
pop rax
}
macro __WriteLN _Char{
__Write _Char
__Write _N
}
macro __RValue.Write Char{
local m_data,_Char
jmp m_data
	_Char db Char,0
m_data:
	__Write _Char
}
macro __RValue.WriteLN Char{
__RValue.Write Char
__Write _N
}
macro __RValue.Read fmat,[param]{
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
macro __SharpX _count{
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
;; Тесты и проверки на условные переходы      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __TestCMP _A,_B,_JmpS
{
;;;Макрос тестит работу условных переходов в FASM ПОД win
;;;Пример кода для запуска
;;;__TestCMP 10,10,jnz
;;;Запихивание в текст прилетевших текстов кодов...
__RValue.Write 'CMP('#`_A#','#`_B#')&'#`_JmpS#'$'
	local m_1,m_2
	mov eax,_A
    cmp eax,_B
	pushf
	push rax
	__Write _BraceCurlyBegin
	pop rax
	popf
	_JmpS m_1
	jmp m_2
    m_1:
	pushf
		push rax
		__RValue.Write '    !!!!    $'
		pop rax
	popf
	m_2:
__Write _BraceCurlyEnd
;__WriteChar_N
}
macro __Test.CMP.Oll _JmpS
{
	__TestCMP 12,11,_JmpS
	__TestCMP 11,11,_JmpS
	__TestCMP 11,12,_JmpS
	__Write _N
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Битовые тесты с выводом на экран           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_MonoScript _TXT,_Count, _Param{
	local m_y89ryd3,m_4234423,m_4723649
	__RValue.Write _TXT
	push rax
	push rbx
	push rcx
	push rdx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor rcx,rcx
	mov cl,_Count
	m_y89ryd3:
	;Циклические сдвиги выдвигают бит регистр флагов в EFLAGS.CF
	;На EFLAGS.CF есть два перехода ;jc если единица;jnc если ноль
	shl _Param,1
	push rax
	push rbx
	push rcx
	push rdx
	jnc m_4234423
		__Write _1	
	jmp m_4723649
		m_4234423:
		__Write _0
	m_4723649:
	pop rdx
	pop rcx
	pop rbx
	pop rax
	sub cx,1
	;Переход если результат не отрицательный
	jnz m_y89ryd3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pop rdx
	pop rcx
	pop rbx
	pop rax
	__RValue.WriteLN 'B'
}
macro __Test.BiTest_MonoScript{
	xor rax,rax
	mov al,10000000b
	__BiTest_MonoScript "AL=",8, AL
	;;;
	xor rax,rax
	mov ax,1000000000000000b
	__BiTest_MonoScript "AX=",16, AX
	;;;
	xor rax,rax
	mov eax,10000000000000000000000000000000b
	__BiTest_MonoScript "EAX=",32, EAX
	;;;
	xor rax,rax
	mov rax,1000000010000000000000000000000000100000000000000000000000000000b
	__BiTest_MonoScript "RAX=",64, RAX
	;;;
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_Flag{
push rax
push rbx
push rcx
push rdx
pushf
;;;
pop AX
push AX
	__RValue.WriteLN 'Flag=**N*ODITSZ*A*P*C'
	__BiTest_MonoScript 'Flag=',16, AX
;;;
popf
pop rdx
pop rcx
pop rbx
pop rax
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_Oll{
;https://en.wikipedia.org/wiki/FLAGS_register
;https://prog-cpp.ru/asm-command/
push rax
push rbx
push rcx
push rdx
pushf
	__BiTest_MonoScript "RAX=",64, RAX
	__BiTest_MonoScript "RBX=",64, RBX
	MOV RAX,RCX
	__BiTest_MonoScript "RCX=",64, RAX
	__BiTest_MonoScript "RDX=",64, RDX
popf
pop rdx
pop rcx
pop rbx
pop rax
;;;
__BiTest_Flag
}