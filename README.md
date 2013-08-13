ontologies
==========
All ontologies used in NIF 2.0 (NIF-Core + vocabulary modules )

# Overview
## What is NIF and NIF 2.0?
The NLP Interchange Format (NIF) is an RDF/OWL-based format that aims to achieve interoperability between Natural Language Processing (NLP) tools, language resources and annotations. 
NIF 2.0 is a set of resources which constitute a major, not backward-compatible improvement upon the previous version NIF 1.0.  
NIF consists of specifications, ontologies and software, which are combined under the version identifier "2.0", but in fact are versioned individually. 

## Versioning, License and Persistence 
see TODO

## More information can be found:
* At the NLP2RDF Project page: http://nlp2rdf.org
* At the GitHub page: https://github.com/NLP2RDF 

## Feedback
Please use the mailing list or the GitHub issue tracker:
https://github.com/NLP2RDF/ontologies/issues

# Editing this Repository

## Namespaces are collected here:
* http://prefix.cc/nif
* http://prefix.cc/rlog

## Editing ontologies:

### '\#' vs. '/' URIs
There has been an ongoing debate about '\#' vs. '/' . We focus on ontologies with '\#' here with URIs like:
http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#String 
Note that ontologies with '/' URIs need to published differently (partly discussed here: http://lists.w3.org/Archives/Public/semantic-web/2013Apr/0157.html). 

### Workflow for '\#' ontologies in this repository
1. All ontologies are edited in Turtle syntax with the Geany text editor or any other Turtle editor e.g. http://aksw.org/Projects/Xturtle.html), and include developers' comments using "#" directly in the source, see e.g. nif-core/nif-core.ttl
2. A script called _publish.sh_ does the following:
  * Convert all turtle files to rdfxml (nif-core/nif-core.owl)  using rapper(http://librdf.org/raptor/rapper.html)
  * sync it to the staging server http://persistence.uni-leipzig.de/nlp2rdf/ontologies
  * HTML documentation is created with http://www.essepuntato.it/lode/http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core/nif-core.owl
  * sync it to the staging server again http://persistence.uni-leipzig.de/nlp2rdf
3. Then we use git to commit and push the changes to GitHub
4. see the .htaccess for redirect rules


