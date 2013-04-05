LEN_CUT= 180
Length_filter= {
	exec "ht-filter -F length -i $input -L $LEN_CUT -o longfil"
}
Bpipe.run{
	Length_filter
}