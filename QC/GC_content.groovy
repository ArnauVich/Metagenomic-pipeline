PATH_TO_PRINSEQ="~/prinseq-lite-0.20.3/prinseq-lite.pl"
PATH_TO_GRAPH="~/prinseq-lite-0.20.3/prinseq-graphs.pl"

GC_content = {
	exec "perl $PATH_TO_PRINSEQ -fastq $input -graph_data -graph_stats gc -out_good null -out_bad null"
}
Graph_values = {
	exec "perl $PATH_TO_GRAPH -i $input -png_all"
}
Bpipe.run {
	GC_content + Graph_values
}