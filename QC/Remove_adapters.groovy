Remove_adapters = {
	filter ("ad"){
	exec "cutadapt $input -g $ADAPTER1 -g $ADAPTER2 -O $OVERLAP --info-file ./graphics_results/statistic_files/statistics_cutadapt -o $output -e $ERROR"
}}