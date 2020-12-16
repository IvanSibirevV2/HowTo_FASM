macro __WriteChar _Char
{
	push ax
	push dx
		mov dl, _Char
		;mov dl,al;Вывод вывод одного символа из dl на экран
		mov ah,2
		int 21h
	pop dx
	pop ax
}
macro __WriteChar_N{__WriteChar 0ah}
macro __Write _str
{
	push ax
	push dx
		mov dx, _str;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop dx
	pop ax
}
macro __WriteLN _str
{
	__Write _str
	__WriteChar_N
}
macro __RValue.Write _str
{
;;;
; l-value - требует предварительного создания переменной
; - Все макросы и процедуры  по умолчанию являются l-value
; r-value - не требует предварительного создания переменной
;;Терминология взята с сайта
;;https://ravesli.com/urok-190-ssylki-r-value/#toc-2
;;;
local m_data,__str
jmp m_data
	__str db _str
m_data:
	push ax
	push dx
		mov dx, __str;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop dx
	pop ax
}
macro __RValue.WriteLN _str
{
	__RValue.Write _str
	__WriteChar_N
}
macro __ReadKeyToAL
{;;Запись одного символа в регистр AL
		mov ah,1
		int 21h
}
macro __SharpX _count
{
	local m_1
	push ecx
	push dx
	mov ecx,_count
	m_1:
		__WriteChar 35
	loop m_1
	__WriteChar_N
	pop dx
	pop ecx
}
macro __SharpX79{__SharpX 79}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __TestCMP _A,_B,_JmpS
{
;;;Макрос тестит работу условных переходов в FASM ПОД DOS
;;;Пример кода для запуска
;;;__TestCMP 10,10,jnz
;;;Запихивание в текст прилетевших текстов кодов...
__RValue.Write 'CMP('#`_A#','#`_B#')&'#`_JmpS#'$'
	local m_1,m_2
	mov eax,_A
    cmp eax,_B
	__WriteChar '{'
	_JmpS m_1
	jmp m_2
    m_1:
		__RValue.Write '    !!!!    $'
	m_2:
__WriteChar '}'
;__WriteChar_N
}
macro __TestOllCMP _JmpS
{
	__TestCMP 10,10,_JmpS
	__TestCMP 10,11,_JmpS
	__TestCMP 11,10,_JmpS
	__WriteChar_N
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;