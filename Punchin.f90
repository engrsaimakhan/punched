! program to take input for Punch
USE MSFLIB
IMPLICIT NONE
REAL(8)::S,B,FC,K,DIS,D,BETA,CONS,DELTA,EPSILON
INTEGER::UNIT
CHARACTER(1)::KEY

WRITE(*,16)


WRITE(*,1)
READ*,S

WRITE(*,2)
READ*,B

WRITE(*,3)
READ*,FC

WRITE(*,4)
READ*,K

WRITE(*,5)
READ*,DIS

WRITE(*,6)
READ*,D

WRITE(*,7)
READ*,BETA

WRITE(*,8)
READ*,CONS

WRITE(*,9)
READ*,DELTA

WRITE(*,10)
READ*,EPSILON

WRITE(*,11)
READ*,UNIT

!CALL system('CLS')
OPEN (1,file="Punch.dat",action="WRITE",status="unknown")
WRITE(1,13)S,B,FC,K,DIS
WRITE(1,14)D,BETA,CONS,DELTA,EPSILON
WRITE(1,15)UNIT
WRITE(*,12)
PRINT*,' Input File is being saved successfully!'
PRINT*,'' 
PRINT*,' Press any key to Exit'
PRINT*,''

KEY=getcharqq()




1 FORMAT(/3X,'SPACING OF GIRDERS:  ',\)
2 FORMAT(/3X,'DIAMETER OF EQUIVALENT CIRCLE FOR LOADED AREA   :  ',\)
3 FORMAT(/3X,'COMPRESSIVE STRENGTH OF CONCRETE IN BRIDGE DECK:  ',\)
4 FORMAT(/3X,'TRANSVERSE RESTRAINT STIFFNESS:   ',\)
5 FORMAT(/3X,'LONGITUDINAL DISTANCE FROM WHEEL LOAD TO NEAREST STRAP:   ',\)
6 FORMAT(/3X,'DEPTH OF CONCRETE:   ',\)
7 FORMAT(/3X,'RECTANGULAR STRESS BLOCK PARAMETER:   ',\)
8 FORMAT(/3X,'CONCRETE CONFINEMENT CONSTANT:   ',\)
9 FORMAT(/3X,'AREA OF RECTANGULAR STRESS BLOCK:   ',\)
10 FORMAT(/3X,'YIELD STRAIN OF STRAP:   ',\)
11 FORMAT(/3X,'UNIT(0-American  1-Metric):    ',\)
12 FORMAT(7/)
13 FORMAT(5(1X,F10.3))
14 FORMAT(1X,F10.3,1X,F10.6,1X,F10.3,1X,F12.3,1X,E10.3)
15 FORMAT(1X,I1)
16 FORMAT(//20X'*****************************************',&
          /20x'*                                       *',& 
		  /20x'*                 PUNCH IN              *',&
		  /20X'*          Software developed by        *',&
		  /20X'*             John P. Newhook           *',&
		  /20X'*             Aftab Mufti               *',& 
		  /20X'*             Huma Khalid               *',&
		  /20x,'*****************************************')
END