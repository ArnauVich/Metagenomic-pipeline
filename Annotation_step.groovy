load "Annotation_Parameters.groovy"

Orf_predictor = "FGS_pred"

FGS_pred= segment{
	FGS + Statistics_FGS
}
Prodigal_pred= segment{
	Prodigal + Statistics_prodigal
}



if (ORF == "FGS") {
	Orf_predictor = FGS_pred
}
if (ORF == "Prodigal"){
	Orf_predictor = Prodigal_pred
}
else { Orf_predictor = FGS_pred }



Bpipe.run {
	Orf_predictor
}