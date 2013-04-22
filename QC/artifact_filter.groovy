Artifact_filter= {
	filter ("f"){
	exec "fastx_artifacts_filter -Q 33 -i $input -o $output.fastq"
	exec "rm $input"
}
}
//Q 33 indicates that Sanger/Illumina is using instead of Solexa/Illumina
