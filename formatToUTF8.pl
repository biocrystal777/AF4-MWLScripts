#/usr/bin/perl

use strict;
use warnings;

my $inFileName   = $ARGV[0];
my $outFileName  = substr($inFileName,0,length($inFileName)-4)."_utf8.csv";
#print $outFileName."\n";

open(my $inFile, '< :encoding(UTF-16)' ,$inFileName)
    or die "'$inFileName' does not exist'";

my @lines;
my $lc=0;
while (my $line = <$inFile>) {
    chomp $line;
    push @lines, $line;
    $lc++;
}
close($inFile);

open(my $outFile, '> :encoding(UTF-8)' ,$outFileName);

for(my $i=0; $i < $lc; ++$i){
    print $outFile "$lines[$i]\n";
}
close($outFile)   
