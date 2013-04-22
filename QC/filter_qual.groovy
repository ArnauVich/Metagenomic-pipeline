Quality_filter={
	filter ("q"){
	exec "ht-filter -F quality -i $input -Q $QUAL_CUT -o $output.prefix"
	exec "rm $input"
}
}