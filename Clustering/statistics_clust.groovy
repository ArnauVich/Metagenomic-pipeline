
Statistics_cd_hit = {
	
	exec "statistics_clustering.sh ${input}.clstr > ./statistic_files/cluster_sum"
}
Statistics_dnaclust = {
	exec " statistics_dnaclust.sh dnaclust_clusters $input "
}
Statistics_uclust = {
	exec "statistics_uclust.sh uclust_clusters.uc $input"
}
Statistics_velvet = {
	exec " statistics_metavelvet.sh ./meta_velvet_output/meta-velvetg.contigs.fa > ./statistic_files/cluster_sum"
}