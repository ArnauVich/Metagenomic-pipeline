Statistics_graph_2 = {
	exec " fastqc $input -o ./QC_graphics_results/"
}
Statistics_graph_2_fil = {
	exec " fastqc $input -o ./QC_graphics_results/filtered_graphics/"
	exec """cat $input | awk 'BEGIN{stage="Total after Quality control"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >./statistic_files/quality_stage"""
}