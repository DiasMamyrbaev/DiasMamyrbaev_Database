/* 8. Add a ticket_discount column to table booking and a CHECK constraint to
apply some discount based on ticket price and created time:
• the constraint applies a 5% discount for tickets created after 2024-01-01,
and 10% discount for tickets created before 2024-01-01. */

alter table booking add column ticket_discount decimal(7,2);

-- fill in the discount for existing lines
update booking
set ticket_discount = case
        when created_at >= timestamp '2024-01-01' then round(ticket_price * 0.05, 2)
        else                                           round(ticket_price * 0.10, 2)
    end;

alter table booking alter column ticket_discount set not null;

alter table booking
add constraint ck_booking_discount
    check (
        ticket_discount = case
            when created_at >= timestamp '2024-01-01' then round(ticket_price * 0.05, 2)
            else                                           round(ticket_price * 0.10, 2)
        end
    );

-- Demo: old ticket (up to 2024) with a 10% discount
insert into booking
    (booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount)
values
    (61, 1, 1, 'Website', '2023-06-15 10:00', '2023-06-15 10:00', 'Confirmed', 200.00, 20.00);




-- check
select booking_id, created_at, ticket_price, ticket_discount, round(ticket_discount / nullif(ticket_price, 0) * 100) as discount_percent, ticket_price - ticket_discount as price_after_discount
from booking
where booking_id between 321 and 328
order by created_at;


-- Invalid discount, should be 5.00, not 10.00
insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount)
values (63, 4, 5, 'Website', '2025-01-01 10:00', '2025-01-01 10:00', 'Confirmed', 100.00, 10.00);
-- ERROR: violates check constraint "ck_booking_discount"

