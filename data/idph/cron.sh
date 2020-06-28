#!/bin/sh

#http://dph.illinois.gov/sites/default/files/COVID19/il_illinois_zip_codes.json
#http://dph.illinois.gov/sites/default/files/Illinois_County_Geo_ch.json
#https://www.dph.illinois.gov/sites/default/files/
# IL_hospital_regions_map.geojson?nocache=1
#http://www.dph.illinois.gov/sitefiles/CountyList.json?nocache=1
#http://www.dph.illinois.gov/sites/default/files/
# Illinois_County_Geo_ch.json?nocache=true

o=`/bin/date -j '+%Y %m %d %H:%M:%S-%Z'` || exit
set -- $o
o=-"$1"-"$2"-"$3"-"$4".json

n=''
foo() {
	f=$1$o; shift
	n="$n $f"
	u="$h""$*"'.json?nocache=1'
}

h='https://dph.illinois.gov/sitefiles/'
for u in hosp\ COVIDHospitalRegions zip\ COVIDZip demo\ CountyDemos \
  risk\ COVIDCountyRiskMetrics synd\ COVIDSyndromic \
  tests\ COVIDHistoricalTestResults; do
	foo $u
	curl -sqL -- "$u" | /usr/bin/tr -d \\r >"$f"
	#echo "$u" "$f"
done

#echo "$n"
#exit

/usr/bin/file -- $n
[ -t 0 ] && echo "add *$o" || git add -v -- $n
