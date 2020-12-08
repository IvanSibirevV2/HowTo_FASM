@echo off
echo %cd%
cd C:\D\Git_Hub\HowTo_FASM\002_Set_LookOut
echo %cd%
set FileName=_001_

C:\D\Git_Hub\HowTo_FASM\Fasm\FASM.EXE %FileName%.ASM
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.COM
"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" %FileName%.EXE
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" "C:\D\Git_Hub\HowTo_FASM"
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe"
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" _001_List.bat
::"C:\Program Files (x86)\DOSBox-0.74-3\DOSBox.exe" _001_List.bat
:: C:\D\Git_Hub\HowTo_FASM\Fasm\TOOLS\DOS\LISTING.EXE -a %FileName%.ASM %FileName%.lst



::pause