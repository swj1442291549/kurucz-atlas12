      PROGRAM SPECTRV
c     revised 4nov14   constants given D exponents
c     revised 16dec97
      IMPLICIT REAL*8 (A-H,O-Z)
      PARAMETER (kw=99)
      COMMON /ABROSS/ABROSS(kw),TAUROS(kw)
      COMMON /ABTOT/ABTOT(kw),ALPHA(kw)
      COMMON /BAL/BAL1(kw,9),AAL1(kw),SAL1(kw),XNFPAL(kw,2),BAL2(kw,1)
      COMMON /BB/BB1(kw,7),XNFPB(kw,1)
      COMMON /BC/BC1(kw,14),AC1(kw),SC1(kw),XNFPC(kw,2),BC2(kw,6)
      COMMON /BCA/BCA1(kw,8),BCA2(kw,5),XNFPCA(kw,2)
      COMMON /BFE/BFE1(kw,15),AFE1(kw),SFE1(kw),XNFPFE(kw,1)
      COMMON /BHE/BHE1(kw,29),AHE1(kw),SHE1(kw),BHE2(kw,6),AHE2(kw),
     1            SHE2(kw),AHEMIN(kw),SIGHE(kw),XNFPHE(kw,3),XNFHE(kw,2)
      COMMON /BHYD/BHYD(kw,8),AHYD(kw),SHYD(kw),AH2P(kw),BMIN(kw),
     1             AHMIN(kw),SHMIN(kw),SIGH(kw),SIGH2(kw),AHLINE(kw),
     2             SHLINE(kw),XNFPH(kw,2),XNFH(kw)
      COMMON /BK/BK1(kw,8),XNFPK(kw,1)
      COMMON /BMG/BMG1(kw,11),AMG1(kw),SMG1(kw),XNFPMG(kw,2),BMG2(kw,6)
      COMMON /BNA/BNA1(kw,8),XNFPNA(kw,1)
      COMMON /BO/BO1(kw,13),XNFPO(kw,1),BO2(kw,4)
      COMMON /BSI/BSI1(kw,11),ASI1(kw),SSI1(kw),XNFPSI(kw,2),BSI2(kw,10)
      COMMON /CONV/DLTDLP(kw),HEATCP(kw),DLRDLT(kw),VELSND(kw),
     1             GRDADB(kw),HSCALE(kw),FLXCNV(kw),VCONV(kw),MIXLTH,
     2             IFCONV
      REAL*8 MIXLTH
      COMMON /ELEM/ABUND(99),ATMASS(99),ELEM(99),XABUND(99),WTMOLE
      COMMON /FLUX/FLUX,FLXERR(kw),FLXDRV(kw),FLXRAD(kw)
      COMMON /FREQ/FREQ,FREQLG,EHVKT(kw),STIM(kw),BNU(kw),WAVENO
      COMMON /FRESET/FRESET(500),RCOSET(500),NULO,NUHI,NUMNU,IFWAVE,
     1               WBEGIN,DELTAW
      COMMON /HEIGHT/HEIGHT(kw)
      COMMON /IF/IFCORR,IFPRES,IFSURF,IFSCAT,IFMOL,NLTEON,IFOP(20)
      COMMON /ITER/ITER,IFPRNT(15),IFPNCH(15),NUMITS
      COMMON /JUNK/TITLE(74),FREQID(6),WLTE,XSCALE
      COMMON /MUS/ANGLE(20),SURFI(20),NMU
      COMMON /OPS/ACOOL(kw),ALUKE(kw),AHOT(kw),SIGEL(kw),ALINES(kw),
     1            SIGLIN(kw),AXLINE(kw),SIGXL(kw),AXCONT(kw),SIGX(kw),
     2            SXLINE(kw),SXCONT(kw)
      COMMON /OPTOT/ACONT(kw),SCONT(kw),ALINE(kw),SLINE(kw),SIGMAC(kw),
     1              SIGMAL(kw)
      COMMON /PUT/PUT,IPUT
      COMMON /PZERO/PZERO,PCON,PRADK0,PTURB0,KNU(kw),PRADK(kw),EDENS(kw)
      REAL*8 KNU
      COMMON /RAD/ACCRAD(kw),PRAD(kw)
      COMMON /RHOX/RHOX(kw),NRHOX
      COMMON /STATE/P(kw),XNE(kw),XNATOM(kw),RHO(kw),PTOTAL(kw)
      COMMON /TAUSHJ/TAUNU(kw),SNU(kw),HNU(kw),JNU(kw),JMINS(kw)
      REAL*8 JNU,JMINS
      COMMON /TEFF/TEFF,GRAV,GLOG
      COMMON /TEMP/T(kw),TKEV(kw),TK(kw),HKT(kw),TLOG(kw),HCKT(kw),ITEMP
      COMMON /TURBPR/VTURB(kw),PTURB(kw),TRBFDG,TRBCON,TRBPOW,TRBSND,
     1               IFTURB
C
      COMMON /LINDAT/WL,E,EP,LABEL(2),LABELP(2),OTHER1(2),OTHER2(2),
     1        WLVAC,CENTER,CONCEN, NELION,GAMMAR,GAMMAS,GAMMAW,REF,
     2      NBLO,NBUP,ISO1,X1,ISO2,X2,GFLOG,XJ,XJP,CODE,ELO,GF,GS,GR,GW,
     3        DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,EXTRA1,EXTRA2,EXTRA3
     4,ALINEC(kw)
      REAL*8 LINDAT8(14)
      REAL*4 LINDAT(28)
      EQUIVALENCE (LINDAT8(1),WL),(LINDAT(1),NELION)
      REAL*8 RESOLU,RATIO,RATIOLG,SIGMA2,WLBEG,WLEND
      REAL*8 WL,E,EP,WLVAC,CENTER,CONCEN
      REAL*8 LABEL,LABELP,OTHER1,OTHER2
      REAL*4 GFLOG,XJ,XJP,CODE,GAMMAR,GAMMAS,GAMMAW
      REAL*4 REF,X1,X2,ELO,GF,GS,GR,GW
      REAL*4 DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,EXTRA1,EXTRA2,EXTRA3
      REAL*4 ALINEC
      COMMON /TRASH/WLBEG,WLEND,VT,AIR,N10,IFVAC,NMU2
      COMMON /CORONO/RHOXCO(42),TCO(42),XNECO(42),SCO(42),TCOLOG(42),
     1               VCO(42),ACORON(42),SCORON(42),IFCORO,NCORO
      COMMON /BONE/BONE(kw)
      COMMON /PRD/PRDDOP,PRDPOW,ITPRD,NITPRD,SIGPRD(kw),NUPRD,LINPRD
      REAL*4 TURBV
C      DIMENSION FSCAT(kw),ASYNTH(kw)
      DIMENSION FSCAT(kw)
      REAL*4 ASYNTH(kw)
      DIMENSION FRQEDG(377),WLEDGE(377),CMEDGE(377),CONFRQ(377)
      DIMENSION DELEDGE(377),HALFEDGE(377)
      REAL*8 CONTABS(3,377,kw),CONTSCAT(3,377,kw)
      REAL*8 QCONTABS(1131),QCONTSCAT(1131)
      DIMENSION BFUDGE(kw)
C     41=2*20+1 SO NOT EQUAL 40
      DIMENSION Q(41)
      DIMENSION SURF(20)
      DIMENSION APLOT(101)
      DATA APLOT/101*1H /
      DIMENSION CARD(81)
      DATA CARD/81*1H /
C     
C     R1 IS THE RESIDUAL INTENSITY AT THE BOTTOM OF THE PLOT
C     R2 IS THE RESIDUAL INTENSITY AT THE TOP
C     PRDPOW AND PRDDOP ARE PARTIAL REDISTRIBUTION PARAMETERS
      READ(25,1)RHOXJ,R1,R101,PH1,PC1,PSI1,PRDDOP,PRDPOW
    1 FORMAT(8F10.5)
      WRITE(6,1)RHOXJ,R1,R101,PH1,PC1,PSI1,PRDDOP,PRDPOW
      SLOPE=100./(R101-R1)
      ORIGIN=1.5-R1*SLOPE
      OPEN(UNIT=5,file='fort.5',SHARED,READONLY,TYPE='OLD')
      CALL READIN(20)
C      IF(IFSURF.EQ.0)THEN
C      WRITE(6,*)' SURFACE FLUX OR SURFACE INTENSITY?'
C      CALL ABORT
C      ENDIF
C
      OPEN(UNIT=10,TYPE='OLD',FORM='UNFORMATTED',READONLY,SHARED)
      READ(10)
      READ(10)NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),
     1IEDGE=1,NEDGE)
      READ(10)NCON,(CONFRQ(NU),NU=1,NCON)
      WLEDGE(1)=ABS(WLEDGE(1))
      DO 2001 IEDGE=2,NEDGE
      WLEDGE(IEDGE)=ABS(WLEDGE(IEDGE))
      HALFEDGE(IEDGE-1)=(WLEDGE(IEDGE-1)+WLEDGE(IEDGE))*.5
 2001 DELEDGE(IEDGE-1)=(WLEDGE(IEDGE)-WLEDGE(IEDGE-1))**2*.5
      READ(10)
      IREC=0
      DO 2003 J=1,NRHOX
      READ(10)
      READ(10)QCONTABS
      READ(10)QCONTSCAT
      READ(10)
      NU=0
      DO 2002 IEDGE=1,NEDGE-1
      NU=NU+1
      CONTABS(1,IEDGE,J)=QCONTABS(NU)
      CONTSCAT(1,IEDGE,J)=QCONTSCAT(NU)
      NU=NU+1
      CONTABS(2,IEDGE,J)=QCONTABS(NU)
      CONTSCAT(2,IEDGE,J)=QCONTSCAT(NU)
      NU=NU+1
      CONTABS(3,IEDGE,J)=QCONTABS(NU)
 2002 CONTSCAT(3,IEDGE,J)=QCONTSCAT(NU)
 2003 CONTINUE
      CLOSE(UNIT=10)
C
      IFPRES=0
      ITEMP=1
C      CALL POPS(1.00D0,12,XNFH)
C      CALL POPS(2.01D0,12,XNFHE)
C      CALL POPS(1.01D0,11,XNFPH)
C      CALL POPS(2.02D0,11,XNFPHE)
C      CALL POPS(5.00D0,11,XNFPB)
C      CALL POPS(6.01D0,11,XNFPC)
C      CALL POPS(8.00D0,11,XNFPO)
C      CALL POPS(11.00D0,11,XNFPNA)
C      CALL POPS(12.01D0,11,XNFPMG)
C      CALL POPS(13.01D0,11,XNFPAL)
C      CALL POPS(14.01D0,11,XNFPSI)
C      CALL POPS(20.01D0,11,XNFPCA)
C      CALL POPS(26.00D0,11,XNFPFE)
      CLOSE(UNIT=5)
C      IF(IFMOL.EQ.0.)GO TO 445
CC     PATCH TO GET NUMBER DENSITIES BY MULTIPLYING BY PARTITION FUNCTION
C      DO 444 J=1,NRHOX
C      CALL PFSAHA(J,1,1,3,XNFH)
C      XNFH(J)=XNFPH(J,1)*XNFH(J)
C      CALL PFSAHA(J,2,2,13,XNFHE)
C      XNFHE(J,1)=XNFPHE(J,1)*XNFHE(J,1)
C      XNFHE(J,2)=XNFPHE(J,2)*XNFHE(J,2)
C  444 CONTINUE
C  445 CONTINUE
CC     CALL W(6HXNFPH ,XNFPH ,80)
CC     CALL W(6HXNFPHE,XNFPHE,120)
CC     CALL W(6HXNFPC ,XNFPC ,80)
CC     CALL W(6HXNFPMG,XNFPMG,80)
CC     CALL W(6HXNFPAL,XNFPAL,80)
CC     CALL W(6HXNFPSI,XNFPSI,80)
      DO 4 J=1,NRHOX
      BONE(J)=1.
      BFUDGE(J)=BHYD(J,1)**PH1*(BC1(J,1)/BC2(J,1))**PC1*
     1(BSI1(J,1)/BSI2(J,1))**PSI1
      IF(RHOXJ.EQ.0.)GO TO 4
      FSCAT(J)=0.
      IF(RHOX(J)/RHOXJ.LT.100.)FSCAT(J)=EXP(-RHOX(J)/RHOXJ)
    4 CONTINUE
      CALL W(6HFSCAT ,FSCAT,NRHOX)
      CALL W(6HBFUDGE,BFUDGE,NRHOX)
    5 CONTINUE
      IFPRES=0
      ITEMP=1
      REWIND 7
      REWIND 9
      READ(9)WLBEG,RESOLU,WLEND,LENGTH,N,LINOUT,TURBV,IFVAC
      READ (9)NEDGE,(FRQEDG(IEDGE),WLEDGE(IEDGE),CMEDGE(IEDGE),
     1IEDGE=1,NEDGE)
C     PATCH TO PASS IFVAC TO PLOTSY
      TITLE(74)=1HA
      IF(IFVAC.EQ.1)TITLE(74)=1HV
      N30=N+30
      WRITE(6,11)WLBEG,RESOLU,WLEND,LENGTH,N
   11 FORMAT(7H WLBEG=,F10.4,10H   RESOLU=,F10.1,9H   WLEND=,F10.4,
     110H   LENGTH=,I7,9H   NRHOX=,I2)
      N10=0
      DO 6 J=1,NRHOX
    6 VTURB(J)=VTURB(J)+TURBV*1.E5
      RATIO=1.+1./RESOLU
      RATIOLG=DLOG(RATIO)
      IXWL=DLOG(WLBEG)/RATIOLG
      WBEGIN=DEXP(IXWL*RATIOLG)
      IF(WBEGIN.LT.WLBEG)THEN
      IXWL=IXWL+1
      WBEGIN=DEXP(IXWL*RATIOLG)
      ENDIF
      DELTAW=RESOLU
      NULO=1
      NUHI=LENGTH
      NUMNU=LENGTH
      WLBEG=WBEGIN
      WLEND=WBEGIN*RATIO**(NUHI-1)
      WRITE(6,31)NUMNU,DELTAW,WLBEG,WLEND
   31 FORMAT(I10,3F13.4)
      IF(IFSURF.EQ.1)WRITE(6,41)
   41 FORMAT(13H SURFACE FLUX)
      IF(IFSURF.EQ.2)WRITE(6,42)NMU,(ANGLE(MU),MU=1,NMU)
   42 FORMAT(18H SURFACE INTENSITY,I3/20F6.3)
      NMU2=NMU*2
C     IF(PRDDOP.GT.0.)CALL PRDJNU(RHOXJ)
      IEDGE=1
      DO 25 NU=NULO,NUHI
C     NUPRD=NU
      WAVE=WBEGIN*RATIO**(NU-1)
 2004 IF(WAVE.LT.WLEDGE(IEDGE+1))GO TO 2005
      IEDGE=IEDGE+1
      GO TO 2004
C      C1=(WAVE-WAVE2)*(WAVE-WAVE3)/(WAVE1-WAVE2)/(WAVE1-WAVE3)
C      C2=(WAVE-WAVE1)*(WAVE-WAVE3)/(WAVE2-WAVE1)/(WAVE2-WAVE3)
C      C3=(WAVE-WAVE1)*(WAVE-WAVE2)/(WAVE3-WAVE1)/(WAVE3-WAVE2)
 2005 C1=(WAVE-HALFEDGE(IEDGE))*(WAVE-WLEDGE(IEDGE+1))/DELEDGE(IEDGE)
      C2=(WLEDGE(IEDGE)-WAVE)*(WAVE-WLEDGE(IEDGE+1))*2./DELEDGE(IEDGE)
      C3=(WAVE-WLEDGE(IEDGE))*(WAVE-HALFEDGE(IEDGE))/DELEDGE(IEDGE)
      DO 2006 J=1,NRHOX
      ACONT(J)=10.**(C1*CONTABS(1,IEDGE,J)+C2*CONTABS(2,IEDGE,J)+
     1 C3*CONTABS(3,IEDGE,J))
 2006 SIGMAC(J)=10.**(C1*CONTSCAT(1,IEDGE,J)+C2*CONTSCAT(2,IEDGE,J)+
     1 C3*CONTSCAT(3,IEDGE,J))
C
      FREQ=2.99792458D17/WAVE
      FREQ15=FREQ/1.D15
      FREQLG= LOG(FREQ)
      DO 20 J=1,NRHOX
      EHVKT(J)=EXP(-FREQ*HKT(J))
      STIM(J)=1.-EHVKT(J)
      BNU(J)=1.47439D-02*FREQ15**3*EHVKT(J)/STIM(J)
      ALINE(J)=0.
      SIGMAL(J)=0.
      SLINE(J)=BNU(J)
   20 SCONT(J)=BNU(J)
      CALL JOSH(IFSCAT,IFSURF)
      DO 21 MU=1,NMU
      IF(IFSURF.EQ.1)SURF(MU)=HNU(1)
      IF(IFSURF.EQ.2)SURF(MU)=SURFI(MU)
   21 CONTINUE
C      IF(IFOP(14).EQ.1)CALL HLINOP
C      IF(IFOP(17).EQ.1)CALL XLINOP
      IF(NU.EQ.1)WRITE(6,33)
   33 FORMAT(1H1)
      READ(9)ASYNTH
      DO 241 J=1,NRHOX
C      ALINE(J)=AHLINE(J)+ASYNTH(J)*(1.-FSCAT(J))+AXLINE(J)
      ALINE(J)=ASYNTH(J)*(1.-FSCAT(J))
C      SLINE(J)=BNU(J)
C     ASSUMES BUP=1
C      SSYNTH=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
      SLINE(J)=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
C      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ASYNTH(J)*SSYNTH*
C     1(1.-FSCAT(J))+AXLINE(J)*SXLINE(J))/ALINE(J)
  241 SIGMAL(J)=ASYNTH(J)*FSCAT(J)
      CALL JOSH(1,IFSURF)
      
C     print line formation depths at each layer
      write(33,3333)wave,hnu(1),surf(1),(taunu(j),j=1,nrhox)
 3333 format(f12.4,1p2e12.4/(10e12.4))
      
   24 DO 250 MU=1,NMU
      IF(IFSURF.EQ.1)RESID=HNU(1)/SURF(MU)
      IF(IFCORO.EQ.1)CALL CORINT
      IF(IFSURF.EQ.2)RESID=SURFI(MU)/SURF(MU)
      IF(NU.GT.ABS(LINOUT))GO TO 230
      IF(MU.GT.1)GO TO 230
      IRESID=RESID*1000.+.5
      IPLOT=RESID*SLOPE+ORIGIN
      IPLOT=MAX0(1,MIN0(101,IPLOT))
      APLOT(IPLOT)=1HX
      WRITE(6,2300)NU,WAVE,IRESID,APLOT
 2300 FORMAT(1H ,I5,F11.4,I7,101A1)
      APLOT(IPLOT)=(1H )
  230 CONTINUE
      Q(MU)=RESID*SURF(MU)
      Q(MU+NMU)=SURF(MU)
  250 CONTINUE
      IF(NU.GT.1)GO TO 251
      REWIND 7
      WRITE(7)TEFF,GLOG,TITLE,WBEGIN,DELTAW,NUMNU,IFSURF,NMU,ANGLE,
     1NEDGE,WLEDGE
  251 CONTINUE
      WRITE(7)(Q(I),I=1,NMU2)
   25 CONTINUE
C
      IF(NMU.GT.10)IFSURF=1
      NMU=1
      MU=1
      READ(9)NLINES
      N910=NLINES+N10
      WRITE(7)N910
      WRITE(6,80)NLINES,N10,N910
   80 FORMAT(3I10)
      IF(NLINES.EQ.0)GO TO 100
      WAVOLD=0.
      IEDGE=1
      DO 90 ILINE=1,NLINES
      READ(9)LINDAT8,LINDAT,ALINEC
      WAVE=WLVAC
      IF(WAVE.LT.WAVOLD)IEDGE=1
      WAVOLD=WAVE
 3003 IF(WAVE.LT.WLEDGE(IEDGE+1))GO TO 3005
      IEDGE=IEDGE+1
      GO TO 3003
 3005 C1=(WAVE-HALFEDGE(IEDGE))*(WAVE-WLEDGE(IEDGE+1))/DELEDGE(IEDGE)
      C2=(WLEDGE(IEDGE)-WAVE)*(WAVE-WLEDGE(IEDGE+1))*2./DELEDGE(IEDGE)
      C3=(WAVE-WLEDGE(IEDGE))*(WAVE-HALFEDGE(IEDGE))/DELEDGE(IEDGE)
      DO 3006 J=1,NRHOX
      ACONT(J)=10.**(C1*CONTABS(1,IEDGE,J)+C2*CONTABS(2,IEDGE,J)+
     1 C3*CONTABS(3,IEDGE,J))
 3006 SIGMAC(J)=10.**(C1*CONTSCAT(1,IEDGE,J)+C2*CONTSCAT(2,IEDGE,J)+
     1 C3*CONTSCAT(3,IEDGE,J))
C
      FREQ=2.99792458D17/WAVE
      FREQ15=FREQ/1.D15
      FREQLG= LOG(FREQ)
      DO 81 J=1,NRHOX
      EHVKT(J)=EXP(-FREQ*HKT(J))
      STIM(J)=1.-EHVKT(J)
      SIGPRD(J)=0.
      BNU(J)=1.47439D-02*FREQ15**3*EHVKT(J)/STIM(J)
      ALINE(J)=0.
      SIGMAL(J)=0.
      SLINE(J)=BNU(J)
   81 SCONT(J)=BNU(J)
      CALL JOSH(1,IFSURF)
      IF(IFSURF.EQ.1)CONCEN=HNU(1)
      IF(IFSURF.EQ.2)CONCEN=SURFI(MU)
      DO 82 J=1,NRHOX
      ALINE(J)=AHLINE(J)+ALINEC(J)*(1.-FSCAT(J))+AXLINE(J)
      SLINE(J)=BNU(J)
C     ASSUMES BUP=1
      SLINEC=BNU(J)*STIM(J)/(BFUDGE(J)-EHVKT(J))
      IF(ALINE(J).GT.0.)SLINE(J)=(AHLINE(J)*SHLINE(J)+ALINEC(J)*SLINEC*
     1(1.-FSCAT(J))+AXLINE(J)*SXLINE(J))/ALINE(J)
   82 SIGMAL(J)=ALINEC(J)*FSCAT(J)
      CALL JOSH(1,IFSURF)
      IF(IFSURF.EQ.1)CENTER=HNU(1)
      IF(IFSURF.EQ.2)CENTER=SURFI(MU)
      RESID=CENTER/CONCEN
C      WRITE(6,99)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,WLVAC,RESID,
C     BCENTER,CONCEN,
C     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,
C     2DWL,DGFLOG,GAMMAR,GAMMAS,GAMMAW
   99 FORMAT(1H0,F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,1X,A8,A2,A8,A2,
     1F12.4,F9.3,1P2E11.3/
     2 1X,0PF10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,1X,
     3A8,A2,A8,A2,F7.4,F7.3,3F6.2)
      IF(WL.GT.0.)WRITE(17,98)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW
      IF(WL.LT.0.)WRITE(17,98)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW,WL
   98 FORMAT(F10.4,F7.3,F5.1,F12.3,F5.1,F12.3,F9.2,A8,A2,A8,A2/
     1 0PF10.4,I4,F6.2,F6.2,F6.2,A4,I2,I2,I3,F7.3,I3,F7.3,
     2A8,A2,A8,A2,F7.4,F7.3,3F6.2,F10.4)
      WRITE(7)LINDAT8,LINDAT
   90 CONTINUE
  100 CONTINUE
      CLOSE(UNIT=9,DISPOSE='DELETE')
      IF(N10.EQ.0)GO TO 111
C     N20=N10
      REWIND 20
      WAVOLD=0.
      IEDGE=1
      DO 110 ILINE=1,N10
      READ(20)LINDAT8,LINDAT
      WAVE=WLVAC
      IF(WAVE.LT.WAVOLD)IEDGE=1
      WAVOLD=WAVE
 4003 IF(WAVE.LT.WLEDGE(IEDGE+1))GO TO 4005
      IEDGE=IEDGE+1
      GO TO 4003
 4005 C1=(WAVE-HALFEDGE(IEDGE))*(WAVE-WLEDGE(IEDGE+1))/DELEDGE(IEDGE)
      C2=(WLEDGE(IEDGE)-WAVE)*(WAVE-WLEDGE(IEDGE+1))*2./DELEDGE(IEDGE)
      C3=(WAVE-WLEDGE(IEDGE))*(WAVE-HALFEDGE(IEDGE))/DELEDGE(IEDGE)
      DO 4006 J=1,NRHOX
      ACONT(J)=10.**(C1*CONTABS(1,IEDGE,J)+C2*CONTABS(2,IEDGE,J)+
     1 C3*CONTABS(3,IEDGE,J))
 4006 SIGMAC(J)=10.**(C1*CONTSCAT(1,IEDGE,J)+C2*CONTSCAT(2,IEDGE,J)+
     1 C3*CONTSCAT(3,IEDGE,J))
C
      FREQ=2.99792458D17/WAVE
      FREQ15=FREQ/1.D15
      FREQLG= LOG(FREQ)
      DO 101 J=1,NRHOX
      EHVKT(J)=EXP(-FREQ*HKT(J))
      STIM(J)=1.-EHVKT(J)
      ALINE(J)=0.
      SIGMAL(J)=0.
      BNU(J)=1.47439D-02*FREQ15**3*EHVKT(J)/STIM(J)
      SLINE(J)=BNU(J)
  101 SCONT(J)=BNU(J)
      CALL JOSH(1,IFSURF)
      IF(IFSURF.EQ.1)CONCEN=HNU(1)
      IF(IFSURF.EQ.2)CONCEN=SURFI(MU)
      CALL LINCEN
      IF(IFCORO.EQ.1)GO TO 102
      CALL JOSH(1,IFSURF)
      IF(IFSURF.EQ.1)CENTER=HNU(1)
      IF(IFSURF.EQ.2)CENTER=SURFI(MU)
      GO TO 103
  102 SURFI(MU)=SURF(MU)
      CALL CORINT
      CENTER=SURFI(MU)
  103 CONCEN=SURF(MU)
      RESID=CENTER/CONCEN
c     29oct07 replaced missing comma after OTHER2  
      WRITE(6,99)WL,GFLOG,XJ,E,XJP,EP,CODE,LABEL,LABELP,WLVAC,RESID,
     BCENTER,CONCEN,
     1WL,NELION,GR,GS,GW,REF,NBLO,NBUP,ISO1,X1,ISO2,X2,OTHER1,OTHER2,
     2DWL,DGFLOG,DGAMMAR,DGAMMAS,DGAMMAW
      WRITE(7)LINDAT8,LINDAT
  110 CONTINUE
      CLOSE(UNIT=20,DISPOSE='DELETE')
  111 CALL EXIT
      END
      SUBROUTINE LINCEN
      RETURN
      END
      SUBROUTINE CORINT
      RETURN
      END
      SUBROUTINE ATLAS7
      END
      SUBROUTINE PRDJNU
      RETURN
      END
