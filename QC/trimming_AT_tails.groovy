Trim_tails = {
	filter ("tr") {
	exec "perl $PATH_TO_PRINSEQ -fastq $input -trim_tail_left $TRIM_LEFT -trim_tail_right $TRIM_RIGHT -log -out_bad null -out_good $output.prefix"
}
}