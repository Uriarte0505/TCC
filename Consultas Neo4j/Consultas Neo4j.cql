Comandos importantes:

>Neo4j console - Inicializar banco
>cypher-shell - Abre o shell para executar consultas cypher

Neo4j:
- Within:

Liechtenstein:
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',{longitude:9.5242002,latitude:47.1405701},12);
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',{longitude:9.5242002,latitude:47.1405701},150);

Colombia:
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',{longitude:-74.14606074859216,latitude:4.700912450000001},12);
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',{longitude:-74.14606074859216,latitude:4.700912450000001},150);

- Intersects:

Liechtenstein:
WITH 'POLYGON((	9.5097211464 47.1558570829, 9.5586009272 47.1558570829, 9.5586009272 47.2109385806, 9.5097211464 47.2109385806, 9.5097211464 47.1558570829))' as polygon CALL spatial.intersects('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',polygon) YIELD node RETURN node;
WITH 'POLYGON((	9.5149710667 47.0677944389, 9.6101685966 47.0677944389, 9.6101685966 47.1863339559, 9.5149710667 47.1863339559, 9.5149710667 47.0677944389))' as polygon CALL spatial.intersects('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',polygon) YIELD node RETURN node;

Colombia:
WITH 'POLYGON((	-75.7982040942 5.065987494, -74.0512200777 5.065987494, -74.0512200777 5.9344189261, -75.7982040942 5.9344189261, -75.7982040942 5.065987494))' as polygon CALL spatial.intersects('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',polygon) YIELD node RETURN node;
WITH 'POLYGON((	-70.3089756734 0.1977504152, -77.112947051 0.3251876786, -76.9896768915 6.8899403949, -70.1857055139 6.7634053088, -70.3089756734 0.1977504152))' as polygon CALL spatial.intersects('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',polygon) YIELD node RETURN node;


- Near:

Liechtenstein:
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',{longitude:9.5242002,latitude:47.1405701},12);
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/liechtenstein-latest.osm',{longitude:9.5242002,latitude:47.1405701},150);

Colombia:
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',{longitude:-74.14606074859216,latitude:4.700912450000001},12);
CALL spatial.withinDistance('/Users/Uriarte/Downloads/mongosm-master/colombia-latest.osm',{longitude:-74.14606074859216,latitude:4.700912450000001},150);





