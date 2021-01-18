.model tiny
.386
; удобные директивы
   LOCALS @@  ; метки, начиающиеся с двух селедок - локальные - можно повторять
   JUMPS      ; генерируется код, при котором возможны условные переходы дальше 128 байт
.code
org 100h
start:
 mov ax, 3
 int 10h
 
 lea dx, msg_string
 mov ah, 9
 int 21h
 
 mov ah, 0Ah ; удобная функция для ввода строк
 lea dx, buf 
 int 21h
 
; длина фактического ввода = второй байт
; первый байт = заданная максимальная длина ввода
 lea si, buf
 inc si 
 mov cl, [si]
 xor ch, ch   ; теперь в СХ - длина ввода
; сохраним
 mov in_len, cx
; заменим последний байт на 0 - это будет маркер 
 add si, cx
 inc si
 mov byte ptr [si], 0 

extended: 
 lea dx, msg_char
 mov ah, 9
 int 21h
 
 xor ax, ax
 int 16h
 or al, al
 jz extended  ; расширенные проигнорируем
 mov del_char, al
 ; покажем
 int 29h
 
 cld ; буду использовать строковые инструкции
 lea si, buf
 add si, 2 ; пропустим байты длины
@@_next: 
 lodsb
 dec cx
 or al, al ; достигнут 0?
 jz @@_done
 cmp al, del_char
 jne @@_next
    ; удаление сводится к перемещению символов
    push cx ; сохраним СХ
    push si
      inc cx ; число анализируемых символов уже уменьшего - для данного случая - зря
      dec si ; Сейчас SI указывает на следующий символ      
      mov di, si
      inc si
      REP movsb
    pop  si  
    pop  cx
    jmp @@_next
@@_done:

  lea dx, msg_after
  mov ah, 9
  int 21h
  
  lea dx, buf
  add dx, 2
  mov bx, 1
  mov cx, in_len
  mov ah, 40h ; лучше подходит, чем 9-я, так как в строке могут быть символы $
  int 21h
lea dx, msg_press
mov ah, 9
int 21h
xor ax, ax
int 16h
int 20h
msg_press  db  13,10,'Press any key ...$'

msg_char   db  13,10,'Введите символ для удаления: $'
del_char   db  ?
msg_string db  'Введите строку символов длиной до 255 символов:',13,10,'$'
msg_after  db  13,10,'Измененная строка:',13,10,'$'
buf_len    equ 255
in_len     dw  ?
msg_str_empty db 13,10,'Строка пустая$'
    
buf        db  buf_len, buf_len dup (?) ; место для строки
end start