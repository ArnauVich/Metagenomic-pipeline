TRIM_OP= "tail"
// trim options can be: tail/head/both
QUAL_CUT= 10
// quality cut-off
Ends_trimming = {
	exec "ht-trim -i $input -S $TRIM_OP -c $QUAL_CUT -o trimmed.fastq"
}
Bpipe.run{
	Ends_trimming
}