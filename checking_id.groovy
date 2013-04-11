Checking_id{
exec ""cat $input | head -1 | awk -F ":" '{if (($1 ~/^@[A-Za-z0-9\-\.\_]*$/) && ($2 ~/^[0-9]*$/) && ($3 ~/^[0-9]*$/) && ($4 ~/^[0-9]*$/) && ($5 ~/^[0-9]*/ || $5 ~/^[0-9]+\#[0-9ATCG]+\/[1,2]/)) {print "Illumina ID format" } else if (($1 ~/^@[A-Za-z0-9\-\.\_]*$/) && ($2 ~/^[0-9]*$/) && ($3 ~/^[0-9A-Za-z]*$/) && ($4 ~/^[0-9]*$/) && ($5 ~/^[0-9]*$/) && ($6 ~/^[0-9]*$/) && ($7 ~/^[0-9]*[ \t][1,2]$/) && ($8 ~/^[YN]$/) && ($9 ~/^[0-9]*$/) && ($10 ~/^[ACTG]*$/)) {print "CASAVA 1.8 format"} else { print "FORMAT ERROR! Please check your FASTQ ID before re-start the execution" > "/dev/tty"}}'""
}
Bpipe.run {
	Checking_id
}
