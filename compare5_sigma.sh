#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'
mkdir -p ELF_sigma
for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
	awk -v i=$i '{printf "%15s  \t", i}'  text
    cd pvtz_${i}
	#cp ELF.cub ../ELF_sigma/${i}_sigma.cub 
	echo "cub ${i}_sigma 0.5" >> ../input_vmd_sigma
    echo "${i} Done."
	cd ..
done
