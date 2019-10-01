@SET Name=Hello

@ECHO OFF
SET PATH=..\bin
CD ..\src

asm80 RK.asm
IF EXIST RK.LST DEL RK.LST
IF EXIST RK.OBJ MOVE /Y RK.OBJ ..\obj\RK.OBJ >NUL

plm80 %Name%.plm optimize
IF EXIST %Name%.LST DEL %Name%.LST
IF EXIST %Name%.OBJ MOVE /Y %Name%.OBJ ..\obj >NUL

CD ..\obj
link Hello.obj,RK.obj to Hello1.obj
locate Hello1.obj to Hello2.obj restart0 code(3) data(1000) stacksize(100) purge

cpm ..\bin\objcpm hello2.obj
echo.
echo.
stripbin hello2.COM -b

IF EXIST %Name%.SYM DEL %Name%.SYM
IF EXIST %Name%2.COM MOVE /Y %Name%2.COM %Name%.bin >NUL

::dasmx -c8080 -o0 -a %Name%.bin

bin2rk.exe %Name%.bin
IF EXIST %Name%.rk MOVE /Y %Name%.rk ..\%Name%.rka >NUL
PAUSE
