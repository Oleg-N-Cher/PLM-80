@ECHO OFF
IF NOT "%XDev%"=="" SET PATH=%XDev%\WinDev\Bin\MinGW\bin

SET Warnings=-Wno-incompatible-pointer-types -Wno-implicit-int -Wno-int-to-pointer-cast
SET CC=gcc.exe -m32 -s -Os -g0 %Warnings% -Wfatal-errors -std=c99 -fvisibility=hidden -fomit-frame-pointer -finline-small-functions -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--file-alignment,512
SET FileList=io.c asm1m.c asm2m.c asm3m.c asm4m.c asm5m.c asm6m.c asm8m.c cntrlm.c debug.c emitm.c globlm.c initm.c keym.c listm.c pcktok.c rdsrc.c startm.c

%CC% %FileList% -o ..\..\asm80.exe
IF errorlevel 1 PAUSE
