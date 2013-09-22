#!/bin/bash
awk -F "\t" ' {
	if ( NR == 1) { next} 
	else {
			print $1"\t"$3"\t"$14"\t"$6"\t"$7
	}


}' $1
