PATH_TO_GD="./QC_graphics_results/*.gd"
PATH_TO_GD_FIL="./QC_graphics_results/filtered_graphics/*.gd"
Graph_values = {
	exec "prinseq-graphs.pl -i $PATH_TO_GD -png_all "
}
Graph_values_fil = {
	exec "prinseq-graphs.pl -i $PATH_TO_GD_FIL -png_all "

}