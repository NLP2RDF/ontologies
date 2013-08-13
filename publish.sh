
# update owl files:
for f in `find . -name "*.ttl" | grep -v previous | grep -v format`
	do 
		FILE=$(echo $f | sed 's/.ttl$//')
		rapper -i turtle -o rdfxml-abbrev $f >  $FILE".owl" 
	done

# sync run
rsync -rav * nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies 
rsync -rav .htaccess nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies 

#docu
curl http://www.essepuntato.it/lode/http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.owl > nif-core/nif-core.html

# sync run
rsync -rav * nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies 
rsync -rav .htaccess nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies 

curl -I  http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"
curl -I -H "Accept: application/rdf+xml " http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"
curl -I -H "Accept: text/html " http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"

#push any changes
#git push server


