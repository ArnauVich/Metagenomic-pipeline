PATH_TO_FGS = "/home/arnau/FragGeneScan1.16/FragGeneScan"
// FragGeneScans needs to indicates where is installed to work proparly
PART= 0
// 1 for complete genome sequences
// 0 short sequences reads
TRAIN= "illumina_5"
// [complete] for complete genomic sequences or short sequence reads without sequencing error
// [sanger_5] for Sanger sequencing reads with about 0.5% error rate
// [sanger_10] for Sanger sequencing reads with about 1% error rate
// [454_5] for 454 pyrosequencing reads with about 0.5% error rate
// [454_10] for 454 pyrosequencing reads with about 1% error rate
// [454_30] for 454 pyrosequencing reads with about 3% error rate
// [illumina_5] for Illumina sequencing reads with about 0.5% error rate
// [illumina_10] for Illumina sequencing reads with about 1% error rate

PATH_TO_Md5nr= "~/Escriptori/test_db"
 // PATH TO DATABASE Md5nr. This path is used to run BLAT, the ORF predictions against the Md5nr database. 
 // WARNING: Bpipes needs a backslash to skip a backslash, so it is needed to double them. Ex:  PATH_TO_Md5nr= "/media/MY\\ PASSPORT/test_db"
SCORE= 30
// BLAT minimum score. This is the matches minus the mismatches minus some sort of gap penalty.
MIN_ID= 25 
// BLAT minumum identity. 

PATH_TO_LOCAL_M5="/media/My\\ Passport/Sources/M5nr_db"
DATABASES="InterPro"
 //InterPro
 //IMG
 //PHANTOME
 //NCBI
 //PATRIC
 //SEED
 //UniProt
 //KEGG
 //ALL
 // WARNING: Bpipes needs a backslash to skip a backslash, so it is needed to double them. Ex:  PATH_TO_Md5nr= "/media/MY\\ PASSPORT/test_db"
OUT_PATH="./"