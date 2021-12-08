-- this counts 2019 results
SELECT tutorial, COUNT(*) 
	FROM (SELECT UNNEST(STRING_TO_ARRAY(tags->'ideditor:walkthrough_progress',';')) AS tutorial 
		FROM osm_changeset where created_at > '2019-01-01' AND tags->'changesets_count' = '1' AND tags->'ideditor:walkthrough_started' = 'yes') AS tutorial 
	GROUP BY tutorial;

