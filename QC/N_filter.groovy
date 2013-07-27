N_filter={
	filter ("e"){
	exec "prinseq-lite.pl -fastq $input -ns_max_p $NPERC -out_bad null -out_good $output.prefix"
	exec """cat $input | awk 'BEGIN{stage="N_filter"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}