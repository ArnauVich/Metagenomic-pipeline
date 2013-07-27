Length_filter= {
	filter ("r"){
	exec "ht-filter -F length -i $input -L $LEN_CUT -o $output.prefix"
	exec """cat $input | awk 'BEGIN{stage="Length_filter"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}