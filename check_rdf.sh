#!/bin/sh
# update owl files:
for f in `find . -name "*.ttl" | grep -v previous | grep -v format`
	do 
		FILE=$(echo $f | sed 's/.ttl$//')
		rapper -i turtle -o rdfxml-abbrev $f > /dev/null
	done
