/* 2. Add a CHECK constraint to accept values in booking price not more than
50000tg and less than 0tg. Additionally, the price must be specified with no
more than two decimal places. */

alter table booking
add constraint ck_booking_price_range
check (ticket_price >= 0 and ticket_price <= 50000);

alter table booking
add constraint ck_booking_price_2_decimals
check (ticket_price = round(ticket_price, 2));


-- check
select booking_id, passenger_id, booking_platform, ticket_price, ticket_discount, status
from booking
where booking_id between 301 and 310
order by ticket_price;


select min(ticket_price) as min_price, max(ticket_price) as max_price, count(*) as total_bookings
from booking;


-- price > 50000
insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount)
values (62, 2, 3, 'Website', '2026-01-01 10:00', '2026-01-01 10:00', 'Confirmed', 60000.00, 3000.00);
-- ERROR: violates check constraint "ck_booking_price_range"


-- price with -
insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount)
values (62, 2, 3, 'Website', '2026-01-01 10:00', '2026-01-01 10:00', 'Confirmed', -10.00, -0.50);
-- ERROR: violates check constraint "ck_booking_price_range"


