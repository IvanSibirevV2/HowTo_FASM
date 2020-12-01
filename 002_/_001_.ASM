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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	ccall m_SharpX79
	ccall m_WriteLN,hello
	ccall m_SharpX79
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Включение видео режима
	
	
	;ccall m_SetEGA640x350
	ccall m_SetEGA320x200
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ccall m_SharpX,39
	ccall m_WriteLN,hello
	ccall m_SharpX,39
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_SetPoint,50,50,4
	;ccall m_SetPoint,51,50,4
	ccall m_SetPoint,52,50,4
	;ccall m_SetPoint,53,50,4
	ccall m_SetPoint,54,50,4
	;ccall m_SetPoint,55,50,4
	
	ccall m_SetPoint,51,49,4
	ccall m_SetPoint,52,49,4
	;ccall m_SetPoint,53,50,4
	ccall m_SetPoint,54,49,4
	ccall m_SetPoint,55,49,4
	
	ccall m_SetPoint,51,48,4
	ccall m_SetPoint,52,48,4
	ccall m_SetPoint,53,48,4
	ccall m_SetPoint,54,48,4
	ccall m_SetPoint,55,48,4
	
	;ccall m_SetPoint,51,48,4
	ccall m_SetPoint,52,47,4
	ccall m_SetPoint,53,47,4
	ccall m_SetPoint,54,47,4
	;ccall m_SetPoint,55,48,4
	
	;ccall m_SetPoint,52,47,4
	ccall m_SetPoint,53,46,4
	;ccall m_SetPoint,54,47,4
	
	
	mov AX,4F01h
	INT 10h
	;mov  AX,11h   
	;int  10h        ; видеорежим 640x480   
  
    ;MOV  AH,0CH        ;ф-ия установки точки   
	;MOV  AL,3          ;выбираем цвет 3 палеты   
  
	;mov  CX, 100   

	;MOV DX, 100        ;строка   
	;INT  10H          ;выводим точку   
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;MOV  AH,0CH
	;MOV  AL,3

	;mov  CX, 100    ;Столбец, X
	;mov  DX, 200	;Столбец, н
	
	;MOV  AH,0CH        ;ф-ия установки точки   
	;MOV  AL,3          ;выбираем цвет 3 палеты 
	
	;int  10h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


