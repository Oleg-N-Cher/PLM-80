{$APPTYPE CONSOLE}
PROGRAM stripbin;

USES Windows, KOL;

CONST
  PODRYAD = 3;
VAR
  bin: AnsiString;
  binLen, i, idx, ff: INTEGER; lastByte: CHAR;
BEGIN
	IF NOT Kol.FileExists(ParamStr(1)) THEN BEGIN
    WriteLn('No file'); HALT(1)
  END;
  bin := StrLoadFromFile(ParamStr(1)); DELETE(bin, LENGTH(bin), 1); // Final zero
  binLen := LENGTH(bin);
  IF ParamStr(2) = '-b' THEN BEGIN
    IF bin[1] <> #$C3 THEN BEGIN
      WriteLn('Make sure that you have correct binary'); HALT(1)
    END;
    idx := 4; WHILE (idx <= binLen) AND (bin[idx] = #0) DO INC(idx);
    DELETE(bin, 4, idx-4); WriteLn('Stripped ', idx-4, ' zeros');
    binLen := LENGTH(bin);
  END;
  lastByte := bin[binLen]; IF NOT (lastByte IN [#0, #$1A, #$FF]) THEN lastByte := #$FF;
  idx := binLen;
  ff := 0;
  FOR i := binLen DOWNTO 1 DO BEGIN
    idx := i;
    IF bin[i] = lastByte THEN
      INC(ff)
    ELSE
      ff := 0;
    IF ff = PODRYAD THEN BREAK
  END;
  FOR i := idx DOWNTO 1 DO BEGIN
    IF bin[i] <> lastByte THEN BEGIN idx := i; BREAK END
  END;
  WriteLn('New size is ', idx);
  WriteLn('You win ', binLen - idx, ' bytes');
  DELETE(bin, idx + 1, binLen);
  StrSaveToFile(ParamStr(1), bin)
END {stripbin}.
