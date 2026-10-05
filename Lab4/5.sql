/* 5. Retrieve passenger names and format their birth dates as 'Month DD, YYYY'. Also calculate
and display each passenger's current age. */

select 
    concat(first_name, ' ', last_name) as passenger_name,
    to_char(date_of_birth, 'fmmonth dd, yyyy') as formatted_birth_date,
    extract(year from age(current_date, date_of_birth)) as current_age
from passengers;

