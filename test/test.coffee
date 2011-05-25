assert = require 'assert'
sparql = require 'sparql'
sparql_record = require '../lib/sparql-record'

Email = sparql_record.Email
Field = sparql_record.Field

client = new sparql.Client 'http://localhost:8898/sparql'
client.log_query = yes
client.prefix_map = 
  id : 'http://test.com/id/'
  foaf : 'http://xmlns.com/foaf/0.1/'

person_fields = 
  name:
    new Field p: 'foaf:name', c: [0,1]
  email:
    new Field p: 'foaf:mbox', t: Email, c: [0,1]


sparql_record.load_record client, 'id:graph', 'id:aldo', person_fields, (err, res) ->
  console.log [err, res]
  assert.equal 'Aldo Bucchi', res.name


