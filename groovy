#!/bin/sh
#awk '{ if ($1 > -61) print $1 + 70, $4 }' dday > foo
#awk '{ if ($1 > -61) print $4 - t, $4; t = $4 }' dday > bar
awk 'NR == 1 { o = -$1 + 1 } { print $1 + o, $4 }' dday > foo
awk 'NR != 1 { print $4 - t, $4 } { t = $4 }' dday > bar
exec gnuplot -c "$0"plot
