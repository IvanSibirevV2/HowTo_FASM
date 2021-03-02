format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include '..\Fasm\INCLUDE\win64a.inc'
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
        _Pause db 'pause',0
		_N db 13,10,0
        m1 db 'Input a b: ',13,10,0
        _Russian db 'Russian',0
        hello db 'Привет',0
        fmat db '%d %d',0
        a dd 0
        b dd 0
section '.code' code readable executable
start:
        cinvoke setlocale,0,_Russian
        cinvoke printf,m1
		cinvoke printf,_N
        cinvoke scanf,fmat, a,b
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]
        