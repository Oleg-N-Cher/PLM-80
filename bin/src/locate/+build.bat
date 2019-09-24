@ECHO OFF
IF NOT "%XDev%"=="" SET PATH=%XDev%\WinDev\Bin\MinGW\bin

SET Warnings=-Wno-incompatible-pointer-types -Wno-implicit-int -Wno-int-to-pointer-cast
SET CC=gcc.exe -m32 -s -Os -g0 %Warnings% -Wfatal-errors -std=c99 -fvisibility=hidden -fomit-frame-pointer -finline-small-functions -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--file-alignment,512
SET FileList=io.c loc1.c loc2a.c loc2b.c loc3.c loc4.c loc4a.c loc5a.c loc5b.c loc6.c loc7.c loc8.c loc8a.c loc9.c

%CC% %FileList% -o ..\..\locate.exe
IF errorlevel 1 PAUSE
