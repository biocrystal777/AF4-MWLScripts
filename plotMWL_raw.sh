#usr/bin/bash

SKRIPTDIR=`dirname $0`
FILE1=$1
#echo "$FILE1"
FILE1OUT=$(echo "$FILE1" | sed 's/.csv/\.dat/')
#echo $FILE1OUT
perl $SKRIPTDIR/formatForGnuplotTimeRaw.pl $FILE1 $FILE1OUT
gnuplot -c $SKRIPTDIR/MWLTimeRawGnuplot.gnpl $FILE1OUT
rm $FILE1OUT
