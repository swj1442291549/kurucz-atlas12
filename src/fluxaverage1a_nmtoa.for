	PROGRAM FLUXAVERAGE1A
	IMPLICIT REAL*8 (A-H,O-Z)
	DIMENSION FLAM1(100000),FLAM2(100000),FLAMC(100000),
	1 AVERHSURF(100000)
	DIMENSION TITLE(74),WLEDGE(200),XMU(20),AVERCONTIN(100000)
	character*1 TITLE
	DATA NPTI/100000/
C
C	FIX THE WAVELENGHT RANGE IN WHICH WE WANT AVERAGED FLUXES
C
	READ(5,56)WAVE1,WAVE2
56	FORMAT(3F10.4)
	WRITE(6,*)WAVE1,WAVE2
C
	READ(5,56)FLAM1(1),FLAM2(1),FLAMC(1)
	WRITE(6,*),FLAM1(1),FLAM2(1),FLAMC(1)
C	FLAM1(1)=362.0
C	FLAM2(1)=362.1
C	FLAMC(1)=362.05
	DO 550 I=2,NPTI
	FLAM1(I)=FLAM1(I-1)+0.100
	FLAM2(I)=FLAM2(I-1)+0.100
	FLAMC(I)=FLAM1(I)+0.0500
C	TYPE*,N,FLAM1(I),FLAM2(I),FLAMC(I)
c	if(flam2(i).gt.wave2)go to 501
	if(flam2(i).ge.wave2)go to 501
550	CONTINUE
C
501     npti=i
c	type*,npti,flam1(npti),flam2(npti),flamc(npti)
	do 1001 k=1,npti
	if(flam1(k).lt.wave1)go to 1001
	nlam1=k
	go to 101
1001	continue
101	CONTINUE
c	type*,nlam1,wave1,flam1(nlam1)
c	OPEN(UNIT=1,FORM='UNFORMATTED',READONLY,STATUS='OLD')
	READ(1)TEFF,GLOG,TITLE,WBEGIN,RESOLU,NWL,IFSURF,NMU,XMU,NEDGE,
	1WLEDGE
2	FORMAT(F10.1,F10.3,/6HTITLE ,74A1/F10.3,F10.1,I10,I5,I5/
	1 10F8.4/10F8.4/I10/(5F16.5))
	WRITE(2,3)TEFF,GLOG
3	FORMAT(5X,F7.0,9X,F8.5,5X)
	WRITE(2,334)TITLE
c334	FORMAT(5HTITLE,74A1)
334	FORMAT(74A1/)
	write(2,335)
c 335	format(4x,'Wavelength',10x,
c     1  'Flux'/5x)	
 335	format(4x,'Wavelength',10x,'Flux'/5x, 'Angstrom',
     1  2x,'erg/sec/cm2/Angstrom')
c	type*,nmu
	K=nlam1
	NAVER=0
	SUMHSURF=0.
	SUMCONTIN=0.
	NIWL=0
	DO 100 I=1,1000000000
	READ(1)HSURF,CONTIN
	NIWL=NIWL+1
	WAVE=WBEGIN*(1.+1./RESOLU)**(NIWL-1)
5	FORMAT(1X,F10.4,2E10.4)
	IF(WAVE.LT.FLAM1(K))GO TO 100
	IF(WAVE.GE.FLAM1(K).AND.WAVE.LE.FLAM2(K)) THEN
	NAVER=NAVER+1
	SUMHSURF=SUMHSURF+HSURF
	SUMCONTIN=SUMCONTIN+CONTIN
c	TYPE*,naver,WAVE,hsurf,sumhsurf
	END IF
	IF(WAVE.GE.FLAM2(K)-0.001) THEN
	AVERHSURF(K)=SUMHSURF/NAVER
	AVERCONTIN(K)=SUMCONTIN/NAVER	
c	IF(K.GT.100000)type*,i,k,flam2(k),averhsurf(k)
	K=K+1
	NAVER=0
	SUMHSURF=0.
	SUMCONTIN=0.
	END IF
	IF(WAVE.GE.wave2-0.001) GO TO 98
100	CONTINUE
98	DO 200 I=1,NPTI
	FLAMC(I)=10.*FLAMC(I)
	freq=2.997925e18/flamc(i)
	FLUXLAM=4.*FREQ/FLAMC(I)*AVERHSURF(I)
	WRITE(2,67)FLAMC(I),FLUXLAM
 67	FORMAT(3X,F9.1,3X,1PE18.12)
200	CONTINUE
	STOP
	END
