#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'

for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
    cd pvtz_${i}

    /public/soft/software/g09-c01/g09/formchk pvtz_${i}.chk nmr.fchk
    cp nmr.fchk ../fchk/${i}_nmr.fchk
    
 
	cd ..
done
