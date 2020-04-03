#!/bin/sh

EXPR=/bin/expr
DIRNAME=/usr/bin/dirname
#UNAME=/usr/bin/uname

#SYSTEM=`$UNAME -s`
#PROC=`$UNAME -p`

#GNUPLOT=/opt/sfw/bin/gnuplot
#GNUPLOT=$HOME/$SYSTEM/$PROC/usr/local/bin/gnuplot
#GNUPLOT=/usr/local/bin/gnuplot
GNUPLOT=/opt/local/bin/gnuplot

dirname=`$DIRNAME $0`

GPLOT="$dirname/gplot"
AWKPLOT="$dirname/awkplot"

gopt="-persist"

while [ $OPTIND -le $# ]
do
	while getopts ":d:" opt
	do
		if [ "$opt" = "d" ] 
		then
			unset gopt
			break 2
		fi
	done

	OPTIND=`$EXPR $OPTIND + 1`
done

$GPLOT "$@" | $AWKPLOT | $GNUPLOT $gopt
