%nprocshared=24
%mem=10000mb
%chk=pvtz_pyrene.chk
#p b3lyp/cc-pvtz Int=NoBasisTransform IOp(10/33=2) NMR guess=read geom=check
 
nmr
 
0 1
  
   
   
