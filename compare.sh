#echo " " | awk '{printf "%17s%13s%13s%13s%13s%13s%13s%13s%13s%13s%13s%10s", "E(N)"}'

for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
	awk -v i=$i '{printf "%15s  \t", i}'  text
    cd pvtz_${i}
#	echo 0 | Multiwfn pvtz_${i}.fchk > test
#	tail -2 test | head -1 | awk '{printf "%4.6f\n", $5}'
    awk '{if($4=="Charge:"){printf("%4s\t%4.8f\t%4.8f\t%4.8f\n",substr($1,length($1)),$7*0.529177249,$8*0.529177249,$9*0.529177249)}}' test >> opted_stru
    unfchk pvtz_${i}.fchk
	awk '{if($4=="Charge:"){printf("%4s\t%4.8f\t%4.8f\t%4.8f\n",substr($1,length($1)),$7*0.529177249,$8*0.529177249,$9*0.529177249)}}' test | awk '{print NR"\t",$0}' | awk '$2=="C"||$2=="N"||$2=="B"||$2=="O"||$2=="F"{printf($1 " ")}' > ring_atoms
    echo "100" > input_center
	echo "21" >> input_center
	cat ring_atoms >> input_center
	echo "q" >> input_center
	echo "q" >> input_center
    Multiwfn_noGUI pvtz_${i}.fchk < input_center > center_output
	grep "Center of mass" center_output | awk '{print $5,$6,$7}' > center_mass
	awk '{printf("%5.9f\t%5.9f\t%5.9f\t",$1,$2,$3+1)}' center_mass > center_mass_up
	cd ..
done
