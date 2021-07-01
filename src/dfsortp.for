      PROGRAM dfsortp
c     sorts ODFs: for each nu there are 25 ODfs(nu,Pgas) 
      INTEGER*4 IDFOUT(7)
c      INTEGER*2 IDF(12),ISTEPS(12,25,57)
      INTEGER*2 IDF(12),ISTEPS(57,25,12)
      EQUIVALENCE (IDFOUT(2),IDF(1))
      dimension istepnu(1540,25,12),idfoutnu(1540,25)
      open(unit=1,type='old',form='unformatted',
     1 recordtype='fixed',blocksize=32000,recl=8)
	do 5 it=1,1
      DO 6 IP=1,25
      DO 6 nu=1,1540
      READ(1)IDFOUT
      DO 3 ISTEP=1,12
      ISTEPS(IT,IP,istep)=IDF(ISTEP)
      istepnu(nu,ip,istep)=isteps(it,ip,istep)
 3    continue
      idfoutnu(nu,ip)=idfout(1)
c      write(6,4),IDFOUT(1),(isteps(it,IP,istep),istep=1,12)
c	write(6,66)(IDFOUT(I),I=1,7)
66	FORMAT(1X,7I10)
    4 format(1x,i10,1X,12i8)
    6 continue
    5 continue
      it=1
      do 600 nu=1,1540
      do 601 ip=1,25
      do 602 istep=1,12
      isteps(it,ip,istep)=istepnu(nu,ip,istep)
 602  continue
      write(2,22)idfoutnu(nu,ip),(isteps(it,ip,istep),istep=1,12)
c      write(2)idfoutnu(nu,ip),(isteps(it,ip,istep),istep=1,12)
 22   format(1x,i10,1x,12i8)
 601  continue
 600  continue
      CALL EXIT
      END
