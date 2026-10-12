-- 9. Add a CHECK constraint ensuring that the booking follows these rules:
-- • If status = 'PAID', then payment_date must not be NULL

alter table booking
add column payment_date timestamp;

update booking
set status = 'PAID'
where status = 'Paid';

update booking
set payment_date = created_at + interval '1 hour'
where status = 'PAID';

alter table booking
add constraint ck_booking_paid_requires_date
check (status <> 'PAID' or payment_date is not null);


-- check

select booking_id, status, ticket_price, payment_date,
    case
        when status = 'PAID' then 'payment_date required (filled)'
        else 'payment_date not required'
    end as rule_note
from booking
where booking_id between 341 and 348
order by booking_id;

-- summary of the entire booking table: all PAIDs have a filled date
select status, count(*) as total_bookings, count(payment_date) as with_payment_date
from booking
group by status
order by status;


-- PAID without payment_date
insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount, payment_date)
values (64, 6, 7, 'Website', '2025-01-01 10:00', '2025-01-01 10:00', 'PAID', 100.00, 5.00, null);
-- ERROR: violates check constraint "ck_booking_paid_requires_date"

-- PAID with payment_date, must be accepted
insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount, payment_date)
values (64, 6, 7, 'Website', '2025-01-01 10:00', '2025-01-01 10:00', 'PAID', 100.00, 5.00, '2025-01-01 11:00');
-- OK: 1 row inserted
