use32
format PE console
entry start
 
include 'C:\D\Git_Hub\HowTo_FASM\Fasm\INCLUDE\win32a.inc'
 
section '.data' data readable writeable
 
cmd db 'pause',0
m1 db 'Input a b: ',13,10,0
ru db 'Russian',0
hello db 'Привет',0
fmat db '%d %d',0
a dd 0
b dd 0
 
 
section '.code' code readable executable
use32
;include 'inc\m_BitWrite.inc'
;include 'inc\m_BitWritEAX.inc'
start:
 
  cinvoke setlocale,0,ru
  cinvoke printf,hello

  ;call m_BitWritEAX
  
	;mov eax,10000000000000000000000000000000b
	;xor ecx,ecx
	;mov ecx,2
	;m_0:
	;	call m_BitWrite
	;dec ecx 
	;cmp ecx,0b
	;jnz m_0
	;loop m_0

  cinvoke printf,m1
  
  cinvoke scanf,fmat, a,b
 
        
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