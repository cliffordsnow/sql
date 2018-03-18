select s.*
from starbucks s
left join starbucks_view o on st_dwithin(o.way::geography,s.geom::geography, 50)
where o.osm_id is null
and country_subdivision = 'WA';
