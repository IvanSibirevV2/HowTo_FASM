macro __Write str
{
	push ax
	push dx
		mov dx, word [str]
		;dx - положите указатель на строку;Например вот так;mov dx,hello
		mov ah,9
		int 21h
	pop dx
	pop ax
}