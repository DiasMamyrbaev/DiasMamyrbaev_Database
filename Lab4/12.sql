/* 12. Find the top 3 most expensive tickets and display the passenger name, flight number, airline
name, and ticket price. */

select 
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    f.flight_id, a.airline_name, b.ticket_price
from booking b
join passengers p on b.passenger_id = p.passenger_id
join flights f on b.flight_id = f.flight_id
join airline a on f.airline_id = a.airline_id
order by b.ticket_price desc
limit 3;

