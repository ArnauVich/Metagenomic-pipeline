Pauda_p = {
	from ("ffn"){
	exec "pauda-run --$PAUDA $input $output $PATH_2_DB_INDEX"
	exec "select_id.sh $input "
}
}
Pauda_f ={
	exec "pauda-run --$PAUDA ${input}.ffn $output $PATH_2_DB_INDEX"
	exec "select_id.sh $input "
}