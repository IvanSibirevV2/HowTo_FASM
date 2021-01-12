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
macro __setlocale_Russian
{
	cinvoke setlocale,0,_Russian
}
macro __Write _Char
{
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
	__Write _Char
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
macro __BiTest_AL{
	local m_y89ryd3,m_4234423,m_4723649
	push rax
	push rcx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor rcx,rcx
	mov cl,8
	m_y89ryd3:
	;Циклические сдвиги выдвигают бит регистр флагов в EFLAGS.CF
	;На EFLAGS.CF есть два перехода ;jc если единица;jnc если ноль
	shl al,1
	push rax
	push rcx
	jnc m_4234423
		__Write _1	
	jmp m_4723649
		m_4234423:
		__Write _0
	m_4723649:
	pop rcx
	pop rax
	sub cx,1
	;Переход если результат не отрицательный
	jnz m_y89ryd3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pop rcx
	POP rax
}
macro __Test.__BiTest_AL{
	xor rax,rax
	mov al,10000000b
	__BiTest_AL
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_AX{
	local m_y89ryd3,m_4234423,m_4723649
	push rax
	push rcx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor rcx,rcx
	mov cl,16
	m_y89ryd3:
	;Циклические сдвиги выдвигают бит регистр флагов в EFLAGS.CF
	;На EFLAGS.CF есть два перехода ;jc если единица;jnc если ноль
	shl ax,1
	push rax
	push rcx
	jnc m_4234423
		__Write _1	
	jmp m_4723649
		m_4234423:
		__Write _0
	m_4723649:
	pop rcx
	pop rax
	sub cx,1
	;Переход если результат не трицательный
	jnz m_y89ryd3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pop rcx
	POP rax
}
macro __Test.__BiTest_AX{
	xor rax,rax
	mov ax,1000000000000000b
	__BiTest_AX
	
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_EAX{
	local m_y89ryd3,m_4234423,m_4723649
	push rax
	push rcx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor rcx,rcx
	mov cl,32
	m_y89ryd3:
	;Циклические сдвиги выдвигают бит регистр флагов в EFLAGS.CF
	;На EFLAGS.CF есть два перехода ;jc если единица;jnc если ноль
	shl eax,1
	push rax
	push rcx
	jnc m_4234423
		__Write _1	
	jmp m_4723649
		m_4234423:
		__Write _0
	m_4723649:
	pop rcx
	pop rax
	sub cx,1
	;Переход если результат не трицательный
	jnz m_y89ryd3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pop rcx
	POP rax
}
macro __Test.__BiTest_EAX{
	xor rax,rax
	mov eax,10000000000000000000000000000000b
	__BiTest_EAX
	
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_RAX{
	local m_y89ryd3,m_4234423,m_4723649
	push rax
	push rcx
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	xor rcx,rcx
	mov cl,64
	m_y89ryd3:
	;Циклические сдвиги выдвигают бит регистр флагов в EFLAGS.CF
	;На EFLAGS.CF есть два перехода ;jc если единица;jnc если ноль
	shl Rax,1
	push rax
	push rcx
	jnc m_4234423
		__Write _1	
	jmp m_4723649
		m_4234423:
		__Write _0
	m_4723649:
	pop rcx
	pop rax
	sub cx,1
	;Переход если результат не трицательный
	jnz m_y89ryd3
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pop rcx
	POP rax
}
macro __Test.__BiTest_RAX{
	xor rax,rax
	mov rax,1000000010000000000000000000000000100000000000000000000000000000b
	__BiTest_RAX
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_Flag
{
;https://en.wikipedia.org/wiki/FLAGS_register
;https://prog-cpp.ru/asm-command/
push rax
pushf
pop ax
__BiTest_AX
pop rax
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __BiTest_Oll{
push rax
push rbx
push rcx
push rdx
pushf
	__RValue.Write 'RAX='
	__BiTest_RAX
	__RValue.WriteLN 'B'
popf
pop rdx
pop rcx
pop rbx
pop rax
;...
push rax
push rbx
push rcx
push rdx
pushf
	mov rax,rbx
	__RValue.Write 'RBX='
	__BiTest_RAX
	__RValue.WriteLN 'B'
popf
pop rdx
pop rcx
pop rbx
pop rax
;...
push rax
push rbx
push rcx
push rdx
pushf
	mov rax,rcx
	__RValue.Write 'RCX='
	__BiTest_RAX
	__RValue.WriteLN 'B'
popf
pop rdx
pop rcx
pop rbx
pop rax
;...
push rax
push rbx
push rcx
push rdx
pushf
	mov rax,rdx
	__RValue.Write 'RDX='
	__BiTest_RAX
	__RValue.WriteLN 'B'
popf
pop rdx
pop rcx
pop rbx
pop rax
;...
push rax
push rbx
push rcx
push rdx
pushf
	__RValue.WriteLN 'Flag=**N*ODITSZ*A*P*C'
	__RValue.Write 'Flag='
;popf
;pushf
	__BiTest_Flag
	__RValue.WriteLN 'B'
popf
pop rdx
pop rcx
pop rbx
pop rax
}