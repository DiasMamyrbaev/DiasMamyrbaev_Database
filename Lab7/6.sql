/* 6. Create a unique index for the passport_number of the Passengers table. Check
if the index was created or not. Insert into the table two new passengers.
Explain in your own words what is going on in the output?
*/

create unique index idx_passengers_passport
    on passengers (passport_number);

-- проверка, что индекс создан
select indexname, indexdef
from pg_indexes
where tablename = 'passengers'
  and indexname = 'idx_passengers_passport';

-- вставляем двух новых пассажиров
insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values
(501, 'Amir',  'Seitov', '1999-04-12', 'Male',   'Kazakhstan', 'Kazakhstan', 'L7000501', now(), now()),
(502, 'Laura', 'Kim',    '2001-09-30', 'Female', 'Kazakhstan', 'Kazakhstan', 'L7000502', now(), now());

select passenger_id, first_name, last_name, passport_number
from passengers
where passenger_id in (501, 502);


insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values (503, 'Dup', 'Passport', '1990-01-01', 'Male', 'Kazakhstan', 'Kazakhstan', 'L7000501', now(), now());



