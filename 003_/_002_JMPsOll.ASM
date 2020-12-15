format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
        cmd db 'pause',0
        m1 db 'Input a b: ',13,10,0
        ru db 'Russian',0
        hello db 'Привет',0
        fmat db '%d %d',0
        a dd 0
        b dd 0
section '.code' code readable executable
_ok db '!!!!!!',0
_begin db '{',0
_end db '}',0
start:
        ;cinvoke setlocale,0,ru
        ;cinvoke printf,m1
        ;cinvoke scanf,fmat, a,b

        cinvoke printf,_begin
                mov eax,11h
                cmp eax,10h
                ;;; ;;; ;;; ;;;
;je m_l1;
;cmp(10,10,je) = 1
;cmp(10,11,je) = 0
;cmp(11,10,je) = 0
;jbe m_l1;
;cmp(10,10,jbe)= 1
;cmp(10,11,jbe)= 1
;cmp(11,10,jbe)= 0
;jb m_l1;
;cmp(10,10,jb) = 0
;cmp(10,11,jb) = 1
;cmp(11,10,jb) = 0
;jnz m_l1;
;cmp(10,10,jnz)= 0
;cmp(10,11,jnz)= 1
;cmp(11,10,jnz)= 1
;jnl m_l1;
;cmp(10,10,jnl)= 1
;cmp(10,11,jnl)= 0
;cmp(11,10,jnl)= 1
;jnc m_l1;
;cmp(10,10,jnc)= 1
;cmp(10,11,jnc)= 0
;cmp(11,10,jnc)= 1
;jnb m_l1;
;cmp(10,10,jnb)= 1
;cmp(10,11,jnb)= 0
;cmp(11,10,jnb)= 1
;jna m_l1;
;cmp(10,10,jna)= 1
;cmp(10,11,jna)= 1
;cmp(11,10,jna)= 0
;jle m_l1;
;cmp(10,10,jle)= 1
;cmp(10,11,jle)= 1
;cmp(11,10,jle)= 0
;jl m_l1;
;cmp(10,10,jl) = 0
;cmp(10,11,jl) = 1
;cmp(11,10,jl) = 0
;jge m_l1;
;cmp(10,10,jge)= 1
;cmp(10,11,jge)= 0
;cmp(11,10,jge)= 1
;jnz m_l1;
;cmp(10,10,jnz)= 0
;cmp(10,11,jnz)= 1
;cmp(11,10,jnz)= 1
jne m_l1;
;cmp(10,10,jne)= 0
;cmp(10,11,jnz)= 1
;cmp(11,10,jnz)= 1
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
        ;cinvoke printf,m1
        cinvoke scanf,fmat, a,b
        
        ;;; ;;; ;;; ;;;
        ;Сами проверяйте
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


















        jmp exit ;???????
exit:
        invoke ExitProcess, 0