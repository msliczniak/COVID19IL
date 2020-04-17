# can't use load with OSX's readline
#
# http://head-lights.blogspot.com/
# 2013/09/gnuplot-mountain-lion-and-malloc-errors.html
#
# https://sourceforge.net/p/gnuplot/bugs/2115/#c101/8602

set xtics rangelimited rotate by -55 format '%1m/%1d'
set xlabel ARG3.' day doubling-time'
set y2label 'doubling-time (days)'

