@echo off
setlocal EnableDelayedExpansion
set "libraryName=MyLibrary"
set "libraryVersion=1.0.0"

echo #pragma once > libraries\%libraryName%-%libraryVersion%.lib
echo .MODEL FLAT
echo .586
echo .STACK 4096
echo EXTRN _DllMainCRTStartup@12:NEAR
echo EXTRN __imp__<YourLibraryName>#<YourFunctionName>@<FunctionSignature> : PROC
echo PUBLIC _DllMainCRTStartup@12
echo _DllMainCRTStartup@12 PROC
echo   RET
echo _DllMainCRTStartup@12 ENDP
echo END
