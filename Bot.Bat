color b
@ECHO OFF
cls
GOTO LOOP
SET /a x=1
SET /a y=1
SET /a FIT=0
SET /a MUTA=25
SET /a GENERATION=0
pause

:RESET

SET AA=H
SET AB=H
SET AC=H
SET AD=H
SET AE=H
SET AF=H
SET AG=H
SET AH=H
SET AI=H
SET AJ=H

SET BA=H
SET BB=0
SET BC=0
SET BD=0
SET BE=0
SET BF=0
SET BG=0
SET BH=0
SET BI=0
SET BJ=0

SET CA=H
SET CB=0
SET CC=0
SET CD=0
SET CE=0
SET CF=0
SET CG=0
SET CH=0
SET CI=0
SET CJ=0

SET DA=H
SET DB=0
SET DC=0
SET DD=0
SET DE=0
SET DF=0
SET DG=0
SET DH=0
SET DI=0
SET DJ=0

SET EA=H
SET EB=0
SET EC=0
SET ED=0
SET EE=0
SET EF=0
SET EG=0
SET EH=0
SET EI=0
SET EJ=0

SET FA=H
SET FB=0
SET FC=0
SET FD=0
SET FE=0
SET FF=0
SET FG=0
SET FH=0
SET FI=0
SET FJ=0

SET GA=H
SET GB=0
SET GC=0
SET GD=0
SET GE=0
SET GF=0
SET GG=0
SET GH=0
SET GI=0
SET GJ=0

SET HA=H
SET HB=0
SET HC=0
SET HD=0
SET HE=0
SET HF=0
SET HG=0
SET HH=0
SET HI=0
SET HJ=0

SET IA=H
SET IB=0
SET IC=0
SET ID=0
SET IE=0
SET IF=0
SET IG=0
SET IH=0
SET II=0
SET IJ=0

SET JA=H
SET JB=0
SET JC=0
SET JD=0
SET JE=0
SET JF=0
SET JG=0
SET JH=0
SET JI=0
SET JJ=0

GOTO LA

:PRINTWINDOW

ECHO %AA% %AB% %AC% %AD% %AE% %AF% %AG% %AH% %AI% %AJ% H
ECHO %BA% %BB% %BC% %BD% %BE% %BF% %BG% %BH% %BI% %BJ% H
ECHO %CA% %CB% %CC% %CD% %CE% %CF% %CG% %CH% %CI% %CJ% H
ECHO %DA% %DB% %DC% %DD% %DE% %DF% %DG% %DH% %DI% %DJ% H
ECHO %EA% %EB% %EC% %ED% %EE% %EF% %EG% %EH% %EI% %EJ% H
ECHO %FA% %FB% %FC% %FD% %FE% %FF% %FG% %FH% %FI% %FJ% H
ECHO %GA% %GB% %GC% %GD% %GE% %GF% %GG% %GH% %GI% %GJ% H
ECHO %HA% %HB% %HC% %HD% %HE% %HF% %HG% %HH% %HI% %HJ% H
ECHO %IA% %IB% %IC% %ID% %IE% %IF% %IG% %IH% %II% %IJ% H
ECHO %JA% %JB% %JC% %JD% %JE% %JF% %JG% %JH% %JI% %JJ% H
ECHO H H H H H H H H H H 
GOTO LC

:FlyTrack

if %x% equ 0 SET F=A
if %x% equ 1 SET F=B
if %x% equ 2 SET F=C
if %x% equ 3 SET F=D
if %x% equ 4 SET F=E
if %x% equ 5 SET F=F
if %x% equ 6 SET F=G
if %x% equ 7 SET F=H
if %x% equ 8 SET F=I
if %x% equ 9 SET F=J
if %y% equ 0 SET S=A
if %y% equ 1 SET S=B
if %y% equ 2 SET S=C
if %y% equ 3 SET S=D
if %y% equ 4 SET S=E
if %y% equ 5 SET S=F
if %y% equ 6 SET S=G
if %y% equ 7 SET S=H
if %y% equ 8 SET S=I
if %y% equ 9 SET S=J

SET NUN=%F%%S%
SET %NUN%=X

GOTO LB

:FlyLogic
SET /a FITLAST=%FIT%


IF "%FIT%" leq "%FITLAST%" (
set /a "MUTA=MUTA-1"
) ELSE (
set /A "MUTA=MUTA+1"
)

SET /a MUTB=%MUTA%+200
goto LOOOP

:FlyMove

SET /a num=%random% %%400 +1

if %num% gtr 200 SET DIRECTION=DOWN
if %num% lss 200 SET DIRECTION=RIGHT

IF "%FIT%" leq "%FITLAST%" (
if %num% lss %MUTB% SET DIRECTION=UP
) ELSE (
if %num% lss %MUTA% SET DIRECTION=LEFT
)

if %DIRECTION% equ LEFT SET /a x=%x%-1
if %DIRECTION% equ RIGHT SET /a x=%x%+1
if %DIRECTION% equ UP SET /a y=%y%-1
if %DIRECTION% equ DOWN SET /a y=%y%+1
goto L

:LOOP
SET /a BANG=%TURN%+1
SET /a TURN=0
SET /a GENERATION=GENERATION+1
SET /a FIT=%x%+%y%

SET /a x=1
set /a y=1
goto FlyLogic

:LOOOP
cls
set /a MUTC=(200-%MUTB%)
echo TURN %TURN%    GENERATION %GENERATION%    FITNESS %FIT%    MUTATIONS %MUTC%    TOTAL MOVES %TOTAL%
GOTO FlyMove
:L
goto RESET
:LA
goto FlyTrack
:LB
goto PRINTWINDOW

:LC
SET /a TOTAL=%TOTAL%+1

if %x% equ 0 GOTO LOOP
if %y% equ 0 GOTO LOOP
if %x% equ 10 GOTO LOOP
if %y% equ 10 GOTO LOOP
SET /a TURN=%TURN%+1
if %FIT% equ 18 GOTO END
if %TURN% gtr 24 GOTO LOOP
GOTO LOOOP

:END
color a
echo COMPLETED IN %GENERATION% GENERATIONS WITH %MUTC% MUTATIONS IN %BANG% MOVES
Timeout -T 1
if %BANG% equ 16 GOTO ENDD
GOTO LOOP

:ENDD
COLOR b
GOTO :LOOP
