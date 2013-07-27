Dinucleotide_odds = {
	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/$output.gd -graph_stats dn -out_good null -out_bad null "
}
Dinucleotide_odds_fil = {
	exec "prinseq-lite.pl -fastq $input -graph_data QC_graphics_results/filtered_graphics/$output.gd -graph_stats dn -out_good null -out_bad null "
}