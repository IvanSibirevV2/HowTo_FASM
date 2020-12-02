;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
	hello db 'Hello, world!$'
	_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'inc\Console_V1\proc16.inc';Чтобы процедуры работали и не кусали комары...
include 'inc\Console_V1\m_WriteChar.inc'
include 'inc\Console_V1\m_WriteChar_N.inc'
include 'inc\Console_V1\m_Write.inc'
include 'inc\Console_V1\m_WriteLN.inc'

include 'inc\Console_V1\m_ReadKey.inc'
include 'inc\Console_V1\m_SharpX79.inc'
include 'inc\Console_V1\m_SharpX.inc'

include 'inc\GraphicS_V0\SetGraphicS.inc'
include 'inc\GraphicS_V0\SetPoint.inc'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ccall m_SetEGA320x200;Включение видео режима
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_SetPoint,20,20,5
	;ccall m_SetPoint,20,30,4
	
	;ccall m_SetLineX,20,30,20,5
	
	
	
	ccall m_Rectangle,30,30,40,40,6
	;,_x1:word,_y1:word,_x2:word,_y2:word,_color:byte
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


