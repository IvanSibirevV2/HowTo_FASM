@echo off
echo %cd%
cd C:\D\Git_Hub\HowTo_FASM\003_
echo %cd%
set FileName=_004_
C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
%FileName%.EXE

pause