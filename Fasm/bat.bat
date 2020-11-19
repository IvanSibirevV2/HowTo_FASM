set _FASM=C:\Fasm
@echo off
echo %cd%
cd _FASM
echo %cd%

FASM.exe _000_.asm
call "C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" _000_.com
pause