PATH_TO_GD="./graphics_results/*.gd"
PATH_TO_GD_FIL="./graphics_results/filtered_graphics/*.gd"
Graph_values = {
	exec "prinseq-graphs.pl -i $PATH_TO_GD -png_all -o ./graphics_results/$output"
}
Graph_values_fil = {
	exec "prinseq-graphs.pl -i $PATH_TO_GD_FIL -png_all -o ./graphics_results/filtered_graphics/$output"
}