;use32
;use64
format PE console
entry start
 
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win32a.inc'
 
section '.data' data readable writeable
;use32 
cmd db 'pause',0
m1 db 'Input a b: ',13,10,0
ru db 'Russian',0
hello db 'Привет',0
fmat db '%d %d',0
a dd 0
b dd 0
 
 
section '.code' code readable executable
;use32
;include 'inc\m_BitWrite.inc'
;include 'inc\m_BitWritEAX.inc'
_ok db '!!!!!!',0
_begin db '{',0
_end db '}',0

;  cinvoke setlocale,0,ru
;  cinvoke printf,hello
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov eax,11
    cmp eax,10
	if 11=eax
		cinvoke printf,_ok
	end if
	
	cinvoke printf,_begin
		;;; ;;; ;;; ;;;
		;jbe m_l1; = 0
		;jb m_l1; = 0
		;jnz m_l1; = 1
		;jnl m_l1; = 1
		;jnc m_l1; = 1
		;jnb m_l1; = 1
		;jna m_l1; = 1
		;jle m_l1; = 1
		;jl m_l1; = 1
		;jge m_l1; = 1
		;jnz m_l1; = 1
		;;; ;;; ;;; ;;;
		;cmp(10,10,jbe)= 1
		;cmp(10,11,jbe)= 1
		;cmp(11,10,jbe)= 1
		;;; ;;; ;;; ;;;
		jmp m_20201118_2050
		m_l1:
			cinvoke printf,_ok
		m_20201118_2050:
	cinvoke printf,_end
	;cmp(eax,ebx,...)
	;;; ;;; ;;; ;;;
	; 1 - Переход есть
	; 0 - Перехода нет
	;cmp(10,10,jb)= 
	;cmp(10,11,jb)= 
	;cmp(11,10,jb)= 
	;;; ;;; ;;; ;;;
	
	;;; ;;; ;;; ;;;
	;Сами проверяйте
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
jmp exit ;???????
        exit:
        invoke ExitProcess, 0
 
section '.idata' import data readable
 
library kernel,'kernel32.dll',\
        msvcrt,'msvcrt.dll'
 
import kernel,\
       ExitProcess,'ExitProcess'
 
import msvcrt,\
       setlocale,'setlocale',\
       printf,'printf',\
       scanf,'scanf',\
       system,'system'
