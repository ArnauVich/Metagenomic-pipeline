awk '
	/^>/ {
		if (count != "") {printf "%s\t %s\t %d\n", cluster, seq_id, count} 
			count=0
			++clust
			cluster= "Node" clust
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
' $1 > Statistics_velvet