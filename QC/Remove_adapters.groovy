Cutadapt = {
	exec "cutadapt $input -g $ADAPTER1 -g $ADAPTER2 -O $OVERLAP --info-file statistics_cutadapt -o $output -e $ERROR"
}