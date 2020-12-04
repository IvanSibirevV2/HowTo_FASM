; fasm example of writing multi-segment EXE program
format MZ
use16          
entry main:start            ; program entry point
stack 100h              ; stack size
segment main                ; main program segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'inc\PROC16\proc16.inc';Чтобы процедуры работали и не кусали комары...
;;;
include 'inc\Console_V1\m_WriteChar.inc'
include 'inc\Console_V1\m_WriteChar_N.inc'
include 'inc\Console_V1\m_Write.inc'
include 'inc\Console_V1\m_WriteLN.inc'
;;;
include 'inc\Console_V1\m_ReadKey.inc'
include 'inc\Console_V1\m_SharpX79.inc'
include 'inc\Console_V1\m_SharpX.inc'
;;;
;include 'inc\Set_LookOut\m_SharpX.inc'
;include 'inc\BitS\m_BitWrite.inc'
include 'inc\BitS\m_BitWritEAX.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  start:
    mov ax,text
    mov ds,ax
    
	mov eax,ebp
	
    ;call    extra:write_text
	;call    extra:write_text
	ccal m_WriteLN,hello
	
	
    mov ax,4C00h
    int 21h
segment text
  hello db 'Hello world!',24h
segment extra
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  write_text:
	mov ax,bp
	call    extra:m_BitWritEAX
	mov dx,hello
    mov ah,9
    int 21h
    retf
 n_steck_Test:
	
	
	mov dl,"!"
    mov ah,9
    int 21h
	
	call n_steck_Test
    retf