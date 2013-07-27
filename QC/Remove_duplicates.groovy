Remove_duplicates = {
	filter ("ed"){
	exec " tally -i $input -o $output --nozip --with-quality -sumstat ./statistic_files/statistics_duplicates"
	exec """cat $input | awk 'BEGIN{stage="Remove_duplicates"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}}