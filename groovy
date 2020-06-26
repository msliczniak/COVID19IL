#!/bin/sh

# filter problematic data
awk 'NR == 1 {
	o = -$1 + 1; t = $4;
	print t, $1 + o; next
}

{
	t = $4 - t
	if (t > 0) print $4, $1 + o, t
	t = $4
}' dday | sort -n -k1 -k3 | awk '$2 > t { print; t = $2 }' >foo

# correct problematic data
awk '$1 < -59 { t = $4; next }
{
	t = $4 - t
	if (t > 0) {
		tot[$1] = $4
		daily[$1] = t

		t = $4
		next
	}

	for (i = -59; i < $1; i++) tot[i] += t

	t = $4
}

END {
	for (i = -59; i < 1; i++) {
		if (t <= 0) continue

		print tot[i], i + 60, daily[i]
	}
}' dday >bar

/bin/rm -f bl.png br.png || exit
gnuplot -c "$0"plot "$@" || exit
exec convert bl.png br.png +append +repage b.png

# for i in AZ IL CA NY FL;do ./run $i *-US.csv;../../groovy;mv b.png $i.png;done
