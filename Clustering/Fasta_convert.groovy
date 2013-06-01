Fasta_convert = {
	transform("fasta"){
	exec " prinseq-lite.pl -fastq $input -out_format 1 -out_good stdout > $output"
}
}