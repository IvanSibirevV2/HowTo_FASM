@echo off
echo %cd%
cd C:\Fasm\Projects\000_HelloWorld
echo %cd%
set FileName=_000_
C:\Fasm\FASM.EXE %FileName%.ASM
"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
::pause