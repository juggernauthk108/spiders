#!/bin/bash
>links
>/tmp/page

URL="https://hackso.me/"
echo $URL
#Crawl the first page

for i in `seq 1 3`
do

	curl -s -k -L $URL | xmllint --html --xpath "(//header/h1/a)[$i]/@href" - 
	echo

done > links

echo "FIRST PAGE CRAWLED"

#Crawl the pagination

for i in `seq 2 21`
do
	
	echo -n "Going for PAGE: $i"
	curl -s -k -L  https://hackso.me/$i > /tmp/page
	echo -n " - "
	for j in `seq 1 3`
	do
		echo -n "$i.$j"
		cat /tmp/page | xmllint --html --xpath "(//header/h1/a)[$j]/@href" - 
		echo
	done | tee -a links
	echo
done

