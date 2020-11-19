@echo off
echo %cd%
cd C:\Fasm\Projects\001_JMP_S
echo %cd%
set FileName=jna
C:\Fasm\FASM.EXE %FileName%.ASM
"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
::pause