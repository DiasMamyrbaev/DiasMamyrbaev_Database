-- 6. Add a CHECK constraint to ensure that male passengers must be at least 18
-- years old and female passengers must be 19 years old.

update passengers
set date_of_birth = '2006-02-11'
where passenger_id = 10;

alter table passengers
add constraint ck_passengers_gender_age
    check (
        case gender
            when 'Male'   then extract(year from age(current_date, date_of_birth)) >= 18
            when 'Female' then extract(year from age(current_date, date_of_birth)) >= 19
            else true
        end
    );


-- check
select passenger_id, concat(first_name, ' ', last_name) as passenger_name, gender, extract(year from age(current_date, date_of_birth)) as age,
case gender when 'Male' then 18 when 'Female' then 19 end as min_age_required
from passengers
where passenger_id between 211 and 218
order by gender, age;


-- woman is 18. Need 19 or more
insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values (104, 'Young', 'Woman', current_date - interval '18 years 6 months', 'Female', 'Kazakhstan', 'Kazakhstan', 'T0000104', now(), now());
-- ERROR: violates check constraint "ck_passengers_gender_age"
