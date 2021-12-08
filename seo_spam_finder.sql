SELECT id, user_name,tags 
	FROM osm_changeset 
	WHERE created_at > '2019-10-01' AND tags->'created_by' LIKE 'iD%' AND tags->'changesets_count' = '1' AND tags->'comment' not ILIKE '%#missingmaps%' AND tags->'comment' NOT ILIKE '%#hotosm%' AND tags->'locale' = 'en-US' AND LENGTH(tags->'comment') > 180 AND NOT tags?'ideditor:walkthrough_started' AND tags->'imagery_used' = 'Bing aerial imagery' AND num_changes = 1;

