-- 10. Find the youngest passengers’ full name.

select concat(first_name, ' ', last_name) as full_name
from passengers
order by date_of_birth desc limit 1;

