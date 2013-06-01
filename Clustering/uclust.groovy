Uclust = {
	exec " usearch -cluster_fast $input -id $THRESHOLD -threads $THREADS -uc uclust_clusters.uc -centroids $output.fasta"
}