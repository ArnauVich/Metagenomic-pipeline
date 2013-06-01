Velveth={
	exec "velveth meta_velvet_output $KMERS -fasta $input"
}
Velvetg={
	exec "velvetg meta_velvet_output -exp_cov auto -min_contig_lgth $MINLEN"
}
Metavelvet={
	exec " meta-velvetg meta_velvet_output"
}
Meta_pipe=segment{
	Velveth + Velvetg + Metavelvet + Statistics_velvet
}