 .separator "\t"
 .header on
CREATE TABLE InterPro ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
#CREATE INDEX M5 ON InterPro (M5);
#CREATE INDEX Protein ON InterPro (Protein);
#CREATE INDEX Specie ON InterPro (Specie);
#CREATE INDEX DB ON InterPro (DB);
.import "./InterPro/InterPro.md52id2func" InterPro

CREATE TABLE KEGG_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./KEGG/KEGG.md52id2func" KEGG_function
CREATE TABLE KEGG_hierachy ( DB TEXT, Path TEXT, Functions TEXT, Path_ID TEXT,  Family TEXT,  KO_ID TEXT);
.import "./KEGG/ko.id2hierachy" KEGG_hierachy
CREATE TABLE KEGG_ontology ( M5 TEXT, KO_Id TEXT, Ontology TEXT, DB TEXT);
.import "./KEGG/KEGG.md52id2ont" KEGG_ontology

CREATE TABLE IMG ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./IMG/IMG.md52id2func" IMG

CREATE TABLE PATRIC ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./PATRIC/PATRIC.md52id2func" PATRIC

CREATE TABLE PHANTOME ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./Phantome/Phantome.md52id2func" PHANTOME

CREATE TABLE SEED_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./SEED/SEED.md52id2func" SEED_function
CREATE TABLE SEED_ontology ( M5 TEXT, SS_Id TEXT, Ontology TEXT, DB TEXT);
.import "./SEED/SSED.md52id2ont" SEED_ontology
CREATE TABLE SEED_subsystems (Related TEXT, Proces TEXT, Function TEXT, Name TEXT, SS_Id TEXT);
.import "./SEED/SSED.id2subsystems" SEED_subsystems

CREATE TABLE SwissProt_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./UniProt/SwissProt.md52id2func" SwissProt_function
CREATE TABLE SwissProt_ontology ( M5 TEXT, GO_Id TEXT, Ontology TEXT, DB TEXT);
.import "./UniProt/SwissProt.md52id2ont" SwissProt_ontology
CREATE TABLE TrEMBL_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./UniProt/TrEMBL.md52id2func" TrEMBL_function
CREATE TABLE TrEMBL_ontology ( M5 TEXT, GO_Id TEXT, Ontology TEXT, DB TEXT);
.import "./UniProt/TrEMBL.md52id2ont" TrEMBL_ontology

CREATE TABLE GenBank_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./NCBI/GenBank.md52id2func" GenBank_function
CREATE TABLE GenBank_ref ( Id TEXT, GI_Id TEXT);
.import "./NCBI/GenBank.id2xref" GenBank_ref

CREATE TABLE RefSeq_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT, Start INT, End INT, Strand TEXT, Contig_ID TEXT, Info TEXT, Contig_length INT);
.import "./NCBI/RefSeq.md52id2func" RefSeq_function
CREATE TABLE RefSeq_tax ( Contig_ID TEXT, Taxonomy TEXT);
.import "./NCBI/RefSeq.id2tax" RefSeq_tax

CREATE TABLE m5_lca ( m5_ID TEXT, domain TEXT, phylium TEXT, class TEXT, orders TEXT, family TEXT, genus TEXT, specie TEXT, name TEXT, level INT (20));
.import "../annotations/md5_lca_map" m5_lca

#########################
CREATE TABLE eggNOG_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./eggNOG/eggNOG.md52id2func" eggNOG_function
CREATE TABLE eggNOG_ontology ( M5 TEXT, Id TEXT, Ontology TEXT, DB TEXT);
.import "./eggNOG/eggNOG.md52id2ont" eggNOG_ontology


CREATE TABLE GO_ontology ( Id TEXT, Ontology TEXT);
.import "./Uniprot2GO/assigned_functions" GO_ontology

CREATE TABLE Ontologies ( Num TEXT, Level1 TEXT, Level2 TEXT, Level3 TEXT, Protein TEXT, Id TEXT, DB TEXT);
.import "../annotations/ontologies" Ontologies


CREATE TABLE LSU_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./SILVA/LSU.md52id2func" LSU_function
CREATE TABLE LSU_tax ( Id TEXT, Taxonomy TEXT);
.import "./SILVA/LSU.id2tax" LSU_tax

CREATE TABLE SSU_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./SILVA/SSU.md52id2func" SSU_function
CREATE TABLE SSU_tax ( Id TEXT, Taxonomy TEXT);
.import "./SILVA/SSU.id2tax" SSU_tax

CREATE TABLE RDP_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./RDP/RDPv10.md52id2func" RDP_function
CREATE TABLE RDP_tax ( Id TEXT, Taxonomy TEXT);
.import "./RDP/RDPv10.id2tax" RDP_tax

CREATE TABLE Greengenes_function ( M5 TEXT, Id TEXT, Protein TEXT, Specie TEXT, DB TEXT);
.import "./Greengenes/Greengenes.md52id2func" Greengenes_function
CREATE TABLE Greengenes_tax ( Id TEXT, Taxonomy TEXT);
.import "./Greengenes/Greengenes.id2tax" Greengenes_tax



CREATE TABLE temp2 
 SELECT temp1.*, ontology_map.database_ID, ontology_map.prot_db
 FROM temp1, ontology_map
 WHERE temp1.source = ontology_map.source;