/* 13. Calculate the total amount spent by each passenger on flight tickets. Display the passenger's
name, number of purchased tickets, total amount spent, and average ticket price. */

select 
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    count(b.booking_id) as tickets_purchased,
    sum(b.ticket_price) as total_amount_spent,
    round(avg(b.ticket_price), 2) as average_ticket_price
from passengers p
join booking b on p.passenger_id = b.passenger_id
group by p.passenger_id, p.first_name, p.last_name;

