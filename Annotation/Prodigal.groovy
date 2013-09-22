Prodigal = {
	
	exec " prodigal -i $input -n -d $output1.ffn -p meta -f gff -o $output2"
	exec "count_clust.sh $input"
}
