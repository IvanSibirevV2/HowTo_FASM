;Пример программы с функциями работы с консолью
use16               ;Генерировать 16-битный код
org 100h            ;Программа начинается с адреса 100h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
jmp start
	hello db 'Hello, world!$'
	_The_Fin db '_The_Fin$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\macroDos\__Console_V0.inc'
include '..\macroDos\__GraphicS_V0.inc'

macro __Rectangle __x1,__y1,__x2,__y2,_color
{
local _DeltoY,m_Data,m_1,_x1,_y1,_x2,_y2,_color
jmp m_Data
	_DeltoY dw 0
	_x1 dw 0
	_y1 dw 0
	_x2 dw 0
	_y2 dw 0
	_color dw 0
m_Data:
	xor eax,eax
	xor ebx,ebx
	
	mov bx,_y1
	mov ax,_y2
	sub ax,bx
	mov word[_DeltoY],ax
	;;;
	xor ecx,ecx
	mov cx,word[_DeltoY];;<<<ecx раз повторить цикл m_1>>>
	
;mov bx,word [_y1]
; ;mov ax,word [_y2]
xor eax,eax
; __LineXXY _x1,_x2,word [_QWE],_color
; push eax 
; push ebx 
; push ecx 
; push edx
	; xor eax,eax
	; xor ebx,ebx
	; ;mov bx,word [_y1]
	; mov bx,_y1
	; ;mov ax,word [_y2]
	; mov ax,_y2
	; sub ax,bx
	; mov word[_DeltoY],ax
	; xor eax,eax
	; xor ebx,ebx
	; ;_DeltoY=_y2-_y1
	; xor ecx,ecx
	; mov cx,word[_DeltoY];;<<<ecx раз повторить цикл m_1>>>
	; m_1:
		; push cx
		
		; ;mov bx, word [_x1]
		; mov bx, _x1
		; ;mov cx, word [_x2]
		; mov cx, _x2
		; ;mov ax,word [_y1]
		; mov ax,_y1
		; ;add ax,word [_DeltoY]
		; add ax,cx
		
		; ;mov dl, byte [_color]
		; mov dl, _color
		; add word [_QWE],ax
		; __LineXXY _x1,_x2,word [_QWE],_color
		; ;__LineXXY _x1,_x2,_y2,
		; ;_x1,_x2,_y2,_color
		; pop cx
	; loop m_1
 
; push edx
; push ecx
; push ebx
; push eax
}

; proc m_Rectangle\
 ; uses eax ebx ecx edx \
 ; ,_x1:word,_y1:word,_x2:word,_y2:word,_color:byte
 ; locals
  ; _DeltoY dw 0
; endl
 ; xor eax,eax
 ; xor ebx,ebx
 ; mov bx,word [_y1]
 ; mov ax,word [_y2]
 ; sub ax,bx
 ; mov word[_DeltoY],ax
 ; xor eax,eax
 ; xor ebx,ebx
 ; ;_DeltoY=_y2-_y1
 ; xor ecx,ecx
 ; mov cx,word[_DeltoY];;<<<ecx раз повторить цикл m_Rectangle.Loop1>>>
 ; m_Rectangle.Loop1:
	; push cx
	
	; mov bx, word [_x1]
	; mov cx, word [_x2]
	; mov ax,word [_y1]
	; ;add ax,word [_DeltoY]
	; mov dl, byte [_color]
	; ccall m_SetLineX,bx,cx,ax,dx
	
	; pop cx
 ; loop m_Rectangle.Loop1
; ret
; endp




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
	__SharpX79
	__WriteLN hello
	__SharpX79
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	__SetEGA320x200
	__SharpX79
	
	
	__Rectangle 20,20,30,30,4
	
	;Включение видео режима
	
	
	;ccall m_SetEGA640x350
	;ccall m_SetEGA320x200
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_SharpX,39
	;ccall m_WriteLN,hello
	;ccall m_SharpX,39
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ccall m_SetPoint,50,50,4
	;ccall m_SetPoint,51,50,4
	;ccall m_SetPoint,52,50,4
	;ccall m_SetPoint,53,50,4
	;ccall m_SetPoint,54,50,4
	;ccall m_SetPoint,55,50,4
	
	;ccall m_SetPoint,51,49,4
	;ccall m_SetPoint,52,49,4
	;ccall m_SetPoint,53,50,4
	;ccall m_SetPoint,54,49,4
	;ccall m_SetPoint,55,49,4
	
	;ccall m_SetPoint,51,48,4
	;ccall m_SetPoint,52,48,4
	;ccall m_SetPoint,53,48,4
	;ccall m_SetPoint,54,48,4
	;ccall m_SetPoint,55,48,4
	
	;ccall m_SetPoint,51,48,4
	;ccall m_SetPoint,52,47,4
	;ccall m_SetPoint,53,47,4
	;ccall m_SetPoint,54,47,4
	;ccall m_SetPoint,55,48,4
	
	;ccall m_SetPoint,52,47,4
	;ccall m_SetPoint,53,46,4
	;ccall m_SetPoint,54,47,4

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ah,01h;/Ожидание нажатия клавиши
    int 21h
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov ax,4C00h    ;\
    int 21h         ;/ Завершение программы
;-------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


