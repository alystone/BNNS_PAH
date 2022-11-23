mkdir -p c1
for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
    cd pvtz_${i}
        echo "7" > input_c1
        echo "1" >> input_c1
        echo "1" >> input_c1
        echo "-" >> input_c1
        echo "-" >> input_c1
        Multiwfn pvtz_${i}.fchk < input_c1 > output_c1
        cp output_c1 ../c1/c1_${i}
	cd ..
done
