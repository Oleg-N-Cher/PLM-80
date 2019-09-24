@ECHO OFF
IF NOT "%XDev%"=="" SET PATH=%XDev%\WinDev\Bin\MinGW\bin

SET Warnings=-Wno-implicit-int
SET CC=gcc.exe -m32 -s -Os -g0 %Warnings% -Wfatal-errors -std=c99 -fvisibility=hidden -fomit-frame-pointer -finline-small-functions -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--file-alignment,512
SET FileList=io.c lib.c lib1.c lib3.c lib4.c

%CC% %FileList% -o ..\..\lib.exe
IF errorlevel 1 PAUSE
