MAX_READ_LEN= 200
 //maximum read length to consider 
OUT_DIR= "./"
 //output directory for statistics summary
statistics = {
	exec "ht-stat -i $input -o $OUT_DIR -l $MAX_READ_LEN "
}
draw_statistics = {
	exec "ht-stat-draw.pl --dir $OUT_DIR --format png "
}
Bpipe.run {
	statistics + draw_statistics
}