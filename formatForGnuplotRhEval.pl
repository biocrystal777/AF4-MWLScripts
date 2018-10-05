#/usr/bin/perl

use strict;
use warnings;

my $inFileName   = $ARGV[0];
my $outFileName  = $ARGV[1];
print "Make temporary file $outFileName.\n";
#my $inFileName = './MatAnalytik_AuSeeds_LeJe_VC1_5_MWL_meas1_utf8.csv';
#my $outFileName = './MatAnalytik_AuSeeds_LeJe_VC1_5_MWL_meas1_gnplFormat.csv';

open(my $inFile, '< :encoding(UTF-8)' ,$inFileName)
    or die "'$inFileName' does not exist'";

my @lines;

while (my $line = <$inFile>) {
   chomp $line;
   push @lines, $line;
}
close($inFile);
    
my $lineCount = @lines;
my $xLength = $lineCount - 1;


my @yAxis = split(',', $lines[0]);
shift(@yAxis); # shift once for removing time domain in axis
shift(@yAxis); # shift once for removing D domain in axis
shift(@yAxis); # shift once for removing Rh domain in axis
my $yLength = @yAxis;
shift(@lines);

open(my $outFile, '> :encoding(UTF-8)' ,$outFileName);

 #   print $outFile "AAAAAAAAA\n";

for(my $i=0; $i < $xLength; $i++){    
    my @cuLine = split(',', $lines[$i]); # get i-th line
    shift(@cuLine);            # remove t
    shift(@cuLine);            # remove D
    my $cuX =  shift(@cuLine); # take Rh as current x and shift once
    for(my $j=0; $j < $yLength ; ++$j){ 
        print $outFile "$cuX $yAxis[$j] $cuLine[$j]\n";
    }    
}
close($outFile);
