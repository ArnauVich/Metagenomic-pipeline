Ends_trimming = {
	filter ("et") {
	exec "ht-trim -i $input -S $TRIM_OP -c $QUAL_CUT -o $output"
	exec "rm $input"
}
}
