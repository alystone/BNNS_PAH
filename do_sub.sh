#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'

for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
    cd pvtz_${i}
    echo "%nprocshared=24" > nmr.com
    echo "%mem=10000mb" >> nmr.com
    echo "%chk=pvtz_${i}.chk" >> nmr.com
    echo "#p b3lyp/cc-pvtz Int=NoBasisTransform IOp(10/33=2) NMR guess=read geom=check" >> nmr.com
    echo " " >> nmr.com
    echo "nmr" >> nmr.com
    echo " " >> nmr.com
    echo "0 1" >> nmr.com
    echo "  " >> nmr.com
    echo "   " >> nmr.com
    echo "   " >> nmr.com
    
    clisubg09c 24 1000 nmr.com    

 
	cd ..
done
