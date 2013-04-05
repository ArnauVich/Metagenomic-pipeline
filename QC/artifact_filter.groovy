Artifact_filter= {
	exec "fastx_artifacts_filter -Q 33 -i $input -o noartifact.fastq"
}
Bpipe.run {
	Artifact_filter
}
//Q 33 indicates that Sanger/Illumina is using instead of Solexa/Illumina
