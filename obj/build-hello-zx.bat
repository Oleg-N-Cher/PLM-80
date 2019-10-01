@SET Name=Hello

@ECHO OFF
SET PATH=..\bin
CD ..\src

asm80 ZX.asm
IF EXIST ZX.LST DEL ZX.LST
IF EXIST ZX.OBJ MOVE /Y ZX.OBJ ..\obj\ZX.OBJ >NUL

plm80 %Name%.plm optimize
IF EXIST %Name%.LST DEL %Name%.LST
IF EXIST %Name%.OBJ MOVE /Y %Name%.OBJ ..\obj >NUL

CD ..\obj
link Hello.obj,ZX.obj to Hello1.obj
locate Hello1.obj to Hello2.obj restart0 code(30003) data(31000) stacksize(100) purge

cpm ..\bin\objcpm hello2.obj
echo.
echo.
stripbin hello2.COM -b

IF EXIST %Name%.SYM DEL %Name%.SYM
IF EXIST %Name%2.COM MOVE /Y %Name%2.COM %Name%.bin >NUL

::dasmx -c8080 -o30000 -a %Name%.bin

::bin2tap -c 29999 -a 30000 -r 30000 -b -o ..\%Name%.tap %Name%.bin
bin2data -rem -org 30000 %Name%.bin ..\%Name%.tap %Name%

PAUSE
