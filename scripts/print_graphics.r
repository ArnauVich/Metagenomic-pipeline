#!/usr/bin/Rscript
library ("ggplot2")
args <- commandArgs(trailingOnly = TRUE)
print(args)
setwd (args[1])
#list.files (path=".")
##########PROTEIN GRAPHIC################
if(file.exists("./result_GenBank_graph")){
prot_Hit <- read.table ("result_GenBank_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] #select rows, select columns 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) #sort data of proteins databases [numeric]
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins GenBank", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20))+ labs (title="More representative proteins GenBank", x="Protein", y= "Count")
ggsave(file="../graph/GenBank_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/GenBank_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_IMG_graph")){
prot_Hit <- read.table ("result_IMG_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins IMG", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20))+ labs (title="More representative proteins IMG", x="Protein", y= "Count")
ggsave(file="../graph/IMG_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/IMG_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_Interpro_graph")){
prot_Hit <- read.table ("result_Interpro_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins Interpro", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) +labs (title="More representative proteins Interpro", x="Protein", y= "Count")
ggsave(file="../graph/Interpro_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/Interpro_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_KEGG_graph")){
prot_Hit <- read.table ("result_KEGG_graph", sep= "\t", quote="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) +labs (title="More representative proteins KEGG", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) +labs (title="More representative proteins KEGG", x="Protein", y= "Count")
ggsave(file="../graph/KEGG_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/KEGG_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_PATRIC_graph")){
prot_Hit <- read.table ("result_PATRIC_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins PATRIC", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20))+labs (title="More representative proteins PATRIC", x="Protein", y= "Count")
ggsave(file="../graph/PATRIC_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/PATRIC_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_PHANTOME_graph")){
prot_Hit <- read.table ("result_PHANTOME_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins PHANTOME", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) + labs (title="More representative proteins PHANTOME", x="Protein", y= "Count")
ggsave(file="../graph/PHANTOME_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/PHANTOME_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_RefSeq_graph")){
prot_Hit <- read.table ("result_RefSeq_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins Refseq", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) +labs (title="More representative proteins Refseq", x="Protein", y= "Count")
ggsave(file="../graph/RefSeq_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/RefSeq_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_SEED_graph")){
prot_Hit <- read.table ("result_SEED_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins SEED", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) + labs (title="More representative proteins SEED", x="Protein", y= "Count")
ggsave(file="../graph/SEED_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/SEED_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_Swissprot_graph")){
prot_Hit <- read.table ("result_Swissprot_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins Swissprot", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) + labs (title="More representative proteins Swissprot", x="Protein", y= "Count")
ggsave(file="../graph/Swissprot_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/Swissprot_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_TrEMBL_graph")){
prot_Hit <- read.table ("result_TrEMBL_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins TrEMBL", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) + labs (title="More representative proteins TrEMBL", x="Protein", y= "Count")
ggsave(file="../graph/TrEMBL_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/TrEMBL_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}

if(file.exists("./result_eggNOG_graph")){
prot_Hit <- read.table ("result_eggNOG_graph", sep= "\t", quote="", comment.char="")
prot_Hit_selected<-prot_Hit[1:30, 1:3] 
prot_Hit_selected$V2<- factor(prot_Hit_selected$V2, levels=prot_Hit_selected$V2) 
plot1=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=100)) + labs (title="More representative proteins eggNOG", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
plot2=ggplot (prot_Hit_selected, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_x_discrete(label=function(x) abbreviate(x, minlength=20)) + labs (title="More representative proteins eggNOG", x="Protein", y= "Count")
ggsave(file="../graph/eggNOG_hit_low.jpeg", plot2, unit="in", width=9.3, height=8.2, dpi=75)
ggsave(file="../graph/eggNOG_hit_high.jpeg", plot1,unit="in", width=20.3, height=12.2)
}



##########TOP TEN GRAPH##################
if(file.exists("./result_TrEMBL_top_ten")){
top_ten <- read.table ("result_TrEMBL_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters TrEMBL", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters TrEMBL", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/TrEMBL_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/TrEMBL_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_Swissprot_top_ten")){
top_ten <- read.table ("result_Swissprot_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Swissprot", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Swissprot", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/Swissprot_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/Swissprot_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_SEED_top_ten")){
top_ten <- read.table ("result_SEED_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters SEED", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters SEED", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/SEED_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/SEED_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_RefSeq_top_ten")){
top_ten <- read.table ("result_RefSeq_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Refseq", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Refseq", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/RefSeq_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/RefSeq_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_PHANTOME_top_ten")){
top_ten <- read.table ("result_PHANTOME_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters PHANTOME", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters PHANTOME", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/PHANTOME_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/PHANTOME_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_PATRIC_top_ten")){
top_ten <- read.table ("result_PATRIC_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters PATRIC", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters PATRIC", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/PATRIC_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/PATRIC_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_KEGG_top_ten")){
top_ten <- read.table ("result_KEGG_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters KEGG", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters KEGG", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/KEGG_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/KEGG_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_Interpro_top_ten")){
top_ten <- read.table ("result_Interpro_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Interpro", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters Interpro", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/Interpro_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/Interpro_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_IMG_top_ten")){
top_ten <- read.table ("result_IMG_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters IMG", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters IMG", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/IMG_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/IMG_top_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_GenBank_top_ten")){
top_ten <- read.table ("result_GenBank_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters GenBank", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters GenBank", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/GenBank_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/GenBank_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}
if(file.exists("./result_eggNOG_top_ten")){
top_ten <- read.table ("result_eggNOG_top_ten", sep="\t")
plot1=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters GenBank", x="Clusters name", y= "Hits")
plot2=ggplot (top_ten, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#56B4E9",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Top Ten clusters GenBank", x="Clusters name", y= "Hits") + geom_text(aes(label = V1, stat="identity", vjust="1.5" ))
ggsave(file="../graph/eggNOG_top_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/eggNOG_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}


##########BAR PLOT FOR DATABASE MATCH [ALL IDS ALL DB]#########
if(file.exists("./graphic_db_ids")){
	ids <- read.table ("graphic_db_ids", sep="\t")
plot1=ggplot(ids,aes(x=reorder(V2,V2, function(x)-length(x)))) + geom_bar(colour="black", fill="#D55E00") + labs (title="Cluster represented in databases", x="Databases", y= "Number of clusters") + theme_bw()
ggsave(file="../graph/databases_ids.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/databases_ids_high.jpeg", plot1, unit="in", width=20.3, height=12.2, dpi=600)
}

##########BAR PLOT FOR DATABASE MATCH [UNIQs IDS]#########
if(file.exists("./graphic_ids")){
ids <- read.table ("graphic_ids", sep="\t")
plot1=ggplot(ids,aes(x=reorder(V2,V2, function(x)-length(x)))) + geom_bar(colour="black", fill="#F0E442") + labs (title="Uniqs Clusters in Databases", x="Databases", y= "Number of clusters") + theme_bw()
ggsave(file="../graph/databases_uniqs_ids.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/databases_uniqs_ids_high.jpeg", plot1, unit="in", width=20.3, height=12.2, dpi=600)
}

##########PIE CHART FOR TAX INFO#######################
graph_col= c( "#008000" ,"#000080","#008080", "#800080","#0000FF","#808080","#D2691E","#800000","#FF4500", "#DC143C","#FFD700", "#9ACD32", "#E0FFFF","#FFFFFF" , "#8A2BE2", "#EE82EE", "#FFE4C4", "#A0522D", "#778899", "#000000" )
if(file.exists("Taxonomy_Class_info")){
	family <- read.table ("Taxonomy_Class_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/class_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Class")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/class_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Class")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Taxonomy_Domain_info")){
	domain <- read.table ("Taxonomy_Domain_info", sep="\t")
	jpeg(file="../graph/domain_low.jpeg", width=600, height=550, res=45)
	pie(domain$V3, labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/domain_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(domain$V3), labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Taxonomy_Family_info")){
	family <- read.table ("Taxonomy_Family_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/family_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/family_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Taxonomy_Genus_info")){
	family <- read.table ("Taxonomy_Genus_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/genus_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/genus_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Taxonomy_Phylium_info")){
	family <- read.table ("Taxonomy_Phylium_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/phylium_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/phylim_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Taxonomy_Order_info")){
	family <- read.table ("Taxonomy_Order_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/order_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Orders")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/order_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Orders")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}


##########PIE PLOT FOR ONTOLOGIES###########################

if(file.exists("Ontology_KEGG_Path_info")){
	family <- read.table ("Ontology_KEGG_Path_info", sep="\t")
	piedat <- family
	jpeg(file="../graph/Kegg_path_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [KEGG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Kegg_path_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [KEGG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Ontology_KEGG_Subpath_info")){
	family <- read.table ("Ontology_KEGG_Subpath_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/Kegg_subpath_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [KEGG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Kegg_subpath_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [KEGG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Ontology_SEED_Path_info")){
	family <- read.table ("Ontology_SEED_Path_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/Seed_path_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [SEED]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Seed_path_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [SEED]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Ontology_SEED_Subpath_info")){
	family <- read.table ("Ontology_SEED_Subpath_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/Seed_subpath_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [SEED]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Seed_subpath_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [SEED]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("Ontology_eggNOG_Path_info")){
	family <- read.table ("Ontology_eggNOG_Path_info", sep="\t")
	piedat <- family
	jpeg(file="../graph/eggNOG_path_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [eggNOG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/eggNOG_path_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals paths [eggNOG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}
if(file.exists("Ontology_eggNOG_Subpath_info")){
	family <- read.table ("Ontology_eggNOG_Subpath_info", sep="\t")
	piedat <- rbind(family[1:15, ],
                as.data.frame(t(c(sum(family[16:nrow(family),1]),
                                "Others",
                                sum(family[16:nrow(family),3])))))
	jpeg(file="../graph/eggNOG_subpath_low.jpeg", width=600, height=550, res=45)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [eggNOG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/eggNOG_subpath_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Biologicals process [eggNOG]")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}



#################BAR PLOT FOR CLUSTERS#############################
if(file.exists("../statistic_files/cluster_sum")){
	ids <- read.table ("../statistic_files/cluster_sum", sep="\t")
	ids <- ids [1:30, 1:4] 
plot1=ggplot (ids, aes (x=V2,y=V4)) + geom_bar (stat ="identity", fill="red",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Cluster density", x="Clusters name", y= "Number of reads")
plot2=ggplot (ids, aes (x=V2,y=V4)) + geom_bar (stat ="identity", fill="red",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="Cluster density", x="Clusters name", y= "Number of reads") + geom_text(aes(label=V4, stat="identity", vjust="1.5" ))
ggsave(file="../graph/clustering_low.jpeg", plot1, unit="in", width=9.3, height=8.2, dpi=90)
ggsave(file="../graph/clustering_high.jpeg", plot2, unit="in", width=20.3, height=12.2)
}



##################PIE CHART FOR RIBOSOMIC FILES###################

if(file.exists("rRna_RDP_taxonomy_domain")){
	domain <- read.table ("rRna_RDP_taxonomy_domain", sep="\t")
	jpeg(file="../graph/RDP_domain_low.jpeg", width=600, height=550, res=75)
	pie(domain$V3, labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_domain_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(domain$V3), labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_RDP_taxonomy_phylum")){
	family <- read.table ("rRna_RDP_taxonomy_phylum", sep="\t")
	family[, 1] <- as.numeric(as.character( family[, 1] ))
	family[, 3] <- as.numeric(as.character( family[, 3] ))
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/RDP_phylum_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_phylm_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_RDP_taxonomy_class")){
	family <- read.table ("rRna_RDP_taxonomy_class", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/RDP_class_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_class_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_RDP_taxonomy_order")){
	family <- read.table ("rRna_RDP_taxonomy_order", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/RDP_order_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_order_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_RDP_taxonomy_family")){
	family <- read.table ("rRna_RDP_taxonomy_family", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/RDP_family_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_family_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_RDP_taxonomy_genus")){
	family <- read.table ("rRna_RDP_taxonomy_genus", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/RDP_genus_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/RDP_genus_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}


if(file.exists("rRna_LSU_taxonomy_domain")){
	domain <- read.table ("rRna_LSU_taxonomy_domain", sep="\t")
	jpeg(file="../graph/LSU_domain_low.jpeg", width=600, height=550, res=75)
	pie(domain$V3, labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_domain_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(domain$V3), labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_LSU_taxonomy_phylum")){
	family <- read.table ("rRna_LSU_taxonomy_phylum", sep="\t")
	piedat <- family
	jpeg(file="../graph/LSU_phylum_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_phylm_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_LSU_taxonomy_class")){
	family <- read.table ("rRna_LSU_taxonomy_class", sep="\t")
	piedat <- family
	jpeg(file="../graph/LSU_class_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_class_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_LSU_taxonomy_order")){
	family <- read.table ("rRna_LSU_taxonomy_order", sep="\t")
	piedat <- family
	jpeg(file="../graph/LSU_order_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_order_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_LSU_taxonomy_family")){
	family <- read.table ("rRna_LSU_taxonomy_family", sep="\t")
	piedat <- family
	jpeg(file="../graph/LSU_family_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_family_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_LSU_taxonomy_genus")){
	family <- read.table ("rRna_LSU_taxonomy_genus", sep="\t")
	piedat <- family
	jpeg(file="../graph/LSU_genus_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/LSU_genus_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}


if(file.exists("rRna_SSU_taxonomy_domain")){
	domain <- read.table ("rRna_SSU_taxonomy_domain", sep="\t")
	jpeg(file="../graph/SSU_domain_low.jpeg", width=600, height=550, res=75)
	pie(domain$V3, labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_domain_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(domain$V3), labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_SSU_taxonomy_phylum")){
	family <- read.table ("rRna_SSU_taxonomy_phylum", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/SSU_phylum_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_phylm_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_SSU_taxonomy_class")){
	family <- read.table ("rRna_SSU_taxonomy_class", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/SSU_class_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_class_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_SSU_taxonomy_order")){
	family <- read.table ("rRna_SSU_taxonomy_order", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/SSU_order_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_order_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_SSU_taxonomy_family")){
	family <- read.table ("rRna_SSU_taxonomy_family", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/SSU_family_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_family_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_SSU_taxonomy_genus")){
	family <- read.table ("rRna_SSU_taxonomy_genus", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/SSU_genus_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/SSU_genus_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}


if(file.exists("rRna_Greengenes_taxonomy_domain")){
	domain <- read.table ("rRna_Greengenes_taxonomy_domain", sep="\t")
	png(file="../graph/Greengenes_domain_low.png", width=600, height=550, res=75)
	pie(domain$V3, labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_domain_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(domain$V3), labels=domain$V3, clockwise=TRUE, col=graph_col, main="More representative Domains")
	legend("topright", legend=domain$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_Greengenes_taxonomy_phylum")){
	family <- read.table ("rRna_Greengenes_taxonomy_phylum", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/Greengenes_phylum_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_phylm_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Phyliums")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_Greengenes_taxonomy_class")){
	family <- read.table ("rRna_Greengenes_taxonomy_class", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/Greengenes_class_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_class_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Classes")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_Greengenes_taxonomy_order")){
	family <- read.table ("rRna_Greengenes_taxonomy_order", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/Greengenes_order_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_order_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Order")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_Greengenes_taxonomy_family")){
	family <- read.table ("rRna_Greengenes_taxonomy_family", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/Greengenes_family_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_family_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}

if(file.exists("rRna_Greengenes_taxonomy_genus")){
	family <- read.table ("rRna_Greengenes_taxonomy_genus", sep="\t")
	piedat <- rbind(family[1:7, ],
                as.data.frame(t(c(sum(family[8:nrow(family),1]),
                                "Others",
                                sum(family[8:nrow(family),3])))))
	jpeg(file="../graph/Greengenes_genus_low.jpeg", width=600, height=550, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
	jpeg(file="../graph/Greengenes_genus_high.jpeg", width=1300, height=850, res=75)
	pie(as.numeric(piedat$V3), labels=piedat$V3, clockwise=TRUE, col=graph_col, main="More representative genus")
	legend("topright", legend=piedat$V2, cex=0.8, fill=graph_col)
	dev.off()
}














##ggplot(ids_rep,aes(x=reorder(V2,V2, function(x)-length(x)))) + geom_bar(colour="black", fill="#F0E442") + labs (title="Uniqs Clusters in Databases", x="Databases", y= "Number of clusters") + theme_bw()
#TOP TEN GRAPHIC
##

##ggplot (data2, aes (x=V2,y=V1)) + geom_bar (stat ="identity", fill="#009E73",colour="black") +  theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + labs (title="More representative proteins", x="Protein", y= "Count") + geom_text(aes(label = V3, stat="identity", vjust="1.5" ))
#PIE CHART GRAPHIC
##ggplot(clas, aes (x=factor(1), fill=V2, weight=V3)) + geom_bar(width=1,colour="black") + coord_polar (theta="y") + theme(axis.title.x = element_blank(), axis.title.y= element_blank(), axis.text.x=element_blank(), axis.text.y=element_blank(), panel.grid.minor = element_blank(), panel.grid.major = element_blank(), panel.border = element_blank())
#BAR PLOT FOR TAXONOMI
##ggplot(domain, aes (x=V2, y=V3)) + geom_bar(stat="identity",width=1,colour="black") + coord_flip () + theme_bw()
#BAR PLOT FOR IDS VS DB
##ggplot(ids,aes(x=reorder(V2,V2, function(x)-length(x)))) + geom_bar(colour="black", fill="#D55E00") + labs (title="Cluster represented in databases", x="Databases", y= "Number of clusters") + theme_bw()
#BAR PLOT FOR UNIQs IDS
##ggplot(ids_rep,aes(x=reorder(V2,V2, function(x)-length(x)))) + geom_bar(colour="black", fill="#F0E442") + labs (title="Uniqs Clusters in Databases", x="Databases", y= "Number of clusters") + theme_bw()
# read txt files with names of the form Patient*.txt
#txt_files = list.files(pattern = 'Patient*.txt');
##graph_col= c( "#008000" ,"#000080","#008080", "#800080","#0000FF","#808080","#D2691E","#800000","#FF4500", "#DC143C","#FFD700", "#9ACD32", "#E0FFFF","#FFFFFF" , "#8A2BE2", "#EE82EE", "#FFE4C4", "#A0522D", "#778899", "#000000" )
# read txt files into a list (assuming separator is a comma)
#data_list = lapply(txt_files, read.table, sep = ",")
##pie(family$V3, labels=family$V3, clockwise=TRUE, col=graph_col, main="More representative Families")
##legend("topright", legend=family$V2, cex=0.8, fill=graph_col)