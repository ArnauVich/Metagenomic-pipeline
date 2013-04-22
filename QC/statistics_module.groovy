OUT_DIR= "./graphics_results/"
 //output directory for statistics summary
OUT_DIR_FIL= "./graphics_results/filtered_graphics/statistics_graph/"
 //output directory for statistics summary
Statistics = {
	exec "ht-stat -i $input -o $OUT_DIR -l $MAX_READ_LEN "
}
draw_statistics = {
	exec "ht-stat-draw.pl --dir $OUT_DIR --format png "
}
Statistics_fil = {
	exec "mkdir ./graphics_results/filtered_graphics/statistics_graph/"
	exec "ht-stat -i $input -o $OUT_DIR_FIL -l $MAX_READ_LEN "
}
draw_statistics_fil = {
	exec "ht-stat-draw.pl --dir $OUT_DIR_FIL --format png "
}