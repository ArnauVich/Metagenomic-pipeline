QUAL_CUT= 20
//indicate the quality cutoff for each sequence

Quality_filter={
	exec "ht-filter -F quality -i $input -Q $QUAL_CUT -o qualfil"
}

Bpipe.run{
	Quality_filter
}
