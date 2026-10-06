-- 4.Retrieve airports that contain the word "Reginal" and "Air" in their names.

select * from airport
where airport_name ilike '%regional%' and airport_name ilike '%air%';

