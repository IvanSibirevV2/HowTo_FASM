m_M0:
;push eax
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'0'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
;pop eax
ret
m_M1:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'1'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M0
ret
m_M2:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'2'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M1
ret
m_M3:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'3'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M2
ret
m_M4:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'4'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M3
ret
m_M5:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'5'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M4
ret
m_M6:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'6'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M5
ret
m_M7:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'7'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M6
ret
m_M8:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'8'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M7
ret
m_M9:
	mov ah,2
	;;;
	mov dl,'m'
	int 21h
	mov dl,'_'
	int 21h
	mov dl,'M'
	int 21h
	mov dl,'9'
	int 21h
	mov dl,':'
	int 21h
	;;;
	mov dl,0ah
	int 21h
	call m_M8
ret