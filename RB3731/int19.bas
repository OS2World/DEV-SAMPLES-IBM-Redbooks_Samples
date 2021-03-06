'*********************************************************
'*  Program name: INT19.BAS                              *
'*  Created     : 05/05/90                               *
'*  Revised     :                                        *
'*  Author      : Bernd Westphal                         *
'*  Purpose     : Execute INT 19h in an OS/2             *
'*                VDM environment. Only the current      *
'*                should be terminated.                  *
'*  Compiler    : IBM BASIC Compiler/2 V1.00             *
'*  Compile     : BASCOM INT19 /O;                       *
'*  Link        : LINK INT19;                            *
'*  Input param : none                                   *
'*********************************************************

' Variable definition for Interrupt call
TYPE RegType
   ax    AS INTEGER
   bx    AS INTEGER
   cx    AS INTEGER
   dx    AS INTEGER
   bp    AS INTEGER
   si    AS INTEGER
   di    AS INTEGER
   flags AS INTEGER
END TYPE

DECLARE SUB Interrupt (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)

DIM InRegs AS RegType
DIM OutRegs AS RegType

        ' *** Program code ***
        CLS
        COLOR 15
        PRINT "OS/2 Virtual DOS Machine + INT 19h"
        PRINT STRING$(80, 196);
        PRINT
        PRINT "Execution of INT 19h under DOS on a 8086 processor"
        PRINT "will reboot the system."
        PRINT
        PRINT "To prevent a system reboot running under OS/2 Version 2.0,"
        PRINT "the Virtual DOS Machine Manager terminates the current"
        PRINT "VDM if an INT 19h occurs."
        PRINT
        PRINT "Press Enter to execute the INT 19h interrupt"
        PRINT "or press Esc to terminate."
        PRINT
        PRINT "Your choice: ";
GetChr: kb$ = INPUT$(1)
        SELECT CASE kb$
           CASE CHR$(27)
                CLS
                END

           CASE CHR$(13)
                PRINT "OK, restarting ..."
           '    CALL Interrupt(&H19, InRegs, OutRegs)
                CALL Int86(&H19, InRegs, OutRegs)

           CASE ELSE
                GOTO GetChr
        END SELECT


