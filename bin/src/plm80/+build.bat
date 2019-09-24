@ECHO OFF
IF NOT "%XDev%"=="" SET PATH=%XDev%\WinDev\Bin\MinGW\bin

SET Warnings=-Wno-implicit-int -Wno-builtin-declaration-mismatch -Wno-endif-labels
SET CC=gcc.exe -m32 -s -Os -g0 %Warnings% -Wfatal-errors -std=c99 -fvisibility=hidden -fomit-frame-pointer -finline-small-functions -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--file-alignment,512
::chain.c debug.c wrec.c
SET FileList=accessors.c adninf.c alloc.c allocs.c backup.c cpytil.c creati.c data.c endcom.c fatal.c fatlio.c fi.c findmi.c fiscop.c io.c itoa.c lookup.c lstinf.c lstlin.c lstsup.c main.c main0.c main1.c main2.c main3.c main4.c main5.c main6.c page.c pdata4.c pdata6.c plm0a.c plm0b.c plm0e.c plm0f.c plm0g.c plm0h.c plm1a.c plm1b.c plm1c.c plm1d.c plm1e.c plm1f.c plm2a.c plm2b.c plm2c.c plm2d.c plm2e.c plm2f.c plm2g.c plm2h.c plm3a.c plm3b.c plm4a.c plm4b.c plm4c.c plm6a.c plma.c plmb.c plmfile.c prints.c putlst.c strcmp.c util.c wrclst.c

%CC% %FileList% -o ..\..\plm80.exe
IF errorlevel 1 PAUSE
