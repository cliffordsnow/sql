drop view hotosm;
create view hotosm as
select id, user_id, unnest(regexp_matches(tags->'comment','\d\d\d\d')) as projectno from osm_changeset where tags->'comment' ilike '%#TanzaniaDevelopmentTrust%';


select projectno, count(*) from hotosm group by projectno order by projectno;

select distinct  u.user_name, u.created_at as first_edit from hotosm h, osm_user u where u.user_id = h.user_id and u.created_at > '2016-04-17';

select count(*) from (select distinct h.user_id, u.user_name from hotosm h, osm_user u where u.user_id = h.user_id and u.created_at > '2016-04-17') as foo;

select u.user_name, count(*) from hotosm h, osm_user u where u.user_id = h.user_id and u.created_at > '2016-04-17' group by u.user_name ordery by u.user_name;





