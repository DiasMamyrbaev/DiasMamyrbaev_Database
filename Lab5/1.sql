-- 1.Add a CHECK constraint to passenger table to provide that passengers must be
-- at least 10 years old and no older than 100 years old.

alter table passengers
add constraint ck_passengers_age_10_100
check (extract(year from age(current_date, date_of_birth)) between 10 and 100);

-- check
select passenger_id, concat(first_name, ' ', last_name) as passenger_name, gender, country_of_citizenship, date_of_birth, extract(year from age(current_date, date_of_birth)) as age
from passengers
where passenger_id between 201 and 210
order by age desc;

-- older than 100 year
insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values (101, 'Too', 'Old', current_date - interval '105 years', 'Male', 'Germany', 'Germany', 'T0000101', now(), now());
-- ERROR: violates check constraint "ck_passengers_age_10_100"

