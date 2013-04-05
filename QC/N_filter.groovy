NPERC= 40
// maxim percentage of N's bases admited, value from 0 to 100
PATH_TO_PRINSEQ="~/prinseq-lite-0.20.3/prinseq-lite.pl"
N_filter={
	exec "perl $PATH_TO_PRINSEQ -fastq $input -ns_max_p $NPERC -out_bad null"
}
Bpipe.run{
	N_filter
}
