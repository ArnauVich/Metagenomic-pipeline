Ends_trimming = {
	filter ("l") {
	exec "ht-trim -i $input -S $TRIM_OP -c $QUAL_CUT -o $output"
	exec """cat $input | awk 'BEGIN{stage="Ends_trimming"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}
