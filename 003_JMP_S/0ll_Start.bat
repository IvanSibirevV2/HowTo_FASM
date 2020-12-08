@echo off
echo %cd%

cd C:\D\Git_Hub\HowTo_FASM\003_JMP_S
echo %cd%
set FileName=Oll
::C:\Fasm\FASM.EXE %FileName%.ASM
C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
%FileName%.exe
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
@pause