
Dinucleotide_odds = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data -graph_stats dn -out_good null -out_bad null "
}
Graph_values = {
	exec "perl prinseq-graphs -i $input -png_all"
}
Bpipe.run {
	Dinucleotide_odds + Graph_values
}