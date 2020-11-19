use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
_ok db '!!!!!!$'
_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov eax,10
	mov ebx,11
    cmp eax,ebx
	call m_jb
	;cmp(eax,ebx,jnz)
	;cmp(10,10,jb)= Перехода нет
	;cmp(10,11,jb)= Переход есть
	;cmp(11,10,jb)= Переход нет
	;Сами проверяйте
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Ожидание нажатия клавиши
    mov ah,01h
    int 21h
    ;Завершение программы
    mov ax,4C00h
    int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
m_jb:
call m_begin	
	jb m_l1
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
