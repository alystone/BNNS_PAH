mkdir -p c2
for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
    cd pvtz_${i}
        echo "7" > input_c2
        echo "5" >> input_c2
        echo "1" >> input_c2
        echo "-" >> input_c2
        echo "-" >> input_c2
        Multiwfn pvtz_${i}.fchk < input_c2 > output_c2
        cp output_c2 ../c2/c2_${i}
	cd ..
done
