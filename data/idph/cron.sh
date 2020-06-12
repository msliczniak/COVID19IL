#!/bin/sh

#http://dph.illinois.gov/sites/default/files/COVID19/il_illinois_zip_codes.json
#http://dph.illinois.gov/sites/default/files/Illinois_County_Geo_ch.json
#https://www.dph.illinois.gov/sites/default/files/
# IL_hospital_regions_map.geojson?nocache=1

o=`/bin/date -j '+%Y %m %d %H:%M:%S-%Z'` || exit
set -- $o
o=-"$1"-"$2"-"$3"-"$4".json

n=''
foo() {
	f=$1$o; shift
	n="$n $f"
	u="$*"
}

h='https://dph.illinois.gov/sitefiles/COVIDHospitalRegions.json?nocache=1'
u='https://dph.illinois.gov/sitefiles/COVIDHistoricalTestResults.json?nocache=1'
for u in hosp\ $h \
  zip\ https://dph.illinois.gov/sitefiles/COVIDZip.json?nocache=1 \
  demo\ https://dph.illinois.gov/sitefiles/CountyDemos.json?nocache=1 \
  tests\ $u; do
	foo $u
	curl -sqL -- "$u" | /usr/bin/tr -d \\r >"$f"
done

/usr/bin/file -- $n
[ -t 0 ] && echo add $n || git add -v -- $n
