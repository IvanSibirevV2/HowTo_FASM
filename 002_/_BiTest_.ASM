format PE64 console
entry start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win64a.inc'
include '..\macroWin\__Console_V0.inc'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.idata' import data readable
__InitConsoleSectionImport
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section '.data' data readable writeable
__InitConsoleSectionData
	a dd 0
	b dd 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

	
section '.code' code readable executable
start:
        __setlocale_Russian
		__SharpX 20
		;__Test__BiTest_MonoScript
		
		__BiTest_MonoScript 64, RAX
		__BiTest_MonoScript 64, RBX	
		__BiTest_MonoScript 64, RCX
		__BiTest_MonoScript 64, RDX
		
		__SharpX 20
		; Это неполный пример, в котором продемонстрировано 
		; вывод на экран регистра флагов и регистров общего назначения
		; Есть ещё регистры чтения записи, сегмента, стека,
		; регистры операций с дробными числами и так далее ...
		; Если их дописывать, то их требуется дописывать в экранировнаие через стек
		;https://prog-cpp.ru/asm-command/
;Ставит в ноль
CLC	
CLD
;Ставит в единицу
STC
STD
;CLI;STI; - оНИ ЕСТЬ НО ВЫРУБАЮТ ИСПОЛНЕНИЕ ПРОГРАММНОГО КОДА НАЧЕСТО
		MOV RAX, 100001B
		MOV RBX, 100011B
		MOV RCX, 100111B
		MOV RDX, 101111B
		;__BiTest_Oll
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]