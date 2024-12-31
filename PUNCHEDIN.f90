! program to take input for Punch
PRINT *, "*********Please enter the value below, once all the values are entered, data is going to saved to PUNCHED.DAT file*********"
PRINT *, "  "
PRINT *, "Enter value for Clear Span Between Girders"
READ(*, *) C
PRINT *, "Enter value for Diameter of Equivalent Circle for Load"
READ(*, *) B
PRINT *, "Enter value for Maximum Compressive Stress of Concrete"
READ(*, *) FPC
PRINT *, "Enter value for Strap to Load Spacing"
READ(*, *) SL
PRINT *, "Enter value for Depth Of Slab"
READ(*, *) D
PRINT *, "Enter value for Beta to Define Rectangular Stress Block"
READ(*, *) B1
PRINT *, "Enter value for Concrete Constant used for confinement"
READ(*, *) CK
PRINT *, "Enter value for Area of Load Patch"
READ(*, *) A
PRINT *, "Enter value for Bar Spacing"
READ(*, *) BS
PRINT *, "Enter value for Equivalent Bar Diameter"
READ(*, *) BDIAEQ
PRINT *, "Enter value for STRESS Level Increment"
READ(*, *) STLVLINC
PRINT *, "Enter value for Modulus of Elasticity"
READ(*, *) E
PRINT *, "Enter value for Yield Strain"
READ(*, *) SNY
PRINT *, "Enter value for Unit of Stress (0-American, 1-Metric):"
READ(*, *) IU

OPEN(80,FILE='PUNCHED.DAT',action="WRITE",status="unknown")
WRITE(80,1)C,B,FPC,SL
WRITE(80,2)D,B1,CK,A,BS,BDIAEQ,STLVLINC
WRITE(80,3)E,SNY
WRITE(80,4)IU
PRINT*,' Input File is saved successfully!'
PRINT*,'' 
READ(*,*)

1 FORMAT(1X,F10.3,1X,F10.3,1X,F10.3,1X,F8.1)
2 FORMAT(1X,F10.3,1X,F10.6,1X,F10.3,1X,F12.3,1X,E10.3,1X,F3.0,1X,F3.0)
3 FORMAT(1X,F10.3,1X,F7.3)
4 FORMAT(1X,I1)
5 FORMAT(7/)

END