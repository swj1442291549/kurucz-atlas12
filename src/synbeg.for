      PROGRAM SYNBEG
c     revised 25may97
C
C     SYNBEG IS THE FIRST PROGRAM IN THE SYNTHE SERIES.
C     IT READS THE INPUT PARAMETERS AND INITIALIZES TAPES 12 AND 13.
C     SUBSEQUENT PROGRAMS READ THE ATOMIC AND MOLECULAR LINE DATA
C     AND WRITE DATA ON TAPES 12 AND 13 FOR LINES FALLING IN
C     THE WAVELENGTH INTERVAL.  SYNTHE READS TAPES 12 AND 13.
C     PARAMETERS ARE PASSED FROM PROGRAM TO PROGRAM VIA TAPE 93.
C     LINES ARE INCLUDED OR LEFT OUT BY INCLUDING OR LEAVING OUT THE
C     PROGRAM THAT READS THEM.  THE NAMES OF ALL THE READING PROGRAMS
C     BEGIN WITH R.  A SUFFIX P MEANS THAT THE PROGRAM READS BOTH
C     PREDICTED AND REAL WAVELENGTHS.  THE P PROGRAMS SHOULD NOT BE USED
C     FOR MAKING DETAILED LINE BY LINE COMPARISONS WITH OBSERVATIONS.
C     THE ORDER OF THESE READING PROGRAMS DOES NOT MATTER
CCC     EXCEPT FOR RNLTE, RLINE, RKP, AND RKPP, WHICH MUST
C     EXCEPT FOR RNLTE, RLINE, AND RGFIRON WHICH MUST
C     COME FIRST AND IN RELATIVE ORDER IF THEY ARE USED.
C
C     RNLTE READS THE NLTE LINE LIST AND SENDS THE DATA EITHER TO SPECTR
C     (IFNLTE=1, N19=0) OR TO SYNTHE (IFNLTE=0, N19=NUMBER OF LINES IN
C     LTE) IF THE LINES ARE TO BE TREATED IN LTE.  IN EITHER CASE THE
C     LINES ARE WRITTEN ON TAPE 19.
C
CCC     RLINE READS ADDITIONS AND CORRECTIONS TO KP.
C     RLINE READS ADDITIONS AND CORRECTIONS TO GFIRON.
C
CCCC     RKP READS KP.  IT ALSO READS A FILE DELETEKP OF LINE NUMBERS
CCCC     OF LINES THAT ARE TO BE DELETED AND STORES THEM IN ARRAY
CCCC     NDELET.  RNLTE AND RLINE WRITE IN THIS ARRAY IF THEY HAVE A
CCCC     LINE THAT IS ALSO IN KP.  A LIST OF IONS TO BE TOTALLY DELETED
CCCC     FROM KP IS ALSO INCLUDED ON DELETEKP AND IS STORED IN ARRAY NELDLT.
C     RGFIRON READS GFIRON.  IT ALSO READS A FILE DELETEGFIRON OF LINE NUMBERS
C     OF LINES THAT ARE TO BE DELETED AND STORES THEM IN ARRAY
C     NDELET.  RNLTE AND RLINE WRITE IN THIS ARRAY IF THEY HAVE A
C     LINE THAT IS ALSO IN GFIRON.  A LIST OF IONS TO BE TOTALLY DELETED
C     FROM GFIRON IS ALSO INCLUDED ON DELETEGFIRON AND IS STORED IN ARRAY NELDLT.
C     THE PRESENT TIME ATLAS7 CANNOT TREAT THE LINES ABOVE THE FIFTH STAGE OF
C     IONIZATION BECAUSE PFSAHA HAS NOT YET BEEN REWRITTEN.
C
CCCC     RKPP READS PREDICTED KP LINES FROM THE MILLION LINE TAPE.
C
C     RBELL READS BELLLIGHT.DAT AND BELLHEAVY.DAT.  THESE ARE THE LIGHT AND
C     HEAVY ELEMENTS, I.E., NOT IRON GROUP, FROM KP AND VARIOUS LABORATORY
C     SOURCES.  THE LISTS WERE PREPARED BY BARBARA BELL.  SOME OF THE LINES ARE
C     GUESSED SO THAT A LINE WILL APPEAR IN THE RIGHT POSITION EVEN IF IT HAS
C     THE WRONG LOG GF.  
C
C             DO NOT USE THESE DATA BLINDLY FOR AN ABUNDANCE ANALYSIS.  
C
      PARAMETER (kw=99)
      DIMENSION DECKJ(7,kw)
      REAL*8 WLBEG,WLEND,RESOLU,RATIO,RATIOLG
      REAL*8 WBEGIN,WLLAST
      character*3 airvac
      DATA DECKJ/kw*0.,kw*0.,kw*0.,kw*0.,kw*0.,kw*0.,kw*0./
C     CALL BEGTIME
      READ(5,1)AIRVAC,WLBEG,WLEND,RESOLU,TURBV,IFNLTE,LINOUT,
     1CUTOFF,IFPRED,NREAD
    1 FORMAT(A3,7X,4F10.4,I3,I7,F10.5,2I5)
      WRITE(6,2)AIRVAC,WLBEG,WLEND,RESOLU,TURBV,IFNLTE,LINOUT,
     1CUTOFF,IFPRED,NREAD
    2 FORMAT(1x,A3,'   WLBEG=',F10.4,'   WLEND=',F10.4,
     1 3x,   'RESOLU=',F10.1,'   TURBV=',F5.2,'   IFNLTE=',I1,
     2 3x,   'LINOUT=',I6,'   CUTOFF=',F7.5,'   IFPRED=',I1/
     3 '   NREAD',I3)
C      RESOLU IS THE RESOLUTION OF THE POINT SPACING IN WL/DELTA WL
C         THUS .001 NM AT 500 NM IS 500000.
C     TURBV IS ADDED TO ANY MICROTURBULENCE ALREADY PRESENT IN THE MODEL
C     IFNLTE=0 SYNTHE COMPUTES NLTELINES IN LTE
C     IFNLTE=1 SPECTR COMPUTES NLTELINES IN NLTE
C     LINOUT IS LIMIT ON PRINTOUT OF SPECTRUM
C
C     LINOUT IS ALSO A SWITCH THAT TURNS OFF SAVING LINE DATA IN ORDER TO
C        SPEED UP THE PROGRAMS AND SAVE ON STORAGE.  IF LINOUT.LT.0 LINE 
C        DATA ARE NOT SAVED.  IF LINOUT.GE.0 LINE DATA ARE SAVED.
C
C     IFVAC DOES NOT WORK PROPERLY FOR ALL LINES ON THE KP TAPE
C     CUTOFF IS THE FRACTION OF THE CONTINUUM OPACITY BELOW WHICH
C        WINGS OF LINES ARE NOT COMPUTED
C     IFPRED=0 LEAVE OUT LINES WITH PREDICTED WAVELENGTHS
C     IFPRED=1 USE ALL LINES
C     IF NREAD GT 0   READ NREAD CARDS CONTAINING DEPTH DEPENDENT
C         VARIABLES FOR THE MODEL SUCH AS DEPTH DEPENDENT DOPPLER
C         SHIFTS AND MAGNETIC FIELDS.  UP TO SEVEN VARIABLES ARE PASSED. 
      IFVAC=1
      IF(AIRVAC.EQ.'AIR')IFVAC=0
      IF(AIRVAC.EQ.'VAC')IFVAC=1
      RATIO=1.+1./RESOLU
      RATIOLG=DLOG(RATIO)
      IXWLBEG=DLOG(WLBEG)/RATIOLG
      WBEGIN=DEXP(IXWLBEG*RATIOLG)
      IF(WBEGIN.LT.WLBEG)THEN
      IXWLBEG=IXWLBEG+1
      WBEGIN=DEXP(IXWLBEG*RATIOLG)
      ENDIF
      IXWLEND=DLOG(WLEND)/RATIOLG
      WLLAST=DEXP(IXWLEND*RATIOLG)
      IF(WLLAST.GE.WLEND)THEN
      IXWLEND=IXWLEND-1
      WLLAST=DEXP(IXWLEND*RATIOLG)
      ENDIF
      LENGTH=IXWLEND-IXWLBEG+1
      DWLBEG=WBEGIN*RATIO-WBEGIN
      DWLLAST=WLLAST-WLLAST/RATIO
      WRITE(6,3)LENGTH,RATIO,WBEGIN,DWLBEG,WLLAST,DWLLAST
    3 FORMAT(8H0LENGTH=,I6,9H   RATIO=,F12.10,9H  WBEGIN,F10.4,
     1 10H   DWLBEG=,F7.5,10H   WLLAST=,F10.4,11H   DWLLAST=,F7.5)
      N19=0
C      DO 5 ILINE=1,50000
C    5 NDELET(ILINE)=0
C      DO 6 NELION=1,594
C    6 NELDLT(NELION)=1
      NLINES=0
      IF(NREAD.GT.0)THEN
      READ(5,7)
      DO 9 I=1,NREAD 
      READ(5,7)J,(DECKJ(K,J),K=1,7)
    7 FORMAT(I3,7X,7F10.3)
    9 WRITE(6,7)J,(DECKJ(K,J),K=1,7)
      ENDIF
c      OPEN(UNIT=12,FILE='TAPE12',STATUS='NEW',FORM='UNFORMATTED')
      OPEN(UNIT=12,STATUS='UNKNOWN',FORM='UNFORMATTED')
      CLOSE(UNIT=12)
      OPEN(UNIT=14,STATUS='UNKNOWN',FORM='UNFORMATTED')
      CLOSE(UNIT=14)
      OPEN(UNIT=19,STATUS='UNKNOWN',FORM='UNFORMATTED')
      CLOSE(UNIT=19)
      OPEN(UNIT=20,STATUS='UNKNOWN',FORM='UNFORMATTED')
      CLOSE(UNIT=20)
      WRITE(93)NLINES,LENGTH,IFVAC,IFNLTE,N19,TURBV,DECKJ,IFPRED,
     1WLBEG,WLEND,RESOLU,RATIO,RATIOLG,CUTOFF,LINOUT
C     CALL ENDTIME
      CALL EXIT
      END
