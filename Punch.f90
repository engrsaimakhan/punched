!  PROGRAM TO CALCULATE PUNCH SHEAR AND SNAP-THROUGH LOADS
	  USE MSFLIB
	  IMPLICIT NONE
	  REAL(8):: C,B,SK,SL,D,B1,CK,A,SNY,FPC1,FCB,&
	            DELTA,ASI,Y,R4,W,ALPHA,STRN,FPC,FCTF,P,PP,&
				FACT0,FACT1,FACT2,FACT3,FACT4,FACT,FACT5,SS,SSDC,&
				CTHS,STRNB,SIGMA1,SIGMA3C,Y1,ESTH,DEG,DELTAP,IPFAIL,&
				W1,WC,C1,C2,ASIP,YP,WP,R4P,ALPHAP,EPSP,STRNP,PFAILP

      REAL(4)::EPS,PFAIL
	  INTEGER::ICOUNT,ITER,IU
	  CHARACTER*1::KEY
	  
	 
      OPEN(70,FILE='PUNCH.DAT')
      OPEN(80,FILE='PUNCH.RES')
      READ(70,*) C,B,FPC,SK,SL,D,B1,CK,A,SNY,IU
	  
	  CLOSE(70)
	  WRITE(80,20)
	  IF(IU.EQ.0) WRITE(80,*) 'UNITS  ENGLISH  KIPS,  INCHES, SECONDS'
      IF(IU.EQ.1) WRITE(80,*) 'UNITS  METRIC   KN,  MM,  SECOND' 
	  
	  WRITE(80,21)C
	  WRITE(80,22)B
	  WRITE(80,23)FPC
	  WRITE(80,24)SK
	  WRITE(80,25)SL
	  WRITE(80,26)D
	  WRITE(80,27)B1
	  WRITE(80,28)CK
	  WRITE(80,29)A
	  WRITE(80,30)SNY
	   
	  WRITE(80,*) '     DELTA    ALPHA       P       STRN'
	  WRITE(80,31) DELTA,ALPHA,P,STRN

      ICOUNT=0
      IF(IU==1) FPC1=145*FPC
	  IF(IU==0) FPC1=1000.*FPC
	  FCB=FPC1/(.75+.000025*FPC1)
      FCTF=1007+0.392*FCB
      IF(IU==0) FCTF=FCTF/1000.
	  IF(IU==1) FCTF=FCTF/145
	  
	  
     
      
	  IPFAIL=0
      DELTA=0
      Y=D/100
	  FACT3=.5*(C-B)

	  
    1 CONTINUE
      ITER=1
	  DELTA=DELTA+0.5
      ASI=2*DELTA/C
	  
	  
    2 CONTINUE
      FACT0=LOG(.5*C/(.5*B+Y))
      IF(FACT0.LE.0) WRITE(80,*) 'FACT0.LT.0 PROGRAM STOPPED'
      IF(FACT0.LE.0) WRITE(6,*) 'FINISH CALCULATION'
      IF(FACT0.LE.0) GO TO 500
      SS=2*SL
      SSDC=SS/C
      CTHS=1-SSDC**2
      STRNB=ASI*(D-Y)/(.5*C)
	  STRN=CTHS*STRNB
      R4=0.5*(Y**2)*(0.5*B/Y+1)*FCTF*FACT0
      W1=0.5*C*SK*ASI*(D-Y)
      IF(STRN.GE.SNY) ICOUNT=ICOUNT+1
      IF(ICOUNT.EQ.1) WC=W1
      IF(ICOUNT.GT.1) W1=WC
      W=W1-R4
      C2=SK*ASI*(D-Y)/(0.85*FPC)
      FACT1=D-Y/3-.5*C2
      FACT2=D-.5*B1*Y-.5*C2
      FACT4=FACT3+ASI*FACT2
      FACT5=FACT2-ASI*FACT3
      FACT=((R4/W)*FACT1+FACT5)/FACT4
      IF(FACT.LE.0) WRITE(80,*)'FACT.LE.0 PROGRAM STOPPED'
      IF(FACT.LE.0) WRITE(6,*) 'FINISH CALCULATION'
      IF(FACT.LE.0) GO TO 500
      ALPHA=ATAN(FACT)+ASI
      P=2*3.14159*W*TAN(ALPHA-ASI)
	  SIGMA1=P/A
	  
!     RITCHART FAILURE CRITERIA FOR 3-D STRESSES IN CONCRETE
!
      SIGMA3C=FPC*(1+CK*SIGMA1/FPC)
!
!      ADINA FAILURE CRITERIA FOR 3-D STRESSES IN CONCRETE
!	   
!       SIGMA3C=FPC*(1.+1.5*SIGMA1)    
!       IF(IU==1)SIGMA1=.145*(P/A)
!       IF(IU==1)SIGMA3C=FPC*(1+1.5*SIGMA1)
      
	  C1=P/(.85*3.14159*B*SIN(ALPHA-ASI)*SIGMA3C)
      Y1=C1*COS(ALPHA-ASI)/B1
      EPS=ABS(Y-Y1)
      IF(EPS==0) GOTO 3
      IF(ITER==1000) WRITE(80,*) 'Y=',Y,'Y1=',Y1
      IF(ITER==1000) WRITE(6,*) 'FINISH CALCULATION'
      IF(ITER==1000) GO TO 500
      IF(EPS>0.00001) Y=Y1
      

	  ITER=ITER+1
      
	  IF(EPS>0.0001) GO TO 2
    3 ESTH=Y*ASI/(.5*B+Y)
      PFAIL=0.002-ESTH
      IF(PFAIL<=0) IPFAIL=IPFAIL+1
      IF(IU==1)W=W/1000
      IF(IU==1)R4=R4/1000
      IF(IU==1)P=P/1000
      
	  DEG=180/3.14159
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
      PFAILP=0
      
      WRITE(80,*)'*******  Punch Load-Strain in concrete=.002  *******'
      GO TO 500
  100 CONTINUE
  
	  

      IF(ICOUNT.GT.1) WRITE(80,*)'*******  Punch Load-Yield Strain  in Strap  *******'
      IF(ICOUNT.GT.1) GO TO 500
 
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
   	  WRITE(80,31) DELTA,ALPHA,P,STRN
      
	  IF(DELTA<=D) GOTO 1
      

	  

 11 FORMAT(7/)
      
 20 FORMAT(//20X'*****************************************',&
          /20x'*                                       *',& 
		  /20x'*                 PUNCH                 *',&
		  /20X'*          Software developed by        *',&
		  /20X'*             John P. Newhook           *',&
		  /20X'*             Aftab Mufti               *',& 
		  /20X'*             Huma Khalid               *',&
		  /20x,'*****************************************')
 21	   FORMAT(//2X,'Clear Span Between Girders              :',2x,F10.3)
 22    FORMAT(2X,'Diameter of Equivalent Circle for Load  :',2X,F10.3)
 23    FORMAT(2X,'Maximum Compressive Stress of Concrete  :',2X,F10.3)
 24    FORMAT(2X,'Elastic Axial Stiffness of Strap        :',2X,F10.3)
 25    FORMAT(2X,'Strap to Load Spacing                   :',2X,F10.3)
 26    FORMAT(2X,'Depth Of Slab                           :',2X,F10.3)
 27    FORMAT(2X,'Beta to Define Rectangular Stress Block :',2X,F10.3)
 28    FORMAT(2X,'Concrete Constant used for confinement  :',2X,F10.3)
 29    FORMAT(2X,'Area of Load Patch                      :',2X,F10.3)
 30    FORMAT(2X,'Yield strain                             :',2X,E10.3,//)
 31    FORMAT(2X,F8.2,2X,F8.2,2X,F8.0,2x,F8.5)
 500   PRINT*,''!CALL SYSTEM('CLS')
       WRITE(*,11)
       PRINT*,' Analysis done successfully!'
       PRINT*,''
       PRINT*,' Press any key to Exit'
       KEY=GETCHARQQ()
	  
  
 END