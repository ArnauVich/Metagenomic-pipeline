Graph_hits={
	exec " for i in ./Hits_databases/result*; do Hits.sh $i ; done"
}

Graph_tax={
	exec " Graphic_taxonomic.sh ./Hits_databases/Taxonomy"
}

Graph_Ontology={
	exec " for i in ./Hits_databases/Ontology*; do Ontology.sh $i ; done"
}
Graph_Clusters={
	exec " match_clust_statistic.pl"
}
Graph_ribosomic={
	exec " for i in ./Hits_databases/rRna*; do ribosomic_tax.sh $i ; done"
}