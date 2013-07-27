Remove_adapters = {
	filter ("f"){
	exec "cutadapt $input -g $ADAPTER1 -g $ADAPTER2 -O $OVERLAP --info-file ./statistic_files/statistics_cutadapt -o $output -e $ERROR >./statistic_files/adapters"
	exec """cat $input | awk 'BEGIN{stage="Remove adapters"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >./statistic_files/quality_stage"""
}}
