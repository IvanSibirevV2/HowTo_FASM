proc m_WriteChar \ 
 uses dx ax \
 , a:byte
    mov dl,byte [a]
	;mov dl,al;Вывод вывод одного символа из dl на экран
	mov ah,2
	int 21h
ret
endp