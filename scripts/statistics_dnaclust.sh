#!/bin/bash

awk '{
	reads= NF
	center=">"$1
}
	{printf "%s\t %d\n", center, reads} 
' $1 > temp2
#for the file temp2 check the number of columns ( for our purpose, count the numbers of sequence in each cluster)
#print the sequecen ID and number of reads in cluster separated by "Tab" 
awk '
	/^>/ {
		if (count != "") {printf "%s\t %s\t %d\n", cluster, seq_id, count} 
			count=0
			++clust
			cluster= "Cluster" clust
			seq_id=$0
			next
		}
	NF{
		long=length($0)
		count=count+long
	}
	END{
		if (count != "") {printf "%s\t %s\t %d\n", cluster, seq_id, count}
		}
' $2 > temp1
#The sequence id is saved when the line starts with ">"
#A counter counts each cluster in order to numerate each one. 
#When the line doesn't start with ">", it counts all the characters in the line (sequence length)
awk 'NR==FNR{a[$1]=$2; FS $3 ;next}{print $0,a[$2]}' temp2 temp1 > dna_clust_summary
#if the column 1 of the temp2 is the same than the column 2 in temp1 marge the two files in a new document. 
if [ -s dna_clust_summary ]
then
        rm -f temp1
        rm -f temp2
else
        rm -f dna_clust_summary
        echo "ERROR: It is not posible to generate DNACLUST cluster summary. Please check the Dnaclust output"
        exit 1 
fi