m_GetPtr:
jmp m_GetPtr.DadaEnd
	m_GetPtr.TXT db "00$";Указатель в виде указателя
	m_GetPtr.Ptr db "00$";esi=edi;Указатель в виде текста 
m_GetPtr.DadaEnd:
push esi
push edi
push eax
	xor esi,esi
	xor edi,edi
	lea esi,[m_GetPtr.TXT];ESI;Индекс источника;
	lea edi,[m_GetPtr.TXT];EDI;Индекс приёмника;
	;ESI==EDI;Результат будет одинаковый
	mov eax,esi
	mov word [m_GetPtr.Ptr],ax
pop eax
pop esi
pop edi
ret