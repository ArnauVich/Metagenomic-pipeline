Graph_values = {
	exec "perl prinseq_graphs.pl -i {$input}.gd -png_all"
}
Bpie.run{
	Graph_values
}