#!/bin/sh

./get
./run 2*-???.csv 
exec /bin/mv -- *-*.png ratio.png tested.png ../../plots/pl/
