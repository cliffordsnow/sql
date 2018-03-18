CREATE OR REPLACE FUNCTION get_editor(e varchar) RETURNS varchar as $$
    BEGIN
         CASE 
	    WHEN e ILIKE 'iD%' THEN RETURN 'iD';
	    WHEN e ILIKE 'JOSM%' THEN RETURN 'JOSM';
	    WHEN e ILIKE 'reverter;JOSM%' THEN RETURN 'JOSM';
	    WHEN e ILIKE 'OsmAnd%' THEN RETURN 'OsmAnd';
	    WHEN e ILIKE 'MAPS.ME%' THEN RETURN 'MAPS.ME';
	    WHEN e ILIKE 'Potlatch%' THEN RETURN 'Potlatch';
	    WHEN e ILIKE 'Pushpin%' THEN RETURN 'Pushpin';
	    WHEN e ILIKE 'rosemary%' THEN RETURN 'Rosemary';
	    WHEN e ILIKE 'Services_OpenStreetMap%' THEN RETURN 'Services_OpenStreetMap';
	    WHEN e ILIKE 'SC_extra%' THEN RETURN 'SC_extra';
	    WHEN e ILIKE 'Citypedia%' THEN RETURN 'Citypedia';
	    WHEN e ILIKE 'POI%' THEN RETURN 'POI+';
	    WHEN e ILIKE 'ArcGIS%' THEN RETURN 'ArcGIS Editor for OSM';
	    WHEN e ILIKE 'gnome-maps%' THEN RETURN 'Gnome-Maps';
	    WHEN e ILIKE 'Go Map%' THEN RETURN 'GoMap!!';
	    WHEN e ILIKE 'Data4All%' THEN RETURN 'Data4All';
	    WHEN e ILIKE 'Dutch%' THEN RETURN 'Dutch';
	    WHEN e ILIKE 'StreetComplete%' THEN RETURN 'StreetComplete';
	    WHEN e ILIKE 'Vespucci%' THEN RETURN 'Vespucci';
	    WHEN e ILIKE 'Level0%' THEN RETURN 'Level0';
	    WHEN e ILIKE 'PythonOsmApi%' THEN RETURN 'PythonOsmApi';
	    WHEN e ILIKE 'Merkaartor%' THEN RETURN 'Merkaartor';
	    WHEN e ILIKE 'Route4u%' THEN RETURN 'Route4u';
	    WHEN e ILIKE 'FireYak%' THEN RETURN 'FireYak';
	    WHEN e ILIKE 'Osmose%' THEN RETURN 'Osmose_Editor';
	    WHEN e ILIKE 'OsmHydrant%' THEN RETURN 'OsmHydrant';
	    WHEN e ILIKE 'IsraelHiking%' THEN RETURN 'IsraelHiking';
	    ELSE RETURN 'Other';
        END CASE;
    END;
$$
language plpgsql;
	
	
