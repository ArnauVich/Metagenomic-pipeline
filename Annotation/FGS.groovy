FGS = {
	exec " $PATH_TO_FGS -s $input -o $output -w $PART -t $TRAIN"
	exec "count_clust.sh $input"
}