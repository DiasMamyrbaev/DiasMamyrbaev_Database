-- 5. Write a query that calculates the average, total, maximum and minimum
-- price of tickets for each flight. 

select
    b.flight_id,
    count(b.booking_id) as total_tickets,
    round(avg(b.ticket_price), 2) as avg_price,
    sum(b.ticket_price) as total_price,
    max(b.ticket_price) as max_price,
    min(b.ticket_price) as min_price
from booking b
group by b.flight_id
order by b.flight_id;


