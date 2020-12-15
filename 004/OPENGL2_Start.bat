@echo off
echo %cd%
::вПИСЫВАЕМ СВОИ ПУТИ
::cd C:\D\Git_Hub\HowTo_FASM\004
::echo %cd%
::вПИСЫВАЕМ НАЗВАНИЕ Вашего файла
::set FileName=OPENGL2
::вПИСЫВАЕМ СВОИ ПУТИ
::C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
::вПИСЫВАЕМ СВОИ ПУТИ
::%FileName%.EXE

"C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE" "C:\D\Git_Hub\HowTo_FASM\004\OPENGL2.ASM"
"C:\D\Git_Hub\HowTo_FASM\004\OPENGL2.EXE"
pause