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