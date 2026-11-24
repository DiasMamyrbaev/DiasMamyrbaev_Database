/* 8. Apply a discount to a booking for a specific passenger. If any error occurs, roll
back.*/

-- before change
select booking_id, passenger_id, ticket_price, ticket_discount
from booking
where booking_id = 4 and passenger_id = 5;

-- discount 15%
begin;

update booking b
set ticket_price = n.new_price,
    ticket_discount = case
                          when b.created_at >= timestamp '2024-01-01' then round(n.new_price * 0.05, 2)
                          else round(n.new_price * 0.10, 2)
                      end,
    updated_at = now()
from (
    select booking_id, round(ticket_price * 0.85, 2) as new_price
    from booking
    where booking_id = 4 and passenger_id = 5
) n
where b.booking_id = n.booking_id;

commit;

-- after change
select booking_id, passenger_id, ticket_price, ticket_discount
from booking
where booking_id = 4 and passenger_id = 5;

-- rollback test
begin;

update booking b
set ticket_price = n.new_price,
    ticket_discount = case
                          when b.created_at >= timestamp '2024-01-01' then round(n.new_price * 0.05, 2)
                          else round(n.new_price * 0.10, 2)
                      end,
    updated_at = now()
from (
    select booking_id, round(ticket_price * (1 - 1.50), 2) as new_price
    from booking
    where booking_id = 4 and passenger_id = 5
) n
where b.booking_id = n.booking_id;

rollback;

-- rollback check
select booking_id, passenger_id, ticket_price, ticket_discount
from booking
where booking_id = 4 and passenger_id = 5;


