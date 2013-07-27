Artifact_filter= {
	filter ("t"){
	exec "fastx_artifacts_filter -Q 33 -i $input -o $output.fastq"
	exec """cat $input | awk 'BEGIN{stage="Artifact_filter"}{if(NR%4==2){count++}} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage"""
	exec "rm $input"
}
}
//Q 33 indicates that Sanger/Illumina is using instead of Solexa/Illumina
