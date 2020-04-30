# can't use load with OSX's readline
#
# http://head-lights.blogspot.com/
# 2013/09/gnuplot-mountain-lion-and-malloc-errors.html
#
# https://sourceforge.net/p/gnuplot/bugs/2115/#c101/8602

xlabel_t = ' day doubling-time'
lifetime_t = 'lifetime ='
trend_t = '7 sample ='

set xtics rangelimited rotate by -55 format '%1m/%1d'
set y2label 'doubling-time (days)'

