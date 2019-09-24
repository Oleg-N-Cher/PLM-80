@ECHO OFF
SET unit=d:\WIN32APP\Dev\FPC3\units32
SET src=d:\WIN32APP\Dev\FPC3\src\packages\KOLx64
SET fpc=d:\WIN32APP\Dev\FPC3\ppc386.exe -dUNICODE_CTRLS -Os -OpPENTIUM -Xs -Fu%unit% -Fi%src% -Fu"..\Lib" -FE"."

%fpc% stripbin.dpr
IF errorlevel 1 PAUSE

IF EXIST stripbin.o DEL /Q stripbin.o
IF EXIST stripbin.exe MOVE /Y stripbin.exe ..\..\stripbin.exe
