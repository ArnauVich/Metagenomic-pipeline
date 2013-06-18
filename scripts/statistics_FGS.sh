#!/bin/bash
awk '
	BEGIN {
		{printf "%s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\n", "Gene_prediction", "seq_Id", "strand", "start", "end", "partial", "rbs_motif", "gc_content", "seq_length", "score", "model"}
	}
	/^>/ {
		if(check==1 && e!=""){printf "%d\t %s\t %s\t %d\t %d\t %s\t %s\t %s\t %s\t %.2f\t %s\n", prediction, seq_Id, strand, start, end, partial, rbs_motif, gc_content, seqlen, score, model}
		e=0
		check=0
		seq_Id=$1
		next
		}
	NF{	
		check=1
		count= count +1	
		prediction= count
		start=$1
		end=$2
		score=$5
		strand=$3
		partial="No avaiable"
		rbs_motif="No avaiable"
		gc_content="No avaiable"
		model="No avaiable"
		seqlen="-"
		next
	}
	END{
		if(check==1 && e!=""){printf "%d\t %s\t %s\t %d\t %d\t %s\t %s\t %s\t %s\t %.2f\t %s\n", prediction, seq_Id, strand, start, end, partial, rbs_motif, gc_content, seqlen, score, model}
		}
' $1