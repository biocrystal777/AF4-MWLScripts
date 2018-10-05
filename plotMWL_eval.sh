#usr/bin/bash

SKRIPTDIR=`dirname $0`
FILE1=$1
function plotTime() {
FILE1OUTTIME=$(echo "$FILE1" | sed 's/.csv/_time\.dat/')
perl $SKRIPTDIR/formatForGnuplotTimeEval.pl $FILE1 $FILE1OUTTIME
gnuplot -c $SKRIPTDIR/MWLTimeGnuplot.gnpl $FILE1OUTTIME
rm $FILE1OUTTIME
}
#
function plotDiff() {
FILE1OUTDIFF=$(echo "$FILE1" | sed 's/.csv/_diff\.dat/')
perl $SKRIPTDIR/formatForGnuplotDiffEval.pl $FILE1 $FILE1OUTDIFF
gnuplot -c $SKRIPTDIR/MWLDiffGnuplot.gnpl $FILE1OUTDIFF
rm $FILE1OUTDIFF
}
#
function plotRh() {
FILE1OUTRH=$(echo "$FILE1" | sed 's/.csv/_Rh\.dat/')
perl $SKRIPTDIR/formatForGnuplotRhEval.pl $FILE1 $FILE1OUTRH
gnuplot -c $SKRIPTDIR/MWLRhGnuplot.gnpl $FILE1OUTRH
rm $FILE1OUTRH
}

plotTime &
plotDiff &
plotRh  &
wait
