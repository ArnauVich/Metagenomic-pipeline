Trim_tails = {
	filter ("i") {
	exec "prinseq-lite.pl -fastq $input -trim_tail_left $TRIM_LEFT -trim_tail_right $TRIM_RIGHT -log -out_bad null -out_good $output.prefix"
	exec """cat $input | awk 'BEGIN{stage="Trim_tails"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}