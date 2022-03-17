@echo off
cd %~dp0
set FileName=_JMPS_

C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
%FileName%.EXE
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" "C:\D\Git_Hub\HowTo_FASM"
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe"
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" _001_List.bat
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" _001_List.bat
:: C:\D\Git_Hub\HowTo_FASM\Fasm\TOOLS\DOS\LISTING.EXE -a %FileName%.ASM %FileName%.lst

pause