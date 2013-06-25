Remove_duplicates = {
	filter ("dup"){
	exec " tally -i $input -o $output --nozip --with-quality -sumstat ./graphics_results/statistic_files/statistics_duplicates"
	exec "rm $input"
}}