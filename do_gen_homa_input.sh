for i in benz benzBN anthraene anthraceneBN coronene coroneneBN naphthalene naphthaleneBN ph4linear ph4linearBN phenanthrene phenanthreneBN pyrene pyreneBN ; do
    cd pvtz_${i}
        echo "100" > input_homa
        echo "13" >> input_homa
        echo "0" >> input_homa
        cat ring_atoms >> input_homa
        echo " " >> input_homa
        echo "-" >> input_homa
        Multiwfn pvtz_${i}.fchk < input_homa > output_homa

 
	cd ..
done
