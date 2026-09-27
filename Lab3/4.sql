-- 4. Find the average price of tickets sold for each month in sorted way.

select EXTRACT(month from created_at) as month, avg(ticket_price) as avg_price
from Booking 
group by extract(month from created_at)
order by month asc;

