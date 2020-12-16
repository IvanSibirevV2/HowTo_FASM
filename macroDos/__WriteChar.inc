macro __WriteChar _Char
{
	push ax
	push dx
		mov dl, _Char
		mov ah,2
		int 21h
	pop dx
	pop ax
}