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
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		XOR RAX,RAX
		MOV rax,1000000011111110000000111111000000111110000011110000111000110010b
		__BiTest_MonoScript "RAX=",64, RAX
		__BiTest_MonoScript "EAX=",32, EAX
		XOR RBX,RBX ; Чистим регистр
		XOR RDX,RDX ; Чистим регистр
		PUSH RAX ; докидываем целиком RAX в стек, чтобы потом...
		; забрать из стека млыдшие биты 2 раза по восемь
		POP BX ; забрали из стека RL
		__BiTest_MonoScript "BX=",16, BX
		POP DX ; забрали из стека RH
		__BiTest_MonoScript "DX=",16, DX
		;;CLC ; Устанавливаем флаг FC в о
		;;CMC ; инвертируем флаг FC в 1
		;;__BiTest_Flag ; посмотрели регистр флагов
		shl BX,1  ; СДВИНУЛИ bx , чтобы старший разряд поместить в регистр флагов переноса р
		;;__BiTest_Flag ; посмотрели регистр флагов
		; в флаге с бет сидеть выдвигаемый бит
		rcl DX,1 ;двигаем dx с вдвигание флага переноса
		ror bx,1 ; bx возвращаем в начальное положение; в противовес shl BX,1
		rcl bx,1 ; задвигаем выдвинутый бит...
		Push DX ; позвращаем сдвинутые четвертинки в стек
		Push BX
		Pop RAX Выводим из стека и на экран
		__BiTest_MonoScript "EAX=",32, EAX
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		__SharpX 20
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]