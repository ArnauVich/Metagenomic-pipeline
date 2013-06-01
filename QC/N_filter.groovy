N_filter={
	filter ("Nf"){
	exec "prinseq-lite.pl -fastq $input -ns_max_p $NPERC -out_bad null -out_good $output.prefix"
	exec "rm $input"
}
}