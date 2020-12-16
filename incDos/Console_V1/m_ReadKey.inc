;ccall m_ReadKey
;xor eax,eax
;mov al, byte[m_ReadKey.Result]
;ccall m_WriteChar,ax
;;!!!не работает с al, так как стек вызова принимает только ах
;ccall m_WriteChar_N
proc m_ReadKey uses ax
	jmp m_ReadKey.DataEnd
		m_ReadKey.Result db '0$'	
	m_ReadKey.DataEnd:
	;;Запись одного символа в регистр AL
	mov ah,1
	int 21h
	mov byte [m_ReadKey.Result],AL
ret
endp