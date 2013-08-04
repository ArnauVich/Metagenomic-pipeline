Statistics_graph_2 = {
	exec " fastqc $input -o ./QC_graphics_results/"
	exec "mv ./QC_graphics_results/*fastqc ./QC_graphics_results/fastqc"
}
Statistics_graph_2_fil = {
	exec " fastqc $input -o ./QC_graphics_results/filtered_graphics/"
	exec "mv ./QC_graphics_results/filtered_graphics/*fastqc ./QC_graphics_results/filtered_graphics/fastqc"
	exec """cat $input | awk 'BEGIN{stage="Total after Quality control"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
}