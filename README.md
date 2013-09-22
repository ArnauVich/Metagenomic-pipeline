Metagenomic-pipeline
====================

Metagenomic pipeline project for Master thesis


Usage
--------------------

1. Read the "INSTALL" file

2. Put in your $path all the sofware used

3. Put in your $parth the "scripts" folder and change all the files in this folder as executable. 

4. Run pipeline: 

 - The pipeline is composed by 3 main steps that have to be executed independently: Quality control, Clustering, Annotation. Each step is described in a executable file

 - Each step have a parameter file associated that contains all command options and all variables. Before execution, make sure that the desired values are set. 

 - Each step have their own folder with all stages described in modules. 

 - The steps of the pipeline can be executed following this scheme: 

 BPIPE_LIB= PATH/TO/STEP/FOLDER bpipe run STEP_FILE INPUT

 - Additionatly in Clustering and Annotation it have to be set an environmental variable to select which sofware to be used. Examples: 

QUALITY CONTROL: 

BPIPE_LIB=~/Escriptori/bpipes/QC/QC bpipe run ~/Escriptori/bpipes/QC/quality_control.groovy test.fastq

CLUSTERING: 

BPIPE_LIB=~/Escriptori/bpipes/QC/Clustering bpipe run -p CLUSTER=cdhit ~/Escriptori/bpipes/QC/clustering_stage.groovy clustertest.fastq

BPIPE_LIB=~/Escriptori/bpipes/QC/Clustering bpipe run -p CLUSTER=dnaclust ~/Escriptori/bpipes/QC/clustering_stage.groovy clustertest.fastq 

BPIPE_LIB=~/Escriptori/bpipes/QC/Clustering bpipe run -p CLUSTER=uclust ~/Escriptori/bpipes/QC/clustering_stage.groovy clustertest.fastq 
 
BPIPE_LIB=~/Escriptori/bpipes/QC/Clustering bpipe run -p CLUSTER=metavelvet ~/Escriptori/bpipes/QC/clustering_stage.groovy clustertest.fastq

ANNOTATION: 

BPIPE_LIB=~/Escriptori/bpipes/QC/Annotation bpipe run -p ORF=Prodigal ~/Escriptori/bpipes/QC/Annotation_step.groovy test.f.i.l.t.e.e.r.ed.Uclust.fasta #for predicting genes with prodigal

BPIPE_LIB=~/Escriptori/bpipes/QC/Annotation bpipe run -p ORF=FGS ~/Escriptori/bpipes/QC/Annotation_step.groovy test.f.i.l.t.e.e.r.ed.Uclust.fasta # for predicting genes with FragGeneScan

BPIPE_LIB=~/Escriptori/bpipes/QC/Annotation bpipe run -p ORF=Ribosomic ~/Escriptori/bpipes/QC/Annotation_step.groovy test.f.i.l.t.e.e.r.ed.Uclust.fasta # for Ribosomal analysis. 
