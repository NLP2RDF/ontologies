#!/bin/sh
#clean
mvn clean 

# update owl files:
for f in `find . -name "*.ttl" | grep -v previous | grep -v format | grep -v misc `
	do 
		FILE=$(echo $f | sed 's/.ttl$//')
		rapper -i turtle -o rdfxml-abbrev $f >  $FILE".owl" 
	done

# sync run
rsync -rav --delete nif-core/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/nif-core/
rsync -rav --delete rlog/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/rlog 
rsync -rav --delete testcase/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/testcase 
rsync -rav --delete vm nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/
rsync -rav --delete pom.xml nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies
rsync -rav --delete dev/misc/resources.ttl nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/dev/misc/resources.ttl
rsync -rav .htaccess nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies

#docu
ONTO="nif-core/nif-core.owl nif-core/nif-stanbol.owl rlog/rlog.owl testcase/stc.owl vm/dep/stanford.owl vm/lexo/lexo.owl"
for doc in $ONTO
	do 
		curl "http://www.essepuntato.it/lode/http://persistence.uni-leipzig.org/nlp2rdf/ontologies/""$doc" > /tmp/docu.html
		if [ -s /tmp/docu.html ]
		then
		  cp /tmp/docu.html "$doc"
		fi
	done
exit




# sync run
rsync -rav --delete nif-core/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/nif-core
rsync -rav --delete rlog/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/rlog 
rsync -rav --delete testcase/ nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/testcase 
rsync -rav --delete vm nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies/
rsync -rav --delete pom.xml nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies
rsync -rav .htaccess nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/ontologies 

curl -I  http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"
curl -I -H "Accept: application/rdf+xml " http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"
curl -I -H "Accept: text/html " http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core | grep -E "(303|Location)"

mvn deploy

#push any changes
#git push server


