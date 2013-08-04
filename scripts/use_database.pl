#!/usr/bin/perl

use DBI;
#use strict;
use Getopt::Long;


my $driver   = "SQLite"; 
my $local = " ";
my $userid = "";
my $password = "";
my $databases= "";
my $input="";
my $output_path="./Hits_databases/";


GetOptions ('input|in:s' => \$input, 
            'databases|db:s' => \@databases,
            'output_path|out:s' => \$output_path, 
            'local_M5nr|M5:s' =>\$local 
            );
my $dsn = "DBI:$driver:dbname=$local";

my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) 
                     or die $DBI::errstr;
                      print "Opened database successfully\n";




if ($input){
	import_input ($input);
	taxonomy ();
}
if (@databases) {
	foreach $i (@databases){
	if ($i eq 'InterPro'){
		InterPro();
	};
	if ($i eq 'IMG'){
		IMG ();
	};
	if ($i eq 'PHANTOME'){
		PHANTOME ();
	};
	if ($i eq 'PATRIC'){
		PATRIC ();
	};
	if ($i eq 'KEGG'){
		KEGG ();
		KEGG_ontology ();
	}
	if ($i eq 'SEED'){
		SEED ();
		SEED_ontology ();
	}
	if ($i eq 'UniProt'){
		Swissprot ();
		Swissprot_ontology ();
		TrEMBL ();
		TrEMBL_ontology ();
	}
	if ($i eq 'NCBI'){
		GenBank ();
		GenBank_ref ();
		RefSeq ();
		RefSeq_tax ();
	}
	if ($i eq 'eggNOG'){
		eggNOG ();
		eggNOG_ontology ();
	}
	if ($i eq 'SILVA'){
		LSU ();
		LSU_tax ();
		SSU ();
		SSU_tax ();
	}
	if ($i eq 'RDP'){
		RDP ();
		RDP_tax ();
	}
	if ($i eq 'Greengenes'){
		Greengenes ();
		Greengenes_tax ();
	}

	if ($i eq 'ALL'){
		GenBank ();
		GenBank_ref ();
		RefSeq ();
		RefSeq_tax ();
		Swissprot ();
		#Swissprot_ontology ();
		TrEMBL ();
		#TrEMBL_ontology ();
		SEED ();
		SEED_ontology ();
		KEGG ();
		KEGG_ontology ();
		PATRIC ();
		IMG ();
		PHANTOME ();
		InterPro();
		eggNOG ();
		eggNOG_ontology ();
	}
	if ($i eq 'rRNA'){
		LSU ();
		LSU_tax ();
		SSU ();
		SSU_tax ();
		RDP ();
		RDP_tax ();
		Greengenes ();
		Greengenes_tax ();
	}
	else {
		print "No existing database, please make sure that you have created any database\n"
	}
}};
sub import_input {
	print "Importing Input file \n";
	my $stmt = qq(DROP TABLE IF EXISTS matching_prot );
	my $rv = $dbh->do($stmt);
	my $stmt = qq(CREATE TABLE matching_prot
		(Seq_ID TEXT,
	 	M5 TEXT,
	 	Identity REAL,
	 	Evalue REAL,
	 	Bit_score REAL););
	my $rv = $dbh->do($stmt);
	my $stmt = qq( INSERT INTO matching_prot (
	 	Seq_ID,
	 	M5,
	 	Identity,
	 	Evalue,
	 	Bit_score) VALUES ( ?, ?, ?, ?, ?););
	my $stmth = $dbh->prepare($stmt);
	open FILE,'<',$input or die "No Input";
   	while (<FILE>) 
   	{
   		chomp;
   		my @values = split (/\t/);
   		my $result = $stmth->execute(@values); 
   	}
	close FILE;
	} 
##my stmth->finish;
##print $dbh ->{sqlite_version} 
sub InterPro {
	print "Matching Interpro database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, InterPro.Id, InterPro.Protein, InterPro.Specie, InterPro.DB FROM matching_prot, InterPro
		WHERE matching_prot.M5 = InterPro.M5 ));
	open FILE, ">$output_path/result_Interpro" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub IMG {
	print "Matching IMG database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, IMG.Id, IMG.Protein, IMG.Specie, IMG.DB FROM matching_prot, IMG
		WHERE matching_prot.M5 = IMG.M5 ));
	open FILE, ">$output_path/result_IMG" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub PHANTOME {
	print "Matching PHANTOME database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, PHANTOME.Id, PHANTOME.Protein, PHANTOME.Specie, PHANTOME.DB FROM matching_prot, PHANTOME
		WHERE matching_prot.M5 = PHANTOME.M5 ));
	open FILE, ">$output_path/result_PHANTOME" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub PATRIC {
	print "Matching PATRIC database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, PATRIC.Id, PATRIC.Protein, PATRIC.Specie, PATRIC.DB FROM matching_prot, PATRIC
		WHERE matching_prot.M5 = PATRIC.M5 ));
	open FILE, ">$output_path/result_PATRIC" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub KEGG {
	print "Matching KEGG database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, KEGG_function.Id, KEGG_function.Protein, KEGG_function.Specie, KEGG_function.DB FROM matching_prot, KEGG_function
		WHERE matching_prot.M5 = KEGG_function.M5 ));
	open FILE, ">$output_path/result_KEGG" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub KEGG_ontology {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, KEGG_ontology.Ontology, KEGG_hierachy.Path, KEGG_hierachy.Functions, KEGG_hierachy.Family FROM matching_prot, KEGG_ontology, KEGG_hierachy
		WHERE matching_prot.M5 = KEGG_ontology.M5 AND KEGG_ontology.KO_Id = KEGG_hierachy.KO_ID ));
	open FILE, ">$output_path/Ontology_KEGG" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Ontology, $Path, $Functions, $Family) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Ontology \t $Path \t $Functions \t $Family\n";
	}	
	close FILE;
}
sub SEED {
	print "Matching SEED database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, SEED_function.Id, SEED_function.Protein, SEED_function.Specie, SEED_function.DB FROM matching_prot, SEED_function
		WHERE matching_prot.M5 = SEED_function.M5 ));
	open FILE, ">$output_path/result_SEED" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub SEED_ontology {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, SEED_ontology.Ontology, SEED_subsystems.* FROM matching_prot, SEED_ontology, SEED_subsystems
		WHERE matching_prot.M5 = SEED_ontology.M5 AND SEED_ontology.SS_Id = SEED_subsystems.SS_Id ));
	open FILE, ">$output_path/Ontology_SEED" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Ontology, $Related, $Process, $Function, $Name, $SS_Id) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Ontology \t $Related \t $Process \t $Function \t $Name \t $SS_Id \n";
	}	
	close FILE;
}
sub Swissprot {
	print "Matching UniProt database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, Swissprot_function.Id, Swissprot_function.Protein, Swissprot_function.Specie, Swissprot_function.DB FROM matching_prot, Swissprot_function
		WHERE matching_prot.M5 = Swissprot_function.M5 ));
	open FILE, ">$output_path/result_Swissprot" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}
sub Swissprot_ontology {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, Swissprot_ontology.GO_Id, GO_ontology.Ontology, Swissprot_ontology.Ontology FROM matching_prot, Swissprot_ontology, GO_ontology
		WHERE matching_prot.M5 = Swissprot_ontology.M5 AND Swissprot_ontology.GO_Id = GO_ontology.Id));
	open FILE, ">$output_path/Ontology_Swissprot" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $GO_Id, $Ontology, $level2 ) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $GO_Id\t $Ontology \t $level2 \n";
	}	
	close FILE;
}
sub TrEMBL {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, TrEMBL_function.Id, TrEMBL_function.Protein, TrEMBL_function.Specie, TrEMBL_function.DB FROM matching_prot, TrEMBL_function
		WHERE matching_prot.M5 = TrEMBL_function.M5 ));
	open FILE, ">$output_path/result_TrEMBL" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub TrEMBL_ontology {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, TrEMBL_ontology.GO_Id, GO_ontology.Ontology, TrEMBL_ontology.Ontology FROM matching_prot, TrEMBL_ontology; GO_ontology
		WHERE matching_prot.M5 = TrEMBL_ontology.M5 AND TrEMBL_ontology.GO_Id = GO_ontology.Id));
	open FILE, ">$output_path/Ontology_TrEMBL" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $GO_Id, $Ontology, $level2 ) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $GO_Id\t $Ontology \t level2\n";
	}	
	close FILE;
}

sub GenBank {
	print "Matching NCBI database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, GenBank_function.Id, GenBank_function.Protein, GenBank_function.Specie, GenBank_function.DB FROM matching_prot, GenBank_function
		WHERE matching_prot.M5 = GenBank_function.M5 ));
	open FILE, ">$output_path/result_GenBank" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub GenBank_ref {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, GenBank_ref.Id FROM matching_prot, GenBank_function, GenBank_ref
		WHERE matching_prot.M5 = GenBank_function.M5 AND GenBank_function.Id = GenBank_ref.Id));
	open FILE, ">$output_path/result_GenBank_ref" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $GI_Id) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $GI_Id \n";
	}	
	close FILE;
}
sub RefSeq {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, RefSeq_function.Id, RefSeq_function.Protein, RefSeq_function.Specie, RefSeq_function.DB, RefSeq_function.Start, RefSeq_function.End, RefSeq_function.Strand, RefSeq_function.Contig_ID, RefSeq_function.Info, RefSeq_function.Contig_length FROM matching_prot, RefSeq_function
		WHERE matching_prot.M5 = RefSeq_function.M5 ));
	open FILE, ">$output_path/result_RefSeq" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB, $Start, $End, $Strand, $Contig, $Info, $Contig_length) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \t $Start \t $End \t $Strand \t $Contig \t $Info \t $Contig_length \n";
	}	
	close FILE;
}

sub RefSeq_tax {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, RefSeq_function.Contig_ID, RefSeq_tax.Taxonomy FROM matching_prot, RefSeq_function, RefSeq_tax
		WHERE matching_prot.M5 = RefSeq_function.M5 AND RefSeq_function.Contig_ID = RefSeq_tax.Contig_ID ));
	open FILE, ">$output_path/result_RefSeq_taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Taxonomy) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Taxonomy \n";
	}	
	close FILE;
}
###########################################################################
sub eggNOG {
	print "Matching eggNOG database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, eggNOG_function.Id, eggNOG_function.Protein, eggNOG_function.Specie, eggNOG_function.DB FROM matching_prot, eggNOG_function
		WHERE matching_prot.M5 = eggNOG_function.M5 ));
	open FILE, ">$output_path/result_eggNOG" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub eggNOG_ontology{
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, eggNOG_ontology.Id, Ontologies.Level1, Ontologies.Level2, Ontologies.Level3, eggNOG_ontology.DB FROM matching_prot, eggNOG_ontology, Ontologies
		WHERE matching_prot.M5 = eggNOG_ontology.M5 AND eggNOG_ontology.Id = Ontologies.Id ));
	open FILE, ">$output_path/Ontology_eggNOG" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Level1, $Level2, $Level3, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Level1 \t $Level2 \t $Level3 \t $DB \n";
	}	
	close FILE;
}

sub LSU {
	print "Matching SILVA database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, LSU_function.Id, LSU_function.Protein, LSU_function.Specie, LSU_function.DB FROM matching_prot, LSU_function
		WHERE matching_prot.M5 = LSU_function.M5 ));
	open FILE, ">$output_path/result_LSU" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub LSU_tax {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, LSU_function.Id, LSU_tax.Taxonomy FROM matching_prot, LSU_function, LSU_tax
		WHERE matching_prot.M5 = LSU_function.M5 AND LSU_function.Id = LSU_tax.Id ));
	open FILE, ">$output_path/rRna_LSU_taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Taxonomy) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Taxonomy \n";
	}	
	close FILE;
}

sub SSU {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, SSU_function.Id, SSU_function.Protein, SSU_function.Specie, SSU_function.DB FROM matching_prot, SSU_function
		WHERE matching_prot.M5 = SSU_function.M5 ));
	open FILE, ">$output_path/result_SSU" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub SSU_tax {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, SSU_function.Id, SSU_tax.Taxonomy FROM matching_prot, SSU_function, SSU_tax
		WHERE matching_prot.M5 = SSU_function.M5 AND SSU_function.Id = SSU_tax.Id ));
	open FILE, ">$output_path/rRna_SSU_taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Taxonomy) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Taxonomy \n";
	}	
	close FILE;
}

sub RDP  {
	print "Matching RDP database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, RDP_function.Id, RDP_function.Protein, RDP_function.Specie, RDP_function.DB FROM matching_prot, RDP_function
		WHERE matching_prot.M5 = RDP_function.M5 ));
	open FILE, ">$output_path/result_RDP" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub RDP_tax {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, RDP_function.Id, RDP_tax.Taxonomy FROM matching_prot, RDP_function, RDP_tax
		WHERE matching_prot.M5 = RDP_function.M5 AND RDP_function.Id = RDP_tax.Id ));
	open FILE, ">$output_path/rRna_RDP_taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Taxonomy) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Taxonomy \n";
	}	
	close FILE;
}

sub Greengenes {
	print "Matching Greengenes database\n";
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, Greengenes_function.Id, Greengenes_function.Protein, Greengenes_function.Specie, Greengenes_function.DB FROM matching_prot, Greengenes_function
		WHERE matching_prot.M5 = Greengenes_function.M5 ));
	open FILE, ">$output_path/result_Greengenes" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Protein \t $Specie \t $DB \n";
	}	
	close FILE;
}

sub Greengenes_tax {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, Greengenes_function.Id, Greengenes_tax.Taxonomy FROM matching_prot, Greengenes_function, Greengenes_tax
		WHERE matching_prot.M5 = Greengenes_function.M5 AND Greengenes_function.Id = Greengenes_tax.Id ));
	open FILE, ">$output_path/rRna_Greengenes_taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Id, $Taxonomy) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Id\t $Taxonomy \n";
	}	
	close FILE;
}

sub taxonomy {
	my $result= $dbh -> selectall_arrayref (qq(SELECT matching_prot.*, m5_lca.domain, m5_lca.phylium, m5_lca.class, m5_lca.orders, m5_lca.family, m5_lca.genus, m5_lca.specie, m5_lca.name, m5_lca.level FROM matching_prot, m5_lca
		WHERE matching_prot.M5 = m5_lca.M5_ID ));
	open FILE, ">$output_path/Taxonomy" or die;
	foreach my $I (@$result){
		my ($id, $M5, $Identity, $Evalue, $Bit_score, $Domain, $Phylium, $Class, $Orders, $Family, $Genus, $Specie, $Name, $Level ) = @$I;
		print FILE "$id \t $M5 \t $Identity \t $Evalue \t $Bit_score \t $Domain \t $Phylium \t $Class \t $Orders \t $Family \t $Genus \t $Specie \t $Name \t $Level \n";
	}	
	close FILE;
}

$dbh->disconnect();