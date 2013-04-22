load "QC_parameters.groovy"
Results={
	exec "mkdir graphics_results/"
	exec "mkdir graphics_results/filtered_graphics"
}
Bpipe.run{
	Results
}
Statistics_graph= segment {
	Statistics + draw_statistics 
}
Statistics_filtered= segment {
	Statistics_fil + draw_statistics_fil 
}
Bpipe.run{
	Statistics_graph
}
Quality_graph= segment {
	[Dinucleotide_odds + Graph_values, Sequence_duplication + Graph_values, GC_content + Graph_values]
}
Filtered_graph= segment {
	[Dinucleotide_odds_fil + Graph_values_fil, Sequence_duplication_fil + Graph_values_fil, GC_content_fil + Graph_values_fil]
}
Bpipe.run{
	Quality_graph
}
Bpipe.run {
	Trim_tails + Ends_trimming + Artifact_filter + N_filter + Quality_filter + Length_filter + [Filtered_graph, Statistics_filtered]
}