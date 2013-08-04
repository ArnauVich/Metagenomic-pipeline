load "Annotation_Parameters.groovy"

Create_dir ={
	exec "mkdir ./graph" 
	exec "mkdir ./Hits_databases"
}


FGS_pred= segment{
	FGS + Statistics_FGS + Blat_f + Select_columns + Use_sqlite
}
Prodigal_pred= segment{
	Prodigal + Statistics_prodigal + Blat_p + Select_columns + Use_sqlite
}

Ribosomic= segment {
	Blat_r + Select_columns + Use_sqlite
}

if (ORF == "FGS") {
	Annotation_pipe = FGS_pred
}
if (ORF == "Prodigal"){
	Annotation_pipe = Prodigal_pred
}
if (ORF == "ribosomic"){
	Annotation_pipe = Ribosomic
}


Bpipe.run {
	Create_dir
}
Bpipe.run{
	Annotation_pipe
}
//Bpipe.run {
//	Orf_predictor + Blat + Select_columns + Use_sqlite
//}
Bpipe.run{
	[Graph_hits, Graph_tax, Graph_Ontology, Graph_Clusters, Graph_ribosomic]
}
Bpipe.run{
	Create_graphic
}