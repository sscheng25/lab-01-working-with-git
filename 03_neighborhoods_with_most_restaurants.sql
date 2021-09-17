/*
  What are the 5 neighborhoods with the most restaurants?

  Let's assume that a business is a resaurant if it has a licensetype that
  starts with 'Food Preparing and Serving'.

  Hint: It may help to use the business_annotated_with_neighborhood query as a
  CTE.
*/

with business_annotated_with_neighborhood as (
    select lic.objectid ,lic.address,lic.licensenum, lic.licensetyp, nbh.name as neighborhood_name
	from business_licenses as lic
	left join neighborhoods_philadelphia as nbh
	on st_contains(nbh.the_geom, lic.the_geom) = true
	where lic.the_geom is not null
)
select bus.neighborhood_name, count(*) as number_of_restaurant
from business_annotated_with_neighborhood as bus
where bus.licensetyp like 'Food %'
group by bus.neighborhood_name
order by number_of_restaurant desc
limit 5