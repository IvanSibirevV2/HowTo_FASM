proc m_Write uses ax dx,a_ptr:word	
	mov dx, word [a_ptr]
	;dx - положите указатель на строку;Например вот так;mov dx,hello
	mov ah,9
	int 21h
ret
endp