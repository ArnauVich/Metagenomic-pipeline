
GC_content = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data -graph_stats gc -out_good null -out_bad null"
}
Graph_values = {
	exec "perl prinseq-graphs.pl -i $input -png_all"
}
Bpipe.run {
	GC_content + Graph_values
}