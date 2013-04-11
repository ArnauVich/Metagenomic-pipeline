
Sequence_duplication = {
	exec "perl prinseq-lite -fastq $input -graph_data -graph_stats da -out_good null -out_bad null"
}
Graph_values = {
	exec "perl prinseq-graphs -i $input -png_all"
}
Bpipe.run {
	Sequence_duplication + Graph_values
}