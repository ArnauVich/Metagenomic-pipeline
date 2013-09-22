Blat_p = {
	from ("faa"){
	exec "blat $PATH_TO_Md5nr $input -prot -out=blast8 -minScore=$SCORE -minIdentity=$MIN_ID $output"
	exec "select_id.sh $input "
}
}
Blat_f ={
	exec "blat $PATH_TO_Md5nr ${input}.faa -prot -out=blast8 -minScore=$SCORE -minIdentity=$MIN_ID $output"
	exec "select_id.sh $input "
}

Blat_r = {
	exec "blat $PATH_TO_md5rna $input -t=dna -q=dna -out=blast8 -minScore=$SCORE -minIdentity=$MIN_ID $output"
	exec "select_id_ribo.sh $input "
}