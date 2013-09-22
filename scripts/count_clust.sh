#!/bin/bash
cat $1 | awk 'BEGIN{stage="Number of clusters"}{if(/^>/){count++}} END {printf "%s\t %d\n",stage,count}' >>./statistic_files/quality_stage