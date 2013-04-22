// Parameters for a Quality Control Pipeline


NPERC= 40
// maxim percentage of N's bases admited, value from 0 to 100

QUAL_CUT= 20
//indicate the quality cutoff for each sequence

LEN_CUT= 180
//Length cut-off for each read

MAX_READ_LEN= 200
 //maximum read length to consider 

TRIM_RIGHT= 5
 //Trim the minimum A/T tail at 3' end 

TRIM_LEFT= 5
 //Trim the minimum A/T tail at 5' end

TRIM_OP= "tail"
// trim options can be: tail/head/both

QUAL_CUT= 10
// quality cut-off for reads