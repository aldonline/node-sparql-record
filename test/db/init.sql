grant all privileges to "SPARQL";
sparql clear graph <http://test.com/id/graph> ;
ttlp_mt_local_file('test-data.ttl', '', 'http://test.com/id/graph' ) ;