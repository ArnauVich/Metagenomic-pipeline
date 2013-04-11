NPERC= 40
// maxim percentage of N's bases admited, value from 0 to 100

N_filter={
	exec "perl prinseq-lite.pl -fastq $input -ns_max_p $NPERC -out_bad null"
}
Bpipe.run{
	N_filter
}
