#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'
mkdir -p ELF
for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
	awk -v i=$i '{printf "%15s  \t", i}'  text
    cd pvtz_${i}
	#cp ELF.cub ../ELF/${i}.cub 
	echo "cub ${i} 0.5" >> ../input_vmd
    echo "${i} Done."
	cd ..
done
