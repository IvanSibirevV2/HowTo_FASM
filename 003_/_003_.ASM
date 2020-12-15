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
        _hello db 'Привет',0
		_hello2 db 'Как дела?',0
		_Pause db 'Pause',0
		;_Echo db 'Echo.',0
		_N db 13,10,0
		_Russian db 'Russian',0
		fmat db '%d',0
        a dd 0
section '.code' code readable executable

start:
        cinvoke setlocale,0,_Russian
        ;Вывод на экран текста
		cinvoke printf,_hello
		;Переход на новую строку
		cinvoke printf,_N
		cinvoke printf,_hello2
		cinvoke printf,_N
		cinvoke scanf,fmat, a
		
		cinvoke system,_Pause
exit:
        invoke ExitProcess, 0