#!/bin/bash
counter=0
for i in `cat hack_list`
do
	NAME=$(echo $i | rev | cut -f2 -d\/ | rev)
	echo "Going for $NAME"
	url=$(echo $i)
	content=$(curl -s -k $i | xmllint --html --xpath "//article//text()" - 2> /dev/null)
	./populatingMapping $url $content $counter
	counter=$((counter+1))
done
