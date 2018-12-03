Comandos importantes:

>pg_ctl -D /usr/local/var/postgres start - Inicializar banco
>pg_ctl -D /usr/local/var/postgres stop - Finalizar o banco
>psql -U postgres OSM - Loga na base de dados OSM com o usuário postgres
>\timing on - Liga tempo decorrido de query
>\! clear - Limpa o terminal
>\q - sai do psql console
>WITH uniq AS ( query ) SELECT COUNT(*) FROM uniq; - Conta número de resultados retornados

~> Liechtenstein

PostgreSQL:
- Within:

Liechtenstein:
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(9.5242002 47.1405701)', 4326)::geography,12000);
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(9.5242002 47.1405701)', 4326)::geography,150000);


Colombia:
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-74.14606074859216 4.700912450000001)', 4326)::geography,12000);
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-74.14606074859216 4.700912450000001)', 4326)::geography,150000);

Chile:
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-70.79417391985464 -33.388679249999996)', 4326)::geography,12000);
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-70.79417391985464 -33.388679249999996)', 4326)::geography,150000);

América Central:
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-86.168755740802 12.14039905)', 4326)::geography,12000);
SELECT geom FROM nodes WHERE ST_DWithin(geom::geography, ST_GeomFromText('POINT(-86.168755740802 12.14039905)', 4326)::geography,150000);


- Intersects:

Liechtenstein:
SELECT id,geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	9.5097211464 47.1558570829, 9.5586009272 47.1558570829, 9.5586009272 47.2109385806, 9.5097211464 47.2109385806, 9.5097211464 47.1558570829))', 4326), geom);
SELECT * FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	9.5149710667 47.0677944389, 9.6101685966 47.0677944389, 9.6101685966 47.1863339559, 9.5149710667 47.1863339559, 9.5149710667 47.0677944389))', 4326), geom); 

Colombia:
SELECT id,geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-75.7982040942 5.065987494, -74.0512200777 5.065987494, -74.0512200777 5.9344189261, -75.7982040942 5.9344189261, -75.7982040942 5.065987494))', 4326), geom);
SELECT geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-70.3089756734 0.1977504152, -77.112947051 0.3251876786, -76.9896768915 6.8899403949, -70.1857055139 6.7634053088, -70.3089756734 0.1977504152))', 4326), geom); 

Chile:
SELECT geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-71.8031632681 -34.3363776491, -70.9475924911 -34.3363776491, -70.9475924911 -33.4103920585, -71.8031632681 -33.4103920585, -71.8031632681 -34.3363776491))', 4326), geom);
SELECT geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-71.6656992185 -34.1696728485, -70.7209357329 -34.1696728485, -70.7209357329 -29.3731005996, -71.6656992185 -29.3731005996, -71.6656992185 -34.1696728485))', 4326), geom);

América Central:
SELECT geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-87.5763703779 12.8054935579, -85.0535470532 12.8054935579, -85.0535470532 15.5611151014, -87.5763703779 15.5611151014, -87.5763703779 12.8054935579))', 4326), geom);
SELECT geom FROM nodes  WHERE  ST_Intersects(ST_GeomFromText('POLYGON((	-89.0083365836 13.2433273728, -83.6675302742 13.2433273728, -83.6675302742 15.6250254777, -89.0083365836 15.6250254777, -89.0083365836 13.2433273728))', 4326), geom);

- Near:

Liechtenstein:
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography, 12000) order by ST_Distance(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography);
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography, 150000) order by ST_Distance(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography);

Colombia:
select geom,  from nodes where ST_DWithin(geom::geography, ST_MakePoint(-74.14606074859216, 4.700912450000001)::geography, 12000) order by ST_Distance(geom::geography, ST_MakePoint(-74.14606074859216, 4.700912450000001)::geography);
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(-74.14606074859216, 4.700912450000001)::geography, 150000) order by ST_Distance(geom::geography, ST_MakePoint(-74.14606074859216, 4.700912450000001)::geography);


Chile:
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(-70.79417391985464, -33.388679249999996)::geography, 12000) order by ST_Distance(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography);
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(-70.79417391985464, -33.388679249999996)::geography, 150000) order by ST_Distance(geom::geography, ST_MakePoint(9.5242002, 47.1405701)::geography);

América Central:
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(-86.168755740802, 12.14039905)::geography, 12000) order by ST_Distance(geom::geography, ST_MakePoint(-86.168755740802, 12.14039905)::geography);
select geom from nodes where ST_DWithin(geom::geography, ST_MakePoint(-86.168755740802, 12.14039905)::geography, 150000) order by ST_Distance(geom::geography, ST_MakePoint(-86.168755740802, 12.14039905)::geography);



