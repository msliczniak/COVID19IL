#!/bin/sh

mkdir -p ../../plots/us
./get || exit

wh='width="1640" height="440" border="0" hspace="0" vspace="0" src="%s">'
bg=''
r=1

echo '<p>' >index || exit
echo '<html>
<head><title>COVID19US</title><head>
<body style="background-color:white;">' >html || exit

foo() {
	printf '<a'"$2"' name="C%s" name="C%s" href="#%s">%s</a>\n' $1 $1 $1 $1
}

#for i in .. FL LA IL MI NY OH WA
for i in .. `awk -F, 'NR == 1 { next } { print $2 }' daily.csv | sort | uniq`
do
	case "$i" in
	  ..)
		j=US
		;;
	  *)
		j="$i"
		;;
	esac

	/bin/rm -f -- "$j"-*.png || exit
	./run "$i" 20*-US.csv
	i="$j"

	set -- "$i"-*.png
	/bin/mv -- "$@" ../../plots/us/ || continue
	r=0

	case "$bg" in
	  '')
		bg=' style="background-color:#faf0e6;"'
		;;
	  *)
		bg=''
		;;
	esac

	foo "$i" "$bg" >>html

	printf '<a name="%s" id="%s" href="#C%s">' $i $i $i >>index

	for j in "$@"; do
		case "$j" in
		  *_g.png)
			printf '<img'"$bg $wh" "$j" >>index
			continue
			;;
		esac

		printf '<img title="%s"'"$bg $wh" "`/bin/cat "$j".txt`" "$j"\
		  >>index
		/bin/rm -f "$j".txt
	done

	printf '</a>' >>index

done

case $r in
  0)
	;;
  *)
	echo 'no images' >&2
	exit $r
	;;
esac

echo '
</body>
</html>' | /bin/cat html index - >../../plots/us/index.html || exit

[ -t 0 ] &&\
 echo 'add ../../plots/us/??-*.png' ||\
 git add -v ../../plots/us/??-*.png
