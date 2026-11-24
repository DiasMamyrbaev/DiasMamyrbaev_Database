/* 6. Increase the ticket price for all bookings on a specific flight by a fixed amount.*/

-- before change
select booking_id, ticket_price, ticket_discount
from booking
where flight_id = 12
order by booking_id;

-- increase
begin;

update booking b
set ticket_price = n.new_price,
    ticket_discount = case
                          when b.created_at >= timestamp '2024-01-01' then round(n.new_price * 0.05, 2)
                          else round(n.new_price * 0.10, 2)
                      end,
    updated_at = now()
from (
    select booking_id, ticket_price + 50.00 as new_price
    from booking
    where flight_id = 12
) n
where b.booking_id = n.booking_id;

commit;

-- after change
select booking_id, ticket_price, ticket_discount
from booking
where flight_id = 12
order by booking_id;


