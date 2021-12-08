SELECT u.user_name, u.created_at, c.tags->'ideditor:walkthrough_progress' 
	FROM osm_user u, osm_changeset c 
	WHERE c.user_id = u.user_id AND u.created_at > '2019-01-01' AND tags->'changesets_count' = '1'  AND tags->'ideditor:walkthrough_started' = 'yes';

