                                                                       format pe console

include 'INCLUDE/win32ax.inc'

entry main

section '.data!!!' data readable writeable

strHello db 'Hello World !',13,10,0
strCmc db 'now execute the command "cmc" !',13,10,0
strPause db 'pause',0
formatstring db "%d",13,10,0

section '.txt' code executable readable

;  оманда CMC измен€ет значение флага CF на противоположное. Ќа другие флаги или регистры вли€ни€ не оказывает.
; CF ‘лаг переноса
main:
  mov eax, 5
  mov ebx, 5
  add eax, ebx ; выполн€ем сложение чтобы установилс€ флаг CF
  
  ;; оманда "переход, если перенос установлен" выполн€ет ветвление по адресу, 
  ;если флаг переноса равен "1", в противном случае выполн€етс€ следующа€ команда
  jc cf_1_1 ; если в CF сейчас 1 то перейдем по метке cf_1_1
  jmp cf_1_0 ; иначе, перейдем по метке cf_1_0
  
 cf_1_1:
  mov ebx,1       ; выводим 1, что значит что в CF установлен бит
  cinvoke printf,formatstring, ebx
  jmp cf_1_e
 cf_1_0: 
  mov ebx,0       ; выводим 0, что значит что в CF Ќ≈ установлен бит
  cinvoke printf,formatstring, ebx
 cf_1_e:
 
  ; “еперь выполним аналогичное сложение, и применим команду cmc
  cinvoke printf,strCmc
  mov eax, 5
  mov ebx, 5
  add eax, ebx ; выполн€ем сложение чтобы установилс€ флаг CF
  
  ;  оманда CMC измен€ет значение флага CF на противоположное. Ќа другие флаги или регистры вли€ни€ не оказывает.
  cmc
  
  ; оманда "переход, если перенос установлен" выполн€ет ветвление по адресу, 
  ;если флаг переноса равен "1", в противном случае выполн€етс€ следующа€ команда
  jc cf_2_1 ; если в CF сейчас 1 то перейдем по метке cf_2_1 
  jmp cf_2_0 ; иначе, перейдем по метке cf_2_0
  
 cf_2_1:
  mov ebx,1
  cinvoke printf,formatstring, ebx
  jmp cf_2_e
 cf_2_0: 
  mov ebx,0
  cinvoke printf,formatstring, ebx
 cf_2_e:
  
  cinvoke system,strPause;
  push 0
  call [ExitProcess]

 
 
section '.blah' import data readable

library kernel32,'kernel32.dll',\
 msvcrt,'msvcrt.dll' ;; C-Run time from MS. This is always on every windows machine

import kernel32,\
 ExitProcess,'ExitProcess'
import msvcrt,\
 printf,'printf',\
 system,'system'