#!/bin/sh

./get
./run report-*.csv
exec /bin/mv -- *-*.png ../../plots/kane/
