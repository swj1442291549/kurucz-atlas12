      program separatedf
C     sums the ODFs computed for each T
C     separates ODFs in BIG and LITTLE ODFs
      integer*2 isteps(25,57,12)
      open(unit=2,form='unformatted',status='new')
      open(unit=3,form='unformatted',status='new')
      do 1500 inu=1,1540
      do 150 it=1,57
      itape=it+10-1
      do 151 ip=1,25
      read(itape,*)idfout,(isteps(ip,it,istep),istep=1,12)
c      write(6,22)idfout,(isteps(ip,it,istep),istep=1,12)
 22   format(1x,i10,1x,12i8)
 151  continue
      if(inu.le.328)write(2)((isteps(ip,it,istep),istep=1,12),ip=1,25)
      if(inu.gt.328)write(3)((isteps(ip,it,istep),istep=1,12),ip=1,25)
 150  continue
 1500 continue
      close(unit=2)
      close(unit=3)
      stop
      end
