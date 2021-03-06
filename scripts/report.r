#!/usr/bin/Rscript
dir.create( "./reports", showWarnings=FALSE );

require( Nozzle.R1 )

r <- newCustomReport( "Pipeline results" );

s1 <- newSection( "1 Summary" );
s2 <- newSection( "2 Quality Control" );
s3 <- newSection( "3 Clustering" );
s4 <- newSection( "4 Annotation" );
s6 <- newSection( "Acknowledgements" );
references <- newSection( "References" );
################SUMMARY########################################################

table_user <-read.table ("./statistic_files/quality_stage", sep="\t", quote="", col.names=c("Step","Number of Sequences"));
table1 <- newTable(table_user, file="../statistic_files/quality_stage", "Summary of number of sequencen in each step of the pipeline" )


################QUALITY CONTROL#################################################

s2sub1 <- newSubSection ("2.1 Initial quality analisi");
s2sub1sub1 <- newSubSection ("2.1.1 Sequece quality");
s2sub1sub2 <- newSubSection ("2.1.2 GC content");
#s2sub1sub3 <- newSubSection ("2.1.3 PCA");
s2sub1sub3 <- newSubSection ("2.1.3 Nucleotide analisi");
s2sub1sub4 <- newSubSection ("2.1.4 Duplicates");
s2sub2 <- newSubSection ("2.2 Quality after quality control pipeline");
s2sub2sub1 <- newSubSection ("2.2.1 Sequece quality");
s2sub2sub2 <- newSubSection ("2.2.2 GC content");
#s2sub2sub3 <- newSubSection ("2.2.3 PCA");
s2sub2sub3 <- newSubSection ("2.2.3 Nucleotide analisi");
s2sub2sub4 <- newSubSection ("2.2.4 Duplicates");
#fig1 <- "QC_graphics_results/test_fastqc/Images/per_base_quality.png"
fig1 <- newFigure( "../QC_graphics_results/fastqc/Images/per_base_quality.png", " Quality scores across all bases [generated by FastQC]");
fig2 <- newFigure( "../QC_graphics_results/fastqc/Images/per_sequence_quality.png", " Quality scores over all sequences [generated by FastQC]");
fig3 <- newFigure( "../QC_graphics_results/fastqc/Images/sequence_length_distribution.png", " Length distribution over all sequences [generated by FastQC]");
fig4 <- newFigure( "../QC_graphics_results/fastqc/Images/per_base_gc_content.png", " GC content across all bases [generated by FastQC]");
fig5 <- newFigure( "../QC_graphics_results/fastqc/Images/per_sequence_gc_content.png", " Distribution of GC content over all sequences [generated by FastQC]");
#fig6<- newFigure( "../QC_graphics_results/gc_gc.png", " GC content distibution [generated by Prinseq]");
#fig7<- newFigure( "../QC_graphics_results/dinucleotide_pm.png", " Principal Component Analisi (PCA) for microbial metagenomes [generated by Prinseq]");
#fig8<- newFigure( "../QC_graphics_results/dinucleotide_pv.png", " Principal Component Analisi (PCA) for Viral metagenomes [generated by Prinseq]");
#fig9<- newFigure( "../QC_graphics_results/dinucleotide_or.png", " Dinucleotide odds ratio [generated by Prinseq]");
fig10 <- newFigure( "../QC_graphics_results/fastqc/Images/kmer_profiles.png", " Kmer profiles [generated by FastQC]");
fig11 <- newFigure( "../QC_graphics_results/fastqc/Images/per_base_sequence_content.png", " Base content across all bases [generated by FastQC]");
fig12 <- newFigure( "../QC_graphics_results/fastqc/Images/per_base_n_content.png", " N content across all bases [generated by FastQC]");
fig13 <- newFigure( "../QC_graphics_results/fastqc/Images/duplication_levels.png", " Duplication levels [generated by FastQC]");
#fig14<- newFigure( "../QC_graphics_results/duplicates_df.png", " Duplicates: Number of sequences with different number of duplicates [generated by Prinseq]");
#fig15<- newFigure( "../QC_graphics_results/duplicates_dl.png", " Duplicates: Distribution of duplicates [generated by Prinseq]");
#fig16<- newFigure( "../QC_graphics_results/duplicates_dm.png", " Duplicates: Top 100 duplicates for a single sequence [generated by Prinseq]");

###########################################################################

fig1f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_base_quality.png", " Quality scores across all bases [generated by FastQC]");
fig2f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_sequence_quality.png", " Quality scores over all sequences [generated by FastQC]");
fig3f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/sequence_length_distribution.png", " Length distribution over all sequences [generated by FastQC]");
fig4f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_base_gc_content.png", " GC content across all bases [generated by FastQC]");
fig5f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_sequence_gc_content.png", " Distribution of GC content over all sequences [generated by FastQC]");
fig6f<- newFigure( "../QC_graphics_results/filtered_graphics/gc_gc.png", " GC content distibution [generated by Prinseq]");
fig7f<- newFigure( "../QC_graphics_results/filtered_graphics/dinucleotide_pm.png", " Principal Component Analisi (PCA) for microbial metagenomes [generated by Prinseq]");
fig8f<- newFigure( "../QC_graphics_results/filtered_graphics/dinucleotide_pv.png", " Principal Component Analisi (PCA) for Viral metagenomes [generated by Prinseq]");
fig9f<- newFigure( "../QC_graphics_results/filtered_graphics/dinucleotide_or.png", " Dinucleotide odds ratio [generated by Prinseq]");
fig10f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/kmer_profiles.png", " Kmer profiles [generated by FastQC]");
fig11f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_base_sequence_content.png", " Base content across all bases [generated by FastQC]");
fig12f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/per_base_n_content.png", " N content across all bases [generated by FastQC]");
fig13f <- newFigure( "../QC_graphics_results/filtered_graphics/fastqc/Images/duplication_levels.png", " Duplication levels [generated by FastQC]");
fig14f<- newFigure( "../QC_graphics_results/filtered_graphics/duplicates_df.png", " Duplicates: Number of sequences with different number of duplicates [generated by Prinseq]");
fig15f<- newFigure( "../QC_graphics_results/filtered_graphics/duplicates_dl.png", " Duplicates: Distribution of duplicates [generated by Prinseq]");
fig16f<- newFigure( "../QC_graphics_results/filtered_graphics/duplicates_dm.png", " Duplicates: Top 100 duplicates for a single sequence [generated by Prinseq]");

##################CLUSTERING###################################

table_cluster <-read.table ("./statistic_files/cluster_sum_selected", sep="\t", quote="", col.names=c("Number of cluster","Cluster_Id","Sequence length","Number of clustered sequences"));
table_clust <- newTable(table_cluster, file="../statistic_files/cluster_sum", "Summary of clustered sequences" );
fig1clust <- newFigure ("../graph/clustering_low.jpeg", fileHighRes="../graph/clustering_high.jpeg", exportId="Figure_clust", "Number of sequences for each cluster");

##################ANNOTATION###################################
s4sub1 <- newSubSection("4.1 Gene Prediction");
s4sub2 <- newSubSection("4.2 Database Matching summary")

s4sub3 <- newSubSection("4.3 Representative proteins")
s4sub3sub1 <- newSubSection ("4.3.1 Results from eggNOG")
s4sub3sub2 <- newSubSection ("4.3.2 Results from GenBank")
s4sub3sub3 <- newSubSection ("4.3.3 Results from IMG")
s4sub3sub4 <- newSubSection ("4.3.4 Results from Interpro")
s4sub3sub5 <- newSubSection ("4.3.5 Results from KEGG")
s4sub3sub6 <- newSubSection ("4.3.6 Results from PATRIC")
s4sub3sub7 <- newSubSection ("4.3.7 Results from PHANTOME")
s4sub3sub8 <- newSubSection ("4.3.8 Results from RefSeq")
s4sub3sub9 <- newSubSection ("4.3.9 Results from SEED")
s4sub3sub10 <- newSubSection ("4.3.10 Results from Swissprot")
s4sub3sub11 <- newSubSection ("4.3.11 Results from TrEMBL")

s4sub4 <- newSubSection("4.4 Ontology")
s4sub4sub1 <- newSubSection ("4.4.1 Results from eggNOG")
s4sub4sub2 <- newSubSection ("4.4.2 Results from SEED")
s4sub4sub3 <- newSubSection ("4.4.3 Results from KEGG")

s4sub5 <- newSubSection("4.5 Taxonomy (Lowest Common Ancestor)")
s4sub5sub1 <- newSubSection ("4.5.1 Domain")
s4sub5sub2 <- newSubSection ("4.5.2 Phylum")
s4sub5sub3 <- newSubSection ("4.5.3 Class")
s4sub5sub4 <- newSubSection ("4.5.4 Order")
s4sub5sub5 <- newSubSection ("4.5.5 Family")
s4sub5sub6 <- newSubSection ("4.5.6 Genus")


s4sub6 <- newSubSection("4.6 Ribosomal annotation result")
s4sub6sub1 <- newSubSection ("4.6.1 Results from RDP")
s4sub6sub2 <- newSubSection ("4.6.2 Results from Greengenes")
s4sub6sub3 <- newSubSection ("4.6.3 Results from SSU")

table_ORF <- read.table ("./statistic_files/statistics_ORF_selected", sep="\t", quote="", header=TRUE);
table_pred <- newTable (table_ORF, file="../statistic_files/statistics_ORF", "Genes predicted for each cluster")
figdb <- newFigure ("../graph/databases_ids.jpeg", fileHighRes="../graph/databases_ids_high.jpeg", exportId="Figure_db", "Number of clusters matched in each database");
figdb_uni <- newFigure ("../graph/databases_uniqs_ids.jpeg", fileHighRes="../graph/databases_uniqs_ids_high.jpeg", exportId="Figure_db", "Uniqs Ids matched in each database");


figpath <- newFigure ("../graph/Kegg_path_low.jpeg", fileHighRes="../graph/Kegg_path_high.jpeg", exportId="Figure_Ontology", "Ontology from KEGG database");
figpath2 <- newFigure ("../graph/Seed_path_low.jpeg", fileHighRes="../graph/Seed_path_high.jpeg", exportId="Figure_Ontology2", "Ontology from SEED database");
figpath3 <- newFigure ("../graph/eggNOG_path_low.jpeg", fileHighRes="../graph/eggNOG_path_high.jpeg", exportId="Figure_Ontology3", "Ontology from eggNOG database");
figsbpath <- newFigure ("../graph/Kegg_subpath_low.jpeg", fileHighRes="../graph/Kegg_subpath_high.jpeg", exportId="Figure_Ontology3", "Ontology sub level from KEGG database");
figsbpath2 <- newFigure ("../graph/Seed_subpath_low.jpeg", fileHighRes="../graph/Seed_subpath_high.jpeg", exportId="Figure_Ontology4", "Ontology sub levelfrom SEED database");
figsbpath3 <- newFigure ("../graph/eggNOG_subpath_low.jpeg", fileHighRes="../graph/eggNOG_subpath_high.jpeg", exportId="Figure_Ontology5", "Ontology sub level from eggNOG database");

proegg <- newFigure ("../graph/eggNOG_hit_low.jpeg", fileHighRes="../graph/eggNOG_hit_high.jpeg", exportId="Figure_eggnog", "More representative proteins from eggNOG database");
progb <- newFigure ("../graph/GenBank_hit_low.jpeg", fileHighRes="../graph/GenBank_hit_high.jpeg", exportId="Figure_gb", "More representative proteins from GenBank database");
proIMG <- newFigure ("../graph/IMG_hit_low.jpeg", fileHighRes="../graph/IMG_hit_high.jpeg", exportId="Figure_img", "More representative proteins from IMG database");
prointerpro <- newFigure ("../graph/Interpro_hit_low.jpeg", fileHighRes="../graph/Interpro_hit_high.jpeg", exportId="Figure_interpro", "More representative proteins from Interpro database");
prokegg <- newFigure ("../graph/KEGG_hit_low.jpeg", fileHighRes="../graph/KEGG_hit_high.jpeg", exportId="Figure_hegg", "More representative proteins from KEGG database");
propatric <- newFigure ("../graph/PATRIC_hit_low.jpeg", fileHighRes="../graph/PATRIC_hit_high.jpeg", exportId="Figure_patri", "More representative proteins from PATRIC database");
prophan <- newFigure ("../graph/PHANTOME_hit_low.jpeg", fileHighRes="../graph/PHANTOME_hit_high.jpeg", exportId="Figure_phan", "More representative proteins from PHANTOME database");
proref <- newFigure ("../graph/RefSeq_hit_low.jpeg", fileHighRes="../graph/Refseq_hit_high.jpeg", exportId="Figure_eggnog", "More representative proteins from RefSeq database");
proseed <- newFigure ("../graph/SEED_hit_low.jpeg", fileHighRes="../graph/SEED_hit_high.jpeg", exportId="Figure_seed", "More representative proteins from SEED database");
proswis <- newFigure ("../graph/Swissprot_hit_low.jpeg", fileHighRes="../graph/Swissprot_hit_high.jpeg", exportId="Figure_swissprot", "More representative proteins from Swissprot database");
protrem <- newFigure ("../graph/TrEMBL_hit_low.jpeg", fileHighRes="../graph/TrEMBL_hit_high.jpeg", exportId="Figure_trembl", "More representative proteins from TrEMBL database");

dom <- newFigure ("../graph/domain_low.jpeg", fileHighRes="../graph/domain_high.jpeg", exportId="Figure_LCA", "Domain identification");
ph <- newFigure ("../graph/phylium_low.jpeg", fileHighRes="../graph/phylim_high.jpeg", exportId="Figure_LCA2", "Phylum identification ");
cl <- newFigure ("../graph/class_low.jpeg", fileHighRes="../graph/class_high.jpeg", exportId="Figure_LCA3", "Class identification ");
or <- newFigure ("../graph/order_low.jpeg", fileHighRes="../graph/order_high.jpeg", exportId="Figure_LCA4", "Order identification");
fam <- newFigure ("../graph/family_low.jpeg", fileHighRes="../graph/family_high.jpeg", exportId="Figure_LCA5", "Family identification");
ge <- newFigure ("../graph/genus_low.jpeg", fileHighRes="../graph/genus_high.jpeg", exportId="Figure_LCA6", "Genus identification");


domSSU <- newFigure ("../graph/SSU_domain_low.jpeg", fileHighRes="../graph/SSU_domain_high.jpeg", exportId="Figure_SSU", "Domain identification from SILVA database");
phSSU <- newFigure ("../graph/SSU_phylum_low.jpeg", fileHighRes="../graph/SSU_phylm_high.jpeg", exportId="Figure_SSU2", "Phylum identification from SILVA database");
clSSU <- newFigure ("../graph/SSU_class_low.jpeg", fileHighRes="../graph/SSU_class_high.jpeg", exportId="Figure_SSU", "Class identification from SILVA database");
orSSU <- newFigure ("../graph/SSU_order_low.jpeg", fileHighRes="../graph/SSU_order_high.jpeg", exportId="Figure_SSU", "Order identification from SILVA database");
faSSU <- newFigure ("../graph/SSU_family_low.jpeg", fileHighRes="../graph/SSU_family_high.jpeg", exportId="Figure_SSU", "Family identification from SILVA database");
geSSU <- newFigure ("../graph/SSU_genus_low.jpeg", fileHighRes="../graph/SSU_genus_high.jpeg", exportId="Figure_SSU", "Genus identification from SILVA database");

domRDP <- newFigure ("../graph/RDP_domain_low.jpeg", fileHighRes="../graph/RDP_domain_high.jpeg", exportId="Figure_RDP", "Domain identification from RDP database");
phRDP <- newFigure ("../graph/RDP_phylum_low.jpeg", fileHighRes="../graph/RDP_phylm_high.jpeg", exportId="Figure_RDP2", "Phylum identification from RDP database");
clRDP <- newFigure ("../graph/RDP_class_low.jpeg", fileHighRes="../graph/RDP_class_high.jpeg", exportId="Figure_RDP3", "Class identification from RDP database");
orRDP <- newFigure ("../graph/RDP_order_low.jpeg", fileHighRes="../graph/RDP_order_high.jpeg", exportId="Figure_RDP4", "Order identification from RDP database");
faRDP <- newFigure ("../graph/RDP_family_low.jpeg", fileHighRes="../graph/RDP_family_high.jpeg", exportId="Figure_RDP5", "Family identification from RDP database");
geRDP <- newFigure ("../graph/RDP_genus_low.jpeg", fileHighRes="../graph/RDP_genus_high.jpeg", exportId="Figure_RDP6", "Genus identification from RDP database");

domGG <- newFigure ("../graph/Greengenes_domain_low.jpeg", fileHighRes="../graph/Greengenes_domain_high.jpeg", exportId="Figure_Greengenes", "Domain identification from Greengenes database");
phGG <- newFigure ("../graph/Greengenes_phylum_low.jpeg", fileHighRes="../graph/Greengenes_phylm_high.jpeg", exportId="Figure_Greengenes2", "Phylum identification from Greengenes database");
clGG <- newFigure ("../graph/Greengenes_class_low.jpeg", fileHighRes="../graph/Greengenes_class_high.jpeg", exportId="Figure_Greengenes3", "Class identification from Greengenes database");
orGG <- newFigure ("../graph/Greengenes_order_low.jpeg", fileHighRes="../graph/Greengenes_order_high.jpeg", exportId="Figure_Greengenes4", "Order identification from Greengenes database");
faGG <- newFigure ("../graph/Greengenes_family_low.jpeg", fileHighRes="../graph/Greengenes_family_high.jpeg", exportId="Figure_Greengenes5", "Family identification from Greengenes database");
geGG <- newFigure ("../graph/Greengenes_genus_low.jpeg", fileHighRes="../graph/Greengenes_genus_high.jpeg", exportId="Figure_Greengenes6", "Genus identification from Greengenes database");

############################################################################

s2sub1sub1 <- addTo (s2sub1sub1, fig1, fig2, fig3);
s2sub1sub2 <- addTo (s2sub1sub2, fig4, fig5);
#s2sub1sub3 <- addTo (s2sub1sub3, fig7, fig8);
s2sub1sub3 <- addTo (s2sub1sub3, fig10, fig11, fig12);
s2sub1sub4 <- addTo (s2sub1sub4, fig13);
s2sub1 <- addTo (s2sub1, s2sub1sub1, s2sub1sub2, s2sub1sub3, s2sub1sub4);

s2sub2sub1 <- addTo (s2sub2sub1, fig1f, fig2f, fig3f);
s2sub2sub2 <- addTo (s2sub2sub2, fig4f, fig5f);
#s2sub2sub3 <- addTo (s2sub2sub3, fig7f, fig8f);
s2sub2sub3 <- addTo (s2sub2sub3, fig10f, fig11f, fig12f);
s2sub2sub4 <- addTo (s2sub2sub4, fig13f);
s2sub2 <- addTo (s2sub2, s2sub2sub1, s2sub2sub2, s2sub2sub3, s2sub2sub4);
#s2sub2
s4sub3sub1 <- addTo (s4sub3sub1, proegg);
s4sub3sub2 <- addTo (s4sub3sub2, progb);
s4sub3sub3 <- addTo (s4sub3sub3, proIMG);
s4sub3sub4 <- addTo (s4sub3sub4, prointerpro);
s4sub3sub5 <- addTo (s4sub3sub5, prokegg);
s4sub3sub6 <- addTo (s4sub3sub6, propatric);
s4sub3sub7 <- addTo (s4sub3sub7, prophan);
s4sub3sub8 <- addTo (s4sub3sub8, proref);
s4sub3sub9 <- addTo (s4sub3sub9, proseed);
s4sub3sub10 <- addTo (s4sub3sub10, proswis);
s4sub3sub11 <- addTo (s4sub3sub1, protrem);
s4sub3 <- addTo (s4sub3, s4sub3sub1, s4sub3sub2, s4sub3sub3, s4sub3sub4, s4sub3sub5, s4sub3sub6, s4sub3sub7, s4sub3sub8, s4sub3sub9, s4sub3sub10, s4sub3sub11);


s4sub4sub1 <- addTo (s4sub4sub1, figpath3, figsbpath3);
s4sub4sub2 <- addTo (s4sub4sub2, figpath2, figsbpath2);
s4sub4sub3 <- addTo (s4sub4sub3, figpath, figsbpath);
s4sub4 <- addTo (s4sub4, s4sub4sub1, s4sub4sub2, s4sub4sub3);

s4sub5sub1 <- addTo (s4sub5sub1, dom);
s4sub5sub2 <- addTo (s4sub5sub2, ph);
s4sub5sub3 <- addTo (s4sub5sub3, cl);
s4sub5sub4 <- addTo (s4sub5sub4, or);
s4sub5sub5 <- addTo (s4sub5sub5, fam);
s4sub5sub6 <- addTo (s4sub5sub6, ge);
s4sub5 <- addTo (s4sub5, s4sub5sub1, s4sub5sub2, s4sub5sub3, s4sub5sub4, s4sub5sub5, s4sub5sub6);

s4sub6sub1 <- addTo (s4sub6sub1, domRDP, phRDP, clRDP, orRDP, faRDP, geRDP);
s4sub6sub2 <- addTo (s4sub6sub2, domGG, phGG, clGG, orGG, faGG, geGG);
s4sub6sub3 <- addTo (s4sub6sub3, domSSU, phSSU, clSSU, orSSU, faSSU, geSSU);
s4sub6 <- addTo (s4sub6, s4sub6sub1, s4sub6sub2, s4sub6sub3);

#s4sub4 <- addTo (s4sub4, figpath, figpath2, figpath3, figsbpath, figsbpath2, figsbpath3);
s4sub2 <- addTo (s4sub2, figdb, figdb_uni);
s4sub1 <- addTo (s4sub1, table_pred);

s4<- addTo (s4, s4sub1, s4sub2, s4sub3, s4sub4, s4sub5, s4sub6);
s3 <- addTo (s3, table_clust, fig1clust );
s2 <- addTo( s2, s2sub1, s2sub2);
s1 <- addTo (s1, table1);


r <- addTo(r, s1, s2, s3, s4, s6);
writeReport( r, filename="reports/paper" );