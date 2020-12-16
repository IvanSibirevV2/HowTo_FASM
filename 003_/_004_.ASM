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
section '.macro' code readable executable
		_a db 'a',0
		_A db 'A',0
	
	macro __BitTest_Al
	{
		push rax
		local m_1
		local m_2
		and al,10000000b
		 cmp al,0b
		 jnz m_2
		 cinvoke printf,'0';==0
		 jmp m_1
		 m_2:cinvoke printf,'1';==1
		 m_1:pop rax 
	}
	macro __BinTest_Al
	{
		local m_1,m_2,m_3
		push rax 
		xor cx,cx
		mov cx,8
		m_1:
			push cx
			__BitTest_Al
			pop cx
			shl Al,1
			sub cx,1
			
			cmp cx,4
			je m_3
			jmp m_2
			m_3:
				push rax
				push cx
					cinvoke printf,'_'
				pop cx
				pop rax
			m_2:
			
			cmp cx,0
		jnz m_1
		pop rax
		cinvoke printf,'b'
	}
	macro __BinTest_Ax
	{
		push rax
		shr Al,8
		__Test_Al
		
		__Test_Al
		cinvoke printf,'b';==0
		pop rax 
	}
;	macro __DiffLine a1,a2,a3
;	{
;		a1
;		a2
;		a3
;	}
;	macro __DiffLine [name,value]
;	{
;		forward
;			#name = value
;	}

;macro __DiffLine value{value}
section '.code' code readable executable
	
	
start:
	
        cinvoke setlocale,0,_Russian
        ;Вывод на экран текста
		cinvoke printf,'!'
		cinvoke printf,_N
		cinvoke printf,'!'
		;__DiffLine a1,a2,a3
		
		mov ax,1000000010000000b
		__BinTest_Al
		;_MacroPrintfChar 'q'
		cinvoke printf,_N
		
		mov ax,1000000010000000b
		
		
		
		
		cinvoke printf,_hello
		;Переход на новую строку
		cinvoke printf,_N
		cinvoke printf,_hello2
		cinvoke printf,_N
		cinvoke scanf,fmat, a
		
		cinvoke system,_Pause
exit:
        invoke ExitProcess, 0