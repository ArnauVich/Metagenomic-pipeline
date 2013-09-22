Clean = {
	exec " head -n -1 $input > $output"
	exec " rm $input"
}
Clean2 = {
	exec "sed 1d $input > $output"
	exec "rm $input"
}