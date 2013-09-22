#!/bin/bash
cat $1 | awk 'BEGIN{stage="Annotated features"}{count=NR} END {printf "%s\t %d\n",stage,count}' >>./statistic_files/quality_stage