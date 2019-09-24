@ECHO OFF
IF NOT "%XDev%"=="" SET PATH=%XDev%\WinDev\Bin\MinGW\bin

SET Warnings=-Wno-aggressive-loop-optimizations
SET CC=gcc.exe -m32 -s -Os -g0 %Warnings% -Wfatal-errors -std=c99 -fvisibility=hidden -fomit-frame-pointer -finline-small-functions -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--file-alignment,512
SET FileList=binasc.c errrpt.c io.c lineuc.c link.c link1a.c link3.c link3a.c linkov.c mkfnam.c pstafn.c pstfn.c skpspc.c strequ.c wrerr.c

%CC% %FileList% -o ..\..\link.exe
IF errorlevel 1 PAUSE
