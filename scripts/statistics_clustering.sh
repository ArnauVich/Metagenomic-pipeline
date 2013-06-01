#!/bin/bash
printf "%s\t %s\t %s\t %s\n" 'Cluster' 'Seq_ID' 'Seq_length' 'Number_reads' 
awk '
/^>/ {
    if (count != "") { printf "%s\t %s\t %d\t %d\n", clust, name, number, count }
    count = 0
    name = number = ""
    clust=$0
    next
} 
NF {
    if (++count == 1) { number = $2; name = $3 }
}
END {
    if (count != "") { printf "%s\t %s\t %d\t %d\n", clust, name, number, count }
}
' $1