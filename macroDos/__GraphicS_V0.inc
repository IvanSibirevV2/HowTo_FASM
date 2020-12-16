;В разработке
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __SetEGA640x350
{
	push ax
	mov ax,0010h
	int 10h
	pop ax
}
macro __SetEGA320x200
{
	push ax
	mov ax,000dh
	int 10h
	pop ax
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro __Poin _x,_y,_color
{;;;__Poin 20,20,4
	push CX
	push DX
	push ax
		mov  CX, _x
		mov  DX, _y
		MOV  AH,0CH;ф-ия установки точки   
		MOV  AL,_color
		int  10h
	pop ax
	pop DX
	pop CX
}
macro __LineXXY _x1,_x2,_y,_color
{;;;__LineXXY 20,50,50,4
local _DeltoX,m_Data,m_1
jmp m_Data
	_DeltoX dw 0
m_Data:
push eax
push ebx
push ecx

	xor eax,eax
    xor ebx,ebx
    ;mov ax,word [_x2]
	mov ax,_x2
    ;sub ax,word [_x1]
	sub ax,_x1
    mov word[_DeltoX],ax;_DeltoX=_x2-_x1
    xor ecx,ecx
	mov cx,word[_DeltoX]
	m_1:
		;mov ax,word [_x1]
		mov ax, _x1
		add ax,cx
		push cx
		mov  CX, ax;[_x1]+cx
		;mov  DX, word [_y]
		mov  DX, _y
		MOV  AH,0CH;ф-ия установки точки   
		;MOV  AL,byte [_color]
		MOV  AL,_color
		int  10h
		pop cx
	loop m_1
	
pop ecx
pop ebx
pop eax
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;