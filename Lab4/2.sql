/* 2. Replace any occurrence of the word "Air" in airline names with "Aero" and display both the
original and modified airline names. */

select 
    airline_name as original_name,
    replace(airline_name, 'air', 'aero') as modified_name
from airline;

