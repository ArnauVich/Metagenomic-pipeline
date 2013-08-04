#!/bin/bash
cat $1 | awk '/^>/{print $1}' | awk '{sub(/>/,"",$0); print}'| sort | uniq > ./Hits_databases/Ids
cat ./Hits_databases/Ids | awk 'BEGIN{stage="Clustered sequences"}{count=NR} END {printf "%s\\t %d\\n",stage,count}' >>./statistic_files/quality_stage