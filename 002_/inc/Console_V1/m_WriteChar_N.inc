proc m_WriteChar_N uses dx ax
    mov dl,0ah
	;mov dl,al;Вывод вывод одного символа из dl на экран
	mov ah,2
	int 21h
ret
endp