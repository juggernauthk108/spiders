#!/bin/bash




for i in `cat links`
do
	NAME=$(echo $i | rev | cut -f2 -d\/ | rev)
	echo "Going for $NAME"
	curl -s -k -L $i | xmllint --html --xpath "//div[@id='post']//text()" - 2> /dev/null > output/$NAME
done
