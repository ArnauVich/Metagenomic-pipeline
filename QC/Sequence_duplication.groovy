Sequence_duplication = {
	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/$output.gd -graph_stats da -out_good null -out_bad null"
}
Sequence_duplication_fil = {
	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/filtered_graphics/$output.gd -graph_stats da -out_good null -out_bad null"
}