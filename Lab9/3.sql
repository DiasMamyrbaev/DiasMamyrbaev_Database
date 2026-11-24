/* 3. Updating ticket prices. You need to decrease the ticket price for a specific
flight for all existing bookings. If an error occurs, no changes should be
applied. */ 

-- before change
select booking_id, created_at, ticket_price, ticket_discount
from booking
where flight_id = 10
order by booking_id;

-- price reduction
begin;

update booking b
set ticket_price = n.new_price,
    ticket_discount = case
                          when b.created_at >= timestamp '2024-01-01' then round(n.new_price * 0.05, 2)
                          else round(n.new_price * 0.10, 2)
                      end,
    updated_at = now()
from (
    select booking_id, round(ticket_price * 0.90, 2) as new_price
    from booking
    where flight_id = 10
) n
where b.booking_id = n.booking_id;

commit;

-- after change
select booking_id, created_at, ticket_price, ticket_discount
from booking
where flight_id = 10
order by booking_id;

-- test
begin;

update booking b
set ticket_price = n.new_price,
    ticket_discount = case
                          when b.created_at >= timestamp '2024-01-01' then round(n.new_price * 0.05, 2)
                          else round(n.new_price * 0.10, 2)
                      end,
    updated_at = now()
from (
    select booking_id, round(ticket_price * 0.50, 2) as new_price
    from booking
    where flight_id = 10
) n
where b.booking_id = n.booking_id;

update booking
set ticket_price = ticket_price / 0                   
where flight_id = 10;

rollback;

-- check
select booking_id, ticket_price, ticket_discount
from booking
where flight_id = 10
order by booking_id;


