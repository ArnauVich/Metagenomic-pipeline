Cd_hit_clust = {
	exec "cd-hit-est -i $input -o cdhit_clusters -c $THRESHOLD -T $THREADS -n $KFILT -d $TAG -B $STORAGE"
}