@SET Name=Hello

@ECHO OFF
SET PATH=..\bin
CD ..\src

asm80 IO.asm
IF EXIST IO.LST DEL IO.LST
IF EXIST IO.OBJ MOVE /Y IO.OBJ ..\obj\IO.OBJ >NUL

plm80 %Name%.plm optimize
IF EXIST %Name%.LST DEL %Name%.LST
IF EXIST %Name%.OBJ MOVE /Y %Name%.OBJ ..\obj >NUL

CD ..\obj
link Hello.obj,IO.obj to Hello1.obj
locate Hello1.obj to Hello2.obj restart0 code(30003) data(31000) stack(31500) purge

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
