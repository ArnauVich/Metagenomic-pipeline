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
	[Dinucleotide_odds, Sequence_duplication, GC_content]
}
Filtered_graph= segment {
	[Dinucleotide_odds_fil, Sequence_duplication_fil, GC_content_fil]
}


Bpipe.run{
	Results
}
Bpipe.run{
	Statistics_graph_2
}
Bpipe.run{
	Quality_graph
}
Bpipe.run{
	Graph_values
}
Bpipe.run {
	Remove_adapters + Trim_tails + Ends_trimming + Artifact_filter + N_filter + Quality_filter + Length_filter + Remove_duplicates + [Filtered_graph, Statistics_graph_2_fil] 
}
Bpipe.run {
	Graph_values_fil
}