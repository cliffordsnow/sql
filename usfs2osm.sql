select 
case
  when name ~ '^[0-9]+[A-Z]*' then concat('National Forest Service Road ',name)
  else name
  end as name,
case
  when operationa like '3 %' then 'unclassified'
  when operationa like '4 %' then 'unclassified'
  when operationa like '5 %' then 'unclassified'
  when operationa like '2 %' then 'track'
  end as highway,
case
  when seasonal = 'seasonal' then 'yes'
  end as seasonal,
case
  when surfacetyp like 'AGG %' then 'gravel'
  when surfacetyp like 'BST %' then 'paved'
  when surfacetyp like 'AC %' then 'asphalt'
  when surfacetyp like 'NAT %' then 'ground'
  when surfacetyp like 'PCC %' then 'concrete'
  when surfacetyp like 'P %' then 'paved' 
  when surfacetyp like 'IMP %' then 'ground'
  end as surface,
geom
from usfs_wa_roads where operationa not like '1 %';
