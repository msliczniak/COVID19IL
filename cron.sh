#!/bin/sh

./get
./run COVID19CountyResults-*-???.json
exec /bin/mv -- *-*.png ratio.png plots/
