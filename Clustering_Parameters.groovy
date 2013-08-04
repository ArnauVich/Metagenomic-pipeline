//Parameters for the clustering pipeline
THRESHOLD = 0.90
//GLOBAL PARAMETER.Sequence identity. Number of identical nucleotides divided by the full length of shorter sequence
THREADS = 8
//GLOBAL PARAMETER.CPUs used.
KFILT = 0
//CD-HIT and DNACLUST PARAMETER.Short word filter length. WARNING a higher KMER value implies higher memory requeriments. 
TAG = 30
//CD-HIT PARAMETER.TAG is the length for the descrition (sequence id). If it set to 0 it takes the sequence id and stopts at first space.
STORAGE = 0
//CD-HIT PARAMETER.STORAGE is a utility of cd-hit. By default is 0 and sequences are stored in RAM, if is it set to 1, are stored in the hard drive. 
KMERS = 79
//METAVELVET PARAMETER. K-MER length for contig building. 
MINLEN = 30 
//METAVELVET PARAMETER. Filter minimum contig length.  
