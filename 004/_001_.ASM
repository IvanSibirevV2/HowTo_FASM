format PE64 GUI
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.idata' import data readable
        library kernel,'kernel32.dll',\
                msvcrt,'msvcrt.dll'
        import kernel,\
               ExitProcess,'ExitProcess'
		;includelib kernel32.lib
		;include kernel32.inc
		;includelib user32.lib
		;include user32.inc
		;include windows.inc
		;include gdi32.inc
;;.data
section '.data' data readable writeable
	hwnd dd 0
	hInst dd 0
	szTitleName db 'Лабороторная работа №4', 0
	szClassName db 'Приложение Win32', 0
	;msg MONMSGSTRUCT <?>
	;wc WNDCLASS <?>
	;ps PAINTSTRUCT <?>
section '.code' code readable executable
start:
	invoke GetModuleHandle, 0 ;получение значения баз. адреса,
	mov dword[hInst], eax ;по которому загружен модуль.
push 0
call [ExitProcess] 
		;invoke ExitProcess, 0