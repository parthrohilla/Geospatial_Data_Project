-- Example query (PostgreSQL)
create extension POSTGIS;


-- Create Table
CREATE TABLE MAPS (name varchar, geom geometry);

INSERT INTO MAPS  VALUES 
('Home', 'POINT(-118.2879257 34.0298569)'),
('Masters of Arts in teaching program.', 'POINT(-118.2839276 34.021956)'),
('Pullias center for higher education', 'POINT(-118.2838932 34.0219688)'),
('lusk center for real estate', 'POINT(-118.283314 34.0191729)'),
('School of public policy center on philanthropy and public policy', 'POINT(-118.2837324 34.0209621)'),
('USC dornslife Department of military science', 'POINT(-118.2867696 34.0212354)'),
('USC school of dornslife Department of earth sciences', 'POINT(-118.2861611 34.0195088)'),
('Marshall school of business Leventhal school of accounting', 'POINT(-118.2856953 34.01919)'),
('Marshall school of business Department of data sciences and operations', 'POINT(-118.2859271 34.0187576)'),
('USC annenberg School of communication', 'POINT(-118.2864793 34.0220057)'),
('USC annenberg School of Journalism', 'POINT(-118.2864141 34.0220888)'),
('School of Engineering Department of chemical engineering and material science', 'POINT(-118.2882543 34.0200496)'),
('School of engineering Department of electrical engineering', 'POINT(-118.288083 34.0204276)');

-- Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM MAPS;

SELECT distinct(name), ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.2879257 34.0298569)') as distance
FROM Maps
WHERE name<>'Home' 
ORDER BY ST_Distance(geom,'POINT(-118.2879257 34.0298569)')
limit 4;