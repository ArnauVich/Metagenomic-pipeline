Blat = {
	from ("*.faa"){
	exec "blat $PATH_TO_Md5nr $input -prot -out=blast8 -minScore=$SCORE -minIdentity=$MIN_ID $output"
}
}