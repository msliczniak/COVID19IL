#!/bin/sh
awk '{ if ($1 > -61) print $4, $1 + 70 }' dday > foo60
awk '{ if ($1 > -61) print $4, $4 - t; t = $4 }' dday > bar60
awk 'NR == 1 { o = -$1 + 1 } { print $4, $1 + o }' dday > foo
awk 'NR != 1 { print $4, $4 - t } { t = $4 }' dday > bar
exec gnuplot -c "$0"plot
# for i in AZ IL CA NY FL;do ./run $i *-US.csv;../../groovy;mv b.png $i.png;done
