Quality_filter={
	filter ("e"){
	exec "ht-filter -F quality -i $input -Q $QUAL_CUT -o $output.prefix"
	exec """cat $input | awk 'BEGIN{stage="Quality_filter"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}