/*How many business licenses in total?*/
SELECT count(*) FROM business_licenses
/*How many businesses with a null geometry?*/
SELECT * FROM business_licenses
where the_geom is null
/*What are all of the types of business licenses?*/
select licensetyp, count(*) as number
from business_licenses
group by licensetyp
/*How many neighborhoods are there in this dataset?*/
select count(*)
from neighborhoods_philadelphia
/*Any fields appropriate to use as a unique key for neighborhoods?*/
name
