cat $1  | awk -F "\t" '{print $6}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Domain_info"

cat $1  | awk -F "\t" '{print $7}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Phylium_info"

cat $1  | awk -F "\t" '{print $8}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Class_info"

cat $1  | awk -F "\t" '{print $9}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Order_info"

cat $1  | awk -F "\t" '{print $10}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Family_info"

cat $1  | awk -F "\t" '{print $11}'| sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  /,"\t"); print}' > "${1}_Genus_info"

