#!/bin/bash
for i in `cat hack_list`:
do
	NAME=$(echo $i | rev | cut -f2 -d\/ | rev)
	echo "Going for $NAME"
	curl -s -k $i | xmllint --html --xpath "//article//text()" - 2> /dev/null > output/$NAME
done
