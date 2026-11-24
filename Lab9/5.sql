/* 5. A new passenger is registered, and a booking is created. Ensure the new
passenger is added and the booking succeeds.*/

-- registration + booking
begin;

insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values
(601, 'Aruzhan', 'Nurlanova', '2000-08-20', 'Female', 'Kazakhstan', 'Kazakhstan', 'L9000601', now(), now());

insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount, payment_date)
values
(801, 20, 601, 'Website', now(), now(), 'Confirmed', 200.00, 10.00, null);

commit;

-- check
select p.passenger_id, concat(p.first_name, ' ', p.last_name) as passenger_name,
       b.booking_id, b.flight_id, b.ticket_price, b.ticket_discount
from passengers p
join booking b on b.passenger_id = p.passenger_id
where p.passenger_id = 601;

-- rollback test
begin;

insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values
(602, 'Timur', 'Rollback', '1998-05-05', 'Male', 'Kazakhstan', 'Kazakhstan', 'L9000602', now(), now());

insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price, ticket_discount, payment_date)
values
(802, 21, 99999, 'Website', now(), now(), 'Confirmed', 200.00, 10.00, null);   -- ошибка: нарушение внешнего ключа

rollback;

-- rollback check
select count(*) as passenger_602_rows
from passengers
where passenger_id = 602;


