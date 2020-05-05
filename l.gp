# can't use load with OSX's readline
#
# http://head-lights.blogspot.com/
# 2013/09/gnuplot-mountain-lion-and-malloc-errors.html
#
# https://sourceforge.net/p/gnuplot/bugs/2115/#c101/8602

xlabel_t = 'day doubling-time'
y2label_t = 'doubling-time (days)'
lifetime_t = 'lifetime'
trend_t = '7sample(\~wk)'
daily_t = 'daily increase'
wkago_t = '\~wk ago'
yr_t = 'y'

set xtics rangelimited rotate by -55 format '%1m/%1d'
set y2label y2label_t offset -3,5
