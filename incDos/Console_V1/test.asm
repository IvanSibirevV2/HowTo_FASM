include 'PROC16.INC'

org $100

  stdcall print, string
  xor ax, ax
  int $16
  ret

proc print, string

  mov si, [string]
  mov ah, $0E
  xor bx, bx
  jmp .loadChar

.printChar:
  int $10

.loadChar:
  lodsb
  test al, al
  jnz .printChar

  ret
endp

string db 'hola', 0