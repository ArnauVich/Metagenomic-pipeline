Dnaclust = {
	exec "dnaclust -i $input -s $THRESHOLD -t $THREADS -k $KFILT -u > dnaclust_clusters" 
	filter("clust"){
	exec " cat dnaclust_clusters | fastaselect -f $input -c > $output" 
}}
