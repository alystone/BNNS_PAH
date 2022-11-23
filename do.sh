for i in *.fchk ; do
	filename="${i%.*}"
	if [ ${filename}.fchk == $i ] ; then
		j=$filename
	fi
	mkdir -p $j

	cd ${j}
	mv ../${i} .
	cp ../input .
	cp ../settings.ini .
    Multiwfn ${i} < input &
    cd ..
done
