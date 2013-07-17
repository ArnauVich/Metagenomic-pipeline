#!/bin/bash
awk ' {
	if ( $1 == Id) { next} 
	else {
		Id = $1
		score = $12
		print $1"\t"$2"\t"$3"\t"$11"\t"$12
	}


}' $1
