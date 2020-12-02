proc m_SetPoinTT \
 uses ax bx cx \
 ,_x:word,_y:word,_color:byte
	;На примере этой процедуры видим, что 
	;можно все параметры запихнуть в регистры
	;и передать в нижестоящую функйию
	mov ax,word [_x]
	mov bx,word [_y]
	xor cx,cx
	mov cl,byte [_color]
	ccall m_SetPoint,ax,bx,cx
ret
endp

proc m_SetPoint \
 uses ax CX DX \
 ,_x:word,_y:word,_color:byte
	mov  CX, word [_x]
	mov  DX, word [_y]
	MOV  AH,0CH;ф-ия установки точки   
	MOV  AL,byte [_color]
	int  10h
ret
endp

proc m_SetLineX \
 uses eax ebx ecx \
 ,_x1:word,_x2:word,_y:word,_color:byte
locals
  _DeltoX dw 0
endl
    xor eax,eax
    xor ebx,ebx
    mov ax,word [_x2]
    sub ax,word [_x1]
    mov word[_DeltoX],ax;_DeltoX=_x2-_x1
    xor ecx,ecx
	mov cx,word[_DeltoX]
	m_SetLineX.Loop1:
		mov ax,word [_x1]
		add ax,cx
		push cx
		mov  CX, ax;[_x1]+cx
		mov  DX, word [_y]
		MOV  AH,0CH;ф-ия установки точки   
		MOV  AL,byte [_color]
		int  10h
		pop cx
	loop m_SetLineX.Loop1
ret
endp

proc m_Rectangle\
 uses eax ebx ecx edx \
 ,_x1:word,_y1:word,_x2:word,_y2:word,_color:byte
 locals
  _DeltoY dw 0
endl
 xor eax,eax
 xor ebx,ebx
 mov bx,word [_y1]
 mov ax,word [_y2]
 sub ax,bx
 mov word[_DeltoY],ax
 xor eax,eax
 xor ebx,ebx
 ;_DeltoY=_y2-_y1
 xor ecx,ecx
 mov cx,word[_DeltoY];;<<<ecx раз повторить цикл m_Rectangle.Loop1>>>
 m_Rectangle.Loop1:
	push cx
	
	mov bx, word [_x1]
	mov cx, word [_x2]
	mov ax,word [_y1]
	;add ax,word [_DeltoY]
	mov dl, byte [_color]
	ccall m_SetLineX,bx,cx,ax,dx
	
	pop cx
 loop m_Rectangle.Loop1
ret
endp