use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
_ok db '!!!!!!$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov eax,11
	mov ebx,10
    cmp eax,ebx
	call m_jnl
	;cmp(eax,ebx,jnl)
	;cmp(10,10,jnl)= Переход есть
	;cmp(10,11,jnl)= Перехода нет
	;cmp(11,10,jnl)= Переход есть
	;Сами проверяйте
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Ожидание нажатия клавиши
    mov ah,01h
    int 21h
    ;Завершение программы
    mov ax,4C00h
    int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_jnl:
call m_begin	
	jnl m_l1
	jmp m_20201118_2050
    m_l1:
      mov dx,_ok
      mov ah,9
      int 21h
      mov dl,0ah
      mov ah,2
      int 21h
	m_20201118_2050:
call m_end
ret

m_begin:
	mov dl,123
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
ret
m_end:
	mov dl,125
	mov ah,2
	int 21h
	mov dl,0ah
	mov ah,2
	int 21h
ret
