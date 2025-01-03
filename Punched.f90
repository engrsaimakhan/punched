!
!  PROGRAM TO CALCULATE PUNCH SHEAR AND SNAP-THROUGH LOADS FOR EMPERICAL DESIFG REINFORCED CONCRETE BRIDGE DECKS
!
!     `
!     REAL(8)::C,B,FPC,SL,D,B1,CK,A,BS,BDIAEQ,STLVLINC,E,SNY
!     INTEGER::IU
      DIMENSION AB(10),DIA(10),STLVL(10)
      WRITE(6,*) 'START CALCULATION'
      OPEN(70,FILE='PUNCHED.DAT')
      WRITE(6,*) 'READING DATA'
      READ(70,*) C,B,FPC,SL,D,B1,CK,A,BS,BDIAEQ,STLVLINC,E,SNY,IU
      OPEN(80,FILE='PUNCHED.RES')
      OPEN(90,FILE='PUNCHED.PLT')
      DIA(1)=BDIAEQ
      write(6,*) C,B,FPC,SL,D,B1,CK,A,BS,BDIAEQ,STLVLINC,E,SNY,IU
       DIA(1)=BDIAEQ
      STLVL(1)=0.
      Do 102 IAM= 2,10
      DIA(IAM)=DIA(IAM-1)-1.
      STLVL(IAM)=STLVL(IAM-1)+STLVLINC
  102 END DO
!
!  IU=0, STRESS IN KSI ; IU=1, STRESS IN MPA
!
!  THE 'FCTF' STRESS IN 'PSI' USED IN K&N MODEL
!
      ICOUNT=0
      DELTA=0.
      ASI=0.
      Y=0.
      R4=0.
      W=0.
      ALPHA=0.
      P=0.
      EPS=0.
      PFAIL=0.
      STRN=0.
      SK=0.
      ICL=0.
      IF(IU.EQ.1) FPC1=145.*FPC
      IF(IU.EQ.0) FPC1=1000.*FPC
      FCB=FPC1/(.75+.000025*FPC1)
      FCTF=1007.+0.392*FCB
      IF(IU.EQ.0) FCTF=FCTF/1000.
      IF(IU.EQ.1) FCTF=FCTF/145.
      IF(IU.EQ.0) WRITE(80,*) 'UNITS ENGLISH KIPS, INCHES, SECONDS'
      IF(IU.EQ.1) WRITE(80,*) 'UNITS METRIC  KN, MM, SECOND'
      WRITE(80,*) 'Clear Span Between Girders=',C
      WRITE(80,*) 'Diameter of Equivalent Circle for Load=',B
      WRITE(80,*) 'Maximum Compressive Stress of Concrete=',FPC
      WRITE(80,*) 'Strap to Load Spacing=',SL
      WRITE(80,*) 'Depth Of Slab=',D
      WRITE(80,*) 'Beta to Define Rectangular Stress Block=',B1
      WRITE(80,*) 'Concrete Constant used for confinement=',CK
      WRITE(80,*) 'AREA of Load Patch=',A
      WRITE(80,*) 'Bar Spacing=',BS
      WRITE(80,*) 'Equivalent Bar Diameter=',BDIAEQ
      WRITE(80,*) 'STRESS Level Increment=',STLVLINC
      WRITE(80,*) 'Modulus of Elascity=',E
      WRITE(80,*) 'Yield strain=',SNY
      WRITE(80,*) 'STLVL              EDIA   '
      
      
      
      IF(IU.EQ.0) WRITE(80,*) 'UNITS ENGLISH KIPS, INCHES, SECONDS'
      IF(IU.EQ.1) WRITE(80,*) 'UNITS METRIC  KN, MM, SECOND'
      IF(IU.EQ.0) WRITE(6,*) 'UNITS ENGLISH KIPS, INCHES, SECONDS'
      IF(IU.EQ.1) WRITE(6,*) 'UNITS METRIC  KN, MM, SECOND'
      WRITE(6,*) 'Clear Span Between Girders=',C
      WRITE(6,*) 'Diameter of Equivalent Circle for Load=',B
      WRITE(6,*) 'Maximum Compressive Stress of Concrete=',FPC
      WRITE(6,*) 'Strap to Load Spacing=',SL
      WRITE(6,*) 'Depth Of Slab=',D
      WRITE(6,*) 'Beta to Define Rectangular Stress Block=',B1
      WRITE(6,*) 'Concrete Constant used for confinement=',CK
      WRITE(6,*) 'AREA of Load Patch=',A
      WRITE(6,*) 'Bar Spacing=',BS
      WRITE(6,*) 'Equivalent Bar Diameter=',BDIAEQ
      WRITE(6,*) 'STRESS Level Increment=',STLVLINC
      WRITE(6,*) 'Modulus of Elascity=',E
      WRITE(6,*) 'Yield strain=',SNY
      WRITE(6,*) 'STLVL              EDIA   '
      
      
      
      IF(IU.EQ.0) WRITE(6,*) 'UNITS ENGLISH KIPS, INCHES, SECONDS'
      IF(IU.EQ.1) WRITE(6,*) 'UNITS METRIC  KN, MM, SECOND'
      WRITE(6,*) 'Clear Span Between Girders=',C
      WRITE(6,*) 'Diameter of Equivalent Circle for Load=',B
      WRITE(6,*) 'Maximum Compressive Stress of Concrete=',FPC
      WRITE(6,*) 'Strap to Load Spacing=',SL
      WRITE(6,*) 'Depth Of Slab=',D
      WRITE(6,*) 'Beta to Define Rectangular Stress Block=',B1
      WRITE(6,*) 'Concrete Constant used for confinement=',CK
      WRITE(6,*) 'AREA of Load Patch=',A
      WRITE(6,*) 'Bar Spacing=',BS
      WRITE(6,*) 'Equivalent Bar Diameter=',BDIAEQ
      WRITE(6,*) 'STRESS Level Increment=',STLVLINC
      WRITE(6,*) 'Modulus of Elascity=',E
      WRITE(6,*) 'Yield strain=',SNY
      WRITE(6,*) 'STLVL              EDIA   '
      
      Do 104 I=1,10
      WRITE(80,*) STLVL(I),DIA(I)
      WRITE(6,*) STLVL(I),DIA(I)
  104 END DO
      WRITE(80,*) ' DELTA   ASI     Y      R4       W   ALPHA        P     1   EPS    PFAIL     STRN   AB        SK'
      WRITE(6,*) ' DELTA   ASI     Y      R4       W   ALPHA        P     1   EPS    PFAIL     STRN   AB        SK'
      WRITE(90,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AB,SK
!     WRITE(80,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AB,SK,
!     WRITE(6,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AB,SK,
      IPFAIL=0
      DELTA=0.
      Y=D/100.
      FACT3=.5*(C-B)
    1 CONTINUE
      DELTA=DELTA+D/350.
      ASI=2.*DELTA/C
      ITER=1
    2 CONTINUE
      FACT0=LOG(.5*C/(.5*B+Y))
      IF(FACT0.LE.0) WRITE(80,*) 'FACT0.LT.0 PROGRAM STOPPED'
      IF(FACT0.LE.0) WRITE(6,*) 'FACT0.LT.0 PROGRAM STOPPED'
      IF(FACT0.LE.0) WRITE(6,*) 'FINISH CALCULATION'
      IF(FACT0.LE.0) STOP
      SS=2.*SL
      SSDC=SS/C
      CTHS=1.-SSDC**2
      STRNB=ASI*(D-Y)/(.5*C)
      STRN=CTHS*STRNB
      STRESS=E*STRN
      IF(STRESS.GE.STLVL(1).AND.STRESS.LE.STLVL(2)) EDIA=DIA(1)
      IF(STRESS.GE.STLVL(2).AND.STRESS.LE.STLVL(3)) EDIA=DIA(2)
      IF(STRESS.GE.STLVL(3).AND.STRESS.LE.STLVL(4)) EDIA=DIA(3)
      IF(STRESS.GE.STLVL(4).AND.STRESS.LE.STLVL(5)) EDIA=DIA(4)
      IF(STRESS.GE.STLVL(5).AND.STRESS.LE.STLVL(6)) EDIA=DIA(5)
      IF(STRESS.GE.STLVL(6).AND.STRESS.LE.STLVL(7)) EDIA=DIA(6)
      IF(STRESS.GE.STLVL(7).AND.STRESS.LE.STLVL(8)) EDIA=DIA(7)
      IF(STRESS.GE.STLVL(8).AND.STRESS.LE.STLVL(9)) EDIA=DIA(8)
      IF(STRESS.GE.STLVL(9).AND.STRESS.LE.STLVL(10)) EDIA=DIA(9)
      IF(STRESS.GE.STLVL(10)) EDIA=DIA(10)
      AREA=.25*3.141594*EDIA*EDIA
      ICL=ICL+1
      SK=(E*AREA)/(.5*BS*C)
      R4=0.5*(Y**2)*(0.5*B/Y+1.)*FCTF*FACT0
      W1=0.5*C*SK*ASI*(D-Y)
      IF(STRN.GE.SNY) ICOUNT=ICOUNT+1
      IF(ICOUNT.EQ.1) WC=W1
      IF(ICOUNT.GT.1) W1=WC
      
!      write(80,*), 'W1=',W1,'R4=',R4
!      WRITE(6,*), 'W1=',W1,'R4=',R4
      W=W1-R4
      C2=SK*ASI*(D-Y)/(.85*FPC)
      FACT1=D-0.333333*Y-.5*C2
      FACT2=D-.5*B1*Y-.5*C2
      FACT4=FACT3+ASI*FACT2
      FACT5=FACT2-ASI*FACT3
      FACT=((R4/W)*FACT1+FACT5)/FACT4
 !  write(80,*), R4,W,FACT1,FACT5,FACT4
      IF(FACT.LE.0) WRITE(80,*)'FACT.LE.0 PROGRAM STOPPED'
      IF(FACT.LE.0) WRITE(6,*)'FACT.LE.0 PROGRAM STOPPED'
      IF(FACT.LE.0) WRITE(6,*) 'FINISH CALCULATION'
      IF(FACT.LE.0) STOP
      ALPHA=ATAN(FACT)+ASI
      P=2.*3.14159*W*TAN(ALPHA-ASI)
      SIGMA1=P/A
!
!     RITCHART FAILURE CRITERIA FOR 3-D STRESSES IN CONCRETE
!
      SIGMA3C=FPC*(1.+CK*SIGMA1/FPC)
!
!      ADINA FAILURE CRITERIA FOR 3-D STRESSES IN CONCRETE
!
!      SIGMA3C=FPC*(1.+1.5*SIGMA1)
!      IF(IU.EQ.1) SIGMA1=.145*(P/A)
!      IF(IU.EQ.1) SIGMA3C=FPC*(1.+1.5*SIGMA1)
      C1=P/(.85*3.14159*B*SIN(ALPHA-ASI)*SIGMA3C)
      Y1=C1*COS(ALPHA-ASI)/B1
      EPS=ABS(Y-Y1)
      IF(EPS.EQ.0.) GO TO 3
      IF(ITER.EQ.1000) WRITE(80,*) 'Y=',Y,'Y1=',Y1
      IF(ITER.EQ.1000) WRITE(6,*) 'Y=',Y,'Y1=',Y1
      IF(ITER.EQ.1000) WRITE(6,*) 'FINISH CALCULATION'
      IF(ITER.EQ.5000) STOP
      IF(EPS.GT..00001) Y=Y1
      ITER=ITER+1
!      WRITE(6,*) 'ITER=',ITER
!      WRITE(6,*) 'EPS=',EPS
      IF(EPS.GT..0001) GO TO 2
    3 ESTH=Y*ASI/(.5*B+Y)
      PFAIL=.002-ESTH
      IF(PFAIL.LE.0.) IPFAIL=IPFAIL+1
      IF(IU.EQ.1) W=W/1000.
      IF(IU.EQ.1) R4=R4/1000.
      IF(IU.EQ.1) P=P/1000.
      DEG=180./3.14159
      ASI=DEG*ASI
      ALPHA=DEG*ALPHA
      IF(IPFAIL.NE.1) GO TO 100
      DELTAP=(DELTAP*PFAIL-DELTA*PFAILP)/(PFAIL-PFAILP)
      ASIP=(ASIP*PFAIL-ASI*PFAILP)/(PFAIL-PFAILP)
      YP=(YP*PFAIL-Y*PFAILP)/(PFAIL-PFAILP)
      R4P=(R4P*PFAIL-R4*PFAILP)/(PFAIL-PFAILP)
      WP=(WP*PFAIL-W*PFAILP)/(PFAIL-PFAILP)
      ALPHAP=(ALPHAP*PFAIL-ALPHA*PFAILP)/(PFAIL-PFAILP)
      PP=(PP*PFAIL-P*PFAILP)/(PFAIL-PFAILP)
      EPSP=(EPSP*PFAIL-EPS*PFAILP)/(PFAIL-PFAILP)
      STRNP=(STRNP*PFAIL-STRN*PFAILP)/(PFAIL-PFAILP)
      PFAILP=0.
      WRITE(80,1000) DELTAP,ASIP,YP,R4P,WP,ALPHAP,PP,EPSP,PFAILP,STRNP,EDIA,AREA,SK
      WRITE(6,1000) DELTAP,ASIP,YP,R4P,WP,ALPHAP,PP,EPSP,PFAILP,STRNP,EDIA,AREA,SK
      WRITE(90,1000) DELTAP,ASIP,YP,R4P,WP,ALPHAP,PP,EPSP,PFAILP,STRNP,EDIA,AB,SK
      WRITE(80,*)'*******  Punch Load-Strain in concrete=.002  *******'
      WRITE(6,*)'*******  Punch Load-Strain in concrete=.002  *******'
      STOP
  100 CONTINUE
      WRITE(90,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AREA,SK
      WRITE(80,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AREA,SK
      IF(ICOUNT.GT.1) WRITE(80,*)'*******  Punch Load-Yield Strain in Strap  *******'
      WRITE(6,1000) DELTA,ASI,Y,R4,W,ALPHA,P,EPS,PFAIL,STRN,AREA,SK
      IF(ICOUNT.GT.1) WRITE(6,*)'*******  Punch Load-Yield Strain in Strap  *******'
      IF(ICOUNT.GT.1) WRITE(6,*)''
      IF(ICOUNT.GT.1) WRITE(6,*)''
      IF(ICOUNT.GT.1) WRITE(6,*)'*******  These results are also written in PUNCHED.RES file  *******'
      IF(ICOUNT.GT.1) WRITE(6,*)''
      IF(ICOUNT.GT.1) WRITE(6,*)''
      IF(ICOUNT.GT.1) WRITE(6,*)'PRESS ANY KEY TO EXIT'
      IF(ICOUNT.GT.1) READ(*,*)
      IF(ICOUNT.GT.1) STOP
 1000 FORMAT(1X,F5.2,1X,F5.2,1X,F5.2,2F8.0,F8.2,1X,F8.0,1X,F8.5,2(1X,F8.6),2(1X,F8.2),1X,F8.5,1X,F8.5)
      DELTAP=DELTA
      ASIP=ASI
      YP=Y
      R4P=R4
      WP=W
      ALPHAP=ALPHA
      PP=P
      EPSP=EPS
      STRNP=STRN
      PFAILP=PFAIL
      IF(DELTA.LE.D) GO TO 1
      WRITE(6,*) 'FINISH CALCULATION'
      STOP
      END