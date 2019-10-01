; I/O library for ZX Spectrum

PUBLIC PUTCH

        CSEG
PUTCH:  MOV  A, C
        RST  2
        RET

PUBLIC CLRSCR

        CSEG
CLRSCR: CALL 0D6BH
        MVI  A, 2
        JMP  1601H
END
