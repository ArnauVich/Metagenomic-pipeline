GC_content = {

	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/$output.gd -graph_stats gc -out_good null -out_bad null "
}

GC_content_fil = {

	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/filtered_graphics/$output.gd -graph_stats gc -out_good null -out_bad null "
}

