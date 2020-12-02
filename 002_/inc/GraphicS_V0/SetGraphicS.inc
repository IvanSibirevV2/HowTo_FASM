proc m_SetGraphicS uses eax, _eax:word
	xor eax,eax
	mov ax,word [_eax]
	int 10h
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
proc m_SetEGA640x350 uses ax
	mov ax,0010h
	int 10h
ret
endp
proc m_SetEGA320x200 uses ax
	mov ax,000dh
	int 10h
ret
endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;proc m_SetLine \
; uses ax CX DX \
; ,_x1:word,_y1:word
; ,_x2:word,_y2:word
; ,_color:byte
;locals
;  a dw 0
;  b dw 0
;  x dw 0
;  y dw 0
;endl
;  mov ax,_y2
;  mov bx,_y1
;  sub ax,bx
  
;  mov bx,_x2
;  mov cx,_x1
;  sub bx,cx
 ;y1=ax1+b;
 ;y2=ax2+b;
 ;y1-y2=a(x1-x2)+b-b;
 ;y1-y2=a(x1-x2);
 ;(y1-y2)/(x1-x2)=a;
 ;div BL ;ax=ax/BL
  ;
;ret
;endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ccall m_SetGraphicS,0004h
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ccall m_SetGraphicS,0000h 
;;Текст
;;40x25
;;Цвета 16/8 полутона
;;Адаптер CGA,EGA адрес B800
;;;;;;;;;;;;;;;;;;;;;;;;;;;
