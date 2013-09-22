Select_columns = {
	filter ("columns"){
	exec "Select_columns.sh $input > $output"
}
}
Select_columns2 = {
	filter ("columns"){
	exec "Select_columns2.sh $input > $output"
}
}