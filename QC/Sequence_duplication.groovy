Sequence_duplication = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data graphics_results/$output.gd -graph_stats da -out_good null -out_bad null"
}
Sequence_duplication_fil = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data graphics_results/filtered_graphics/$output.gd -graph_stats da -out_good null -out_bad null"
}