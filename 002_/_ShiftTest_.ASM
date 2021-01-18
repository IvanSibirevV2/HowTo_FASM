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
		macro __Test.Shift_RAX _Shift,_StartValue
		{
			__RValue.WriteLN '__Test.Shift_RAX '#`_Shift#','#`_StartValue
			XOR RAX,RAX
			MOV RAX, _StartValue;110101B
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift RAX,1
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift RAX,2
			__BiTest_MonoScript "RAX=",64, RAX
			__SharpX 20
		}
		;__Test.Shift_RAX ROR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_RAX ROL,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_RAX SHR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_RAX SHL,1000000011111110000000111111000000111110000011110000111000110010b
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		macro __Test.Shift_EAX _Shift,_StartValue
		{
			__RValue.WriteLN '__Test.Shift_EAX '#`_Shift#','#`_StartValue
			XOR RAX,RAX
			MOV RAX, _StartValue;110101B
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift EAX,1
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift EAX,2
			__BiTest_MonoScript "RAX=",64, RAX
			__SharpX 20
		}
		;__Test.Shift_EAX ROR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_EAX ROL,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_EAX SHR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_EAX SHL,1000000011111110000000111111000000111110000011110000111000110010b
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		macro __Test.Shift_AX _Shift,_StartValue
		{
			__RValue.WriteLN '__Test.Shift_AX '#`_Shift#','#`_StartValue
			XOR RAX,RAX
			MOV RAX, _StartValue;110101B
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AX,1
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AX,2
			__BiTest_MonoScript "RAX=",64, RAX
			__SharpX 20
		}
		;__Test.Shift_AX ROR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AX ROL,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AX SHR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AX SHL,1000000011111110000000111111000000111110000011110000111000110010b
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		macro __Test.Shift_AL _Shift,_StartValue
		{
			__RValue.WriteLN '__Test.Shift_AL '#`_Shift#','#`_StartValue
			XOR RAX,RAX
			MOV RAX, _StartValue;110101B
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AL,1
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AL,2
			__BiTest_MonoScript "RAX=",64, RAX
			__SharpX 20
		}
		;__Test.Shift_AL ROR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AL ROL,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AL SHR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AL SHL,1000000011111110000000111111000000111110000011110000111000110010b
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		macro __Test.Shift_AH _Shift,_StartValue
		{
			__RValue.WriteLN '__Test.Shift_AH '#`_Shift#','#`_StartValue
			XOR RAX,RAX
			MOV RAX, _StartValue;110101B
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AH,1
			__BiTest_MonoScript "RAX=",64, RAX
			_Shift AH,2
			__BiTest_MonoScript "RAX=",64, RAX
			__SharpX 20
		}
		;__Test.Shift_AH ROR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AH ROL,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AH SHR,1000000011111110000000111111000000111110000011110000111000110010b
		;__Test.Shift_AH SHL,1000000011111110000000111111000000111110000011110000111000110010b
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;XOR RAX,RAX
		;MOV AX, 11111111B
		__SharpX 20
		
		cinvoke system,_Pause
        jmp exit ;???????
exit:
		;invoke ExitProcess, 0
		push 0
		call [ExitProcess]