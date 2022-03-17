@echo off
cd %~dp0
set FileName=Oll
::C:\Fasm\FASM.EXE %FileName%.ASM
C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
%FileName%.exe
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
@pause