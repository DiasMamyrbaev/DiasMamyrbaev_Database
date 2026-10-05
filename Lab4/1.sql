-- 1.Retrieve all airline names in uppercase and display them together with their countries.

select 
    upper(airline_name) as uppercase_airline_name, 
    airline_country
from airline;
