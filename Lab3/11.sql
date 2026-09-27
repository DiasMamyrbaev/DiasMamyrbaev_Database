-- 11. Find the cheapest booking price on each booking platform and list them in ascending order.

select booking_platform, min(ticket_price) as min_price
from Booking
group by booking_platform
order by min_price asc;

