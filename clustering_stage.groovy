load "Clustering_Parameters.groovy"

Clustering = "Cd_hit_clust_pipe"



Uclust_pipe= segment{
	Uclust + Statistics_uclust
}
Dnaclust_pipe= segment{
	Dnaclust + Statistics_dnaclust
}
Cd_hit_clust_pipe= segment {
	Cd_hit_clust + Statistics_cd_hit
}


if (CLUSTER == "uclust") {
	Clustering = Uclust_pipe
}
if (CLUSTER == "dnaclust"){
	Clustering = Dnaclust_pipe
}
if (CLUSTER == "cdhit"){
	Clustering = Cd_hit_clust_pipe
}
if (CLUSTER == "metavelvet"){
	Clustering = Meta_pipe
}

Bpipe.run {
	Fasta_convert + Clustering
}