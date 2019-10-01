; I/O library for Apogey BK-01

PUBLIC PUTCH

        CSEG
PUTCH:  JMP  0F809h

PUBLIC CLRSCR

        CSEG
CLRSCR: MVI  C, 1FH
        JMP  0F809H
END
