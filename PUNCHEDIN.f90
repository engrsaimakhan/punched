! program to take input for Punch
PRINT *, "*********Please enter the value below, once all the values are entered, data is going to saved to PUNCHED.DAT file*********"
PRINT *, "  "
PRINT *, "Enter value for Clear Span Between Girders (e.g., 1670.000):"
READ(*, *) C
PRINT *, "Enter value for Diameter of Equivalent Circle for Load (e.g., 646.000):"
READ(*, *) B
PRINT *, "Enter value for Maximum Compressive Stress of Concrete (e.g., 25.000):"
READ(*, *) FPC
PRINT *, "Enter value for Strap to Load Spacing (e.g., 0.000):"
READ(*, *) SL
PRINT *, "Enter value for Depth Of Slab (e.g., 175.000):"
READ(*, *) D
PRINT *, "Enter value for Beta to Define Rectangular Stress Block (e.g., 0.850000):"
READ(*, *) B1
PRINT *, "Enter value for Concrete Constant used for confinement (e.g., 10.000):"
READ(*, *) CK
PRINT *, "Enter value for Area of Load Patch (e.g., 216550.000):"
READ(*, *) A
PRINT *, "Enter value for Bar Spacing (e.g., 0.300E+03):"
READ(*, *) BS
PRINT *, "Enter value for Equivalent Bar Diameter (e.g., 24):"
READ(*, *) BDIAEQ
PRINT *, "Enter value for STRESS Level Increment (e.g., 50.0):"
READ(*, *) STLVLINC
PRINT *, "Enter value for Modulus of Elascity (e.g., 200000.000):"
READ(*, *) E
PRINT *, "Enter value for Yield strain (e.g., 0.002000):"
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

1 FORMAT(1X,F10.3,1X,F10.3,1X,F10.3,1X,F8.1)
2 FORMAT(1X,F10.3,1X,F10.6,1X,F10.3,1X,F12.3,1X,E10.3,1X,F3.0,1X,F3.0)
3 FORMAT(1X,F10.3,1X,F7.3)
4 FORMAT(1X,I1)
5 FORMAT(7/)

END