Dinucleotide_odds = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data graphics_results/$output.gd -graph_stats dn -out_good null -out_bad null "
}
Dinucleotide_odds_fil = {
	exec "perl prinseq-lite.pl -fastq $input -graph_data graphics_results/filtered_graphics/$output.gd -graph_stats dn -out_good null -out_bad null "
}