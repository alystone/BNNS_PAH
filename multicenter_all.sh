#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'

for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
	awk -v i=$i '{printf "%15s  \t", i}'  text
    cd pvtz_${i}
	Multiwfn_noGUI pvtz_${i}.fchk < ../input_multicenter_all > output_multicenter_all &
    echo "${i} Done."
	cd ..
done
