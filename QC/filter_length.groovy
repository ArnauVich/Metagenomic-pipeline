Length_filter= {
	filter ("l"){
	exec "ht-filter -F length -i $input -L $LEN_CUT -o $output.prefix"
	exec "rm $input"
}
}