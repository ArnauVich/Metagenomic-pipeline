load "QC_parameters.groovy"
Results={
	exec "mkdir ./QC_graphics_results/"
	exec "mkdir ./QC_graphics_results/filtered_graphics"
	exec "mkdir ./statistic_files"
}


Statistics_graph= segment {
	Statistics + draw_statistics 
}
Statistics_filtered= segment {
	Statistics_fil + draw_statistics_fil 
}

Quality_graph= segment {
	[Dinucleotide_odds+ Graph_values_dinucleotide, Sequence_duplication+ Graph_values_duplicates, GC_content+ Graph_values_gc]
}
Filtered_graph= segment {
	[Dinucleotide_odds_fil+ Graph_values_fil_dinucleotide, Sequence_duplication+ Graph_values_fil_duplicates, GC_content_fil+ Graph_values_fil_gc]
}


Bpipe.run{
	Results
}
Bpipe.run{
	Statistics_graph_2
}
Bpipe.run{
	Quality_graph //+ Graph_values
}
//Bpipe.run{
//	Graph_values
//}
Bpipe.run {
	Remove_adapters + Trim_tails + Ends_trimming + Artifact_filter + N_filter + Quality_filter + Length_filter + Remove_duplicates + [Filtered_graph, Statistics_graph_2_fil] 
}
//Bpipe.run {
//	Graph_values_fil
//}