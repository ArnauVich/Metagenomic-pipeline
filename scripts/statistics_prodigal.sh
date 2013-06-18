#!/bin/bash
awk '
	BEGIN {
		{printf "%s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\t %s\n", "Gene_prediction", "seq_Id", "strand", "start", "end", "partial", "rbs_motif", "gc_content", "seq_length", "score", "model"}
	}
	/^##gff*/ {next}
	/^# Sequence/ {
		if(check==1 && e!=""){printf "%d\t %s\t %s\t %d\t %d\t %s\t %s\t %.2f\t %d\t %.2f\t %s\n", prediction, seq_Id, strand, start, end, partial, rbs_motif, gc_content, seqlen, score, model}
		e=0
		check=0
		gsub(";","\t")
		long=$5
		split(long,a,"=")
		seqlen=a[2]
		next
		}
	/^# Model/{
		gsub(";","\t")
		pos_mod= match($0,/model*/)
		pos_gc= match($0,/gc_cont*/)
		model= substr($0, pos_mod)
		model= split (model,a,"\t")
		model=a[1]
		model= split (model,a,"=")
		model=a[2]
		gc_content= substr($0, pos_gc)
		gc_content= split (gc_content,a,"\t")
		gc_content=a[1]
		gc_content= split (gc_content,a,"=")
		gc_content=a[2]
		next
	}
	NF{	
		check=1
		count= count +1	
		prediction= count
		seq_Id= $1
		start=$4
		end=$5
		score=$6
		strand=$7
		attributes=$9
		attributes=split (attributes,b, ";")
		partial=b[2]
		rbs_motif=b[4]
		partial=split (partial,b,"=")
		partial=b[2]
		rbs_motif=split (rbs_motif,b,"=")
		rbs_motif=b[2]
		next
	}
	END{
		if(check==1 && e!=""){printf "%d\t %s\t %s\t %d\t %d\t %s\t %s\t %.2f\t %d\t %.2f\t %s\n", prediction, seq_Id, strand, start, end, partial, rbs_motif, gc_content, seqlen, score, model}
		}
' $1