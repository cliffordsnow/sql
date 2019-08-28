drop table if exists split_parkings;
create table split_parkings as (
with
        input as (
        select
            ref  as poly_id,

            geom as geom
        from

            juno_areas
        where type = 'airport_parking_lot'
    ),
        unlabeled_cloud as (
        select
            poly_id,
            geom,
            (ST_Dump(ST_GeneratePoints(geom, 1000))).geom pt,
            (ST_Area(geom) / 1000) :: int                  k
        from input
        group by 1, 2
        order by geom
    ),
        labeled_cloud as (
        select
            poly_id,
            pt,
            ST_ClusterKMeans(pt, k)
            over (
                partition by poly_id
                ) cluster_id
        from
            unlabeled_cloud
    ),
        labeled_centers as (
        select
            poly_id,
            cluster_id,
            ST_Centroid(ST_Collect(pt)) center
        from labeled_cloud
        group by poly_id, cluster_id),
        voronoi_poly as (
        select
            poly_id,
            (ST_Dump(ST_VoronoiPolygons(ST_Collect(center)))).geom
        from labeled_centers
        group by poly_id
    )
select v.poly_id, ST_Intersection(v.geom, i.geom)
from voronoi_poly v join input i on i.poly_id = v.poly_id);
