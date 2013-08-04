PATH_TO_GD="./QC_graphics_results/"
PATH_TO_GD_FIL="./QC_graphics_results/filtered_graphics/"
Graph_values_dinucleotide = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD/dinucleotide -png_all "
	exec "rm $input"
}
Graph_values_gc = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD/gc -png_all "
	exec "rm $input"
}
Graph_values_duplicates = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD/duplicates -png_all "
	exec "rm $input"
}
Graph_values_fil_dinucleotide = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD_FIL/dinucleotide -png_all "
	exec "rm $input"
}
Graph_values_fil_gc = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD_FIL/gc -png_all "
	exec "rm $input"
}
Graph_values_fil_duplicates = {
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD_FIL/duplicates -png_all "
	exec "rm $input"
}
Graph_values_fil = {
	from ("*.gd")
	exec "prinseq-graphs.pl -i $input -o $PATH_TO_GD_FIL/output -png_all "
	exec "rm $input"

}