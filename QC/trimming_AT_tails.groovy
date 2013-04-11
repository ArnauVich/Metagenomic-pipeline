TRIM_RIGHT= 5
 //Trim the minimum A/T tail at 3' end 
TRIM_LEFT= 5
 //Trim the minimum A/T tail at 5' end
trim_tails = {
	exec "perl prinseq-lite.pl -fastq $input -trim_tail_left $TRIM_LEFT -trim_tail_right $TRIM_RIGHT -out_bad null -log"
}
Bpipe.run {
	trim_tails
} 