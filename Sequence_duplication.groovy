PATH_TO_PRINSEQ="~/prinseq-lite-0.20.3/prinseq-lite.pl"
PATH_TO_GRAPH="~/prinseq-lite-0.20.3/prinseq-graphs.pl"

Sequence_duplication = {
	exec "perl $PATH_TO_PRINSEQ -fastq $input -graph_data -graph_stats da -out_good null -out_bad null"
}
Graph_values = {
	exec "perl $PATH_TO_GRAPH -i $input -png_all"
}
Bpipe.run {
	Sequence_duplication + Graph_values
}