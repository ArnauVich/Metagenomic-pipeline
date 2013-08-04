#!/usr/bin/perl

open FILE,'<', "./Hits_databases/Ids" or die "No Input";
while (my $line=<FILE>){
	chomp ($line);
	$id=$line;
	push @IDs, $id;
	#$total_ID{$key} = 1;

}
close FILE;
#print "$_\n" for keys %total_ID;

@hits= ("result_GenBank", "result_KEGG", "result_IMG", "result_PATRIC", "result_PHANTOME", "result_Interpro", "result_RefSeq", "result_SEED", "result_Swissprot", "result_TrEMBL", "result_Greengenes", "result_eggNOG", "result_LSU", "result_SSU", "result_RDP");


foreach $hit (@hits){
if ( -e "./Hits_databases/$hit" ){
	print "Yes, $hit exist!!!! \n";
	open FILE,'<', "./Hits_databases/$hit" or die "Error Importing $hit";
	while (my $line=<FILE>){
		chomp ($line);
		my($ClustId, $M5, $Identity, $Evalue, $Bit_score, $Id, $Protein, $Specie, $DB ) = split /\t/g, $line; 
		$ClustId =~ s/(\d+).*$/$1/ ;
		#print $ClustId;
		$hash{$ClustId}=$DB;
		$DB_hits{$ClustId}{$DB}=1;
	}
	close FILE;
}
}


open FILE, ">./Hits_databases/graphic_ids" or die;
print FILE "$_ \t$hash{$_}\n" foreach (keys%hash);
foreach $Id (@IDs){
	if (not exists $hash{$Id}) {
   		print FILE "$Id\tNO_MACHING\n";
   		next;
  }
}
close FILE;
#@hashes= ("%GenBank", "%KEEG", "%IMG", "%PATRIC", "%PHANTOME", "%Interpro", "%RefSeq", "%SEED", "%Swissprot", "%TrEMBL");

#print "%GenBank";
open FILE, ">./Hits_databases/graphic_db_ids" or die;
foreach my $key (keys %DB_hits) {
   #print "Key: $key";
   foreach ( keys %{$DB_hits{$key}}){
   	print FILE "$key\t$_\n";
   }
}
foreach $id (@IDs){
	print FILE "$id\tTotal\n"
}
