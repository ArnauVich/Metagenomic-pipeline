Cd_hit_clust = {
	exec "cd-hit-est -i $input -o $output -c $THRESHOLD -T $THREADS -n $KFILT -d $TAG -B $STORAGE"
}