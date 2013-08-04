
cat $1  | awk -F "\t" '{print $7}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Path_info" 

cat $1  | awk -F "\t" '{print $8}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1  | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Subpath_info"
