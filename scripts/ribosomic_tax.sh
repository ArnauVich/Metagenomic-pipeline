cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $1}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_domain" 
cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $2}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_phylum" 
cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $3}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_class" 
cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $4}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_order" 
cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $5}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_family" 
cat $1  | awk -F "\t" '{print $7}'| awk -F ";" '{print $6}' | sort | uniq -c | awk -F " " '{array[$0]=$1; sum+=$1} END { for (i in array) printf "%s \t %.2f\n",i,array[i]/sum*100}' | sort -nr -k1 | awk '{sub(/^ */,""); print}' | awk '{sub(/  */,"\t"); print}' > "${1}_genus" 




