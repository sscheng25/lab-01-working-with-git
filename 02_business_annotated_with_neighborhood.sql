/*
  Create a query that returns all of the business in Philadelphia along with
  the name of the neighborhood the business is in.

  Hint: You can use ST_Contains to determine whether one geometry lies within
  another:https://postgis.net/docs/ST_Contains.html
*/

select lic.objectid ,lic.address,lic.licensenum, lic.licensetyp, nbh.name as neighborhood_name
from business_licenses as lic
left join neighborhoods_philadelphia as nbh
on st_contains(nbh.the_geom, lic.the_geom) = true
where lic.the_geom is not null
