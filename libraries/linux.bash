#!/bin/bash
libraryName="MyLibrary"
libraryVersion="1.0.0"

echo "#pragma once" > libraries/${libraryName}-${libraryVersion}.a
echo ".section .text" >> libraries/${libraryName}-${libraryVersion}.a
echo ".globl <YourLibraryName>_<YourFunctionName>" >> libraries/${libraryName}-${libraryVersion}.a
echo ".type <YourLibraryName>_<YourFunctionName>, STT_FUNC" >> libraries/${libraryName}-${libraryVersion}.a
echo "<YourLibraryName>_<YourFunctionName>:" >> libraries/${libraryName}-${libraryVersion}.a
echo "  ret" >> libraries/${libraryName}-${libraryVersion}.a
echo ".size <YourLibraryName>_<YourFunctionName>, .-<YourLibraryName>_<YourFunctionName>" >> libraries/${libraryName}-${libraryVersion}.a
echo ".hidden <YourLibraryName>_<YourFunctionName>" >> libraries/${libraryName}-${libraryVersion}.a
echo ".section .note.GNU-build-id,\"\",@note,build-id" >> libraries/${libraryName}-${libraryVersion}.a
echo "  .dwo_Id  0 0 0 0" >> libraries/${libraryName}-${libraryVersion}.a
echo "  .dw_tag  DW_IS_COMpressed_DATA" >> libraries/${libraryName}-${libraryVersion}.a
echo "  .dw_compressed_data" >> libraries/${libraryName}-${libraryVersion}.a
echo " 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> libraries/${libraryName}-${libraryVersion}.a
echo " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> libraries/${libraryName}-${libraryVersion}.a
echo " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0" >> libraries/${libraryName}-${libraryVersion}.a
echo " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0For Windows, you can use the following script to generate a library file (.lib):
```batch
@echo off
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
echo END > libraries\%libraryName%-%libraryVersion%.lib
