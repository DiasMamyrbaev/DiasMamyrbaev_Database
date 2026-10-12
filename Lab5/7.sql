/* 7. Add a CHECK constraint to add rule as follow (use column
country_of_citizenship):
• Passengers from Kazakhstan must be at least 18 years old.
• Passengers from France must be at least 17 years old.
• Passengers from other countries must be at least 19 years old. */

alter table passengers
add constraint ck_passengers_citizenship_age
    check (
        case country_of_citizenship
            when 'Kazakhstan' then extract(year from age(current_date, date_of_birth)) >= 18
            when 'France'     then extract(year from age(current_date, date_of_birth)) >= 17
            else                   extract(year from age(current_date, date_of_birth)) >= 19
        end
    );


-- check
select passenger_id, concat(first_name, ' ', last_name) as passenger_name, country_of_citizenship, gender, extract(year from age(current_date, date_of_birth)) as age,
    case country_of_citizenship
        when 'Kazakhstan' then 18
        when 'France'     then 17
        else 19
    end as min_age_by_country
from passengers
where passenger_id between 221 and 228
order by country_of_citizenship, age;


-- German citizen is 18 years old, must be >= 19
insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values (105, 'Young', 'German', current_date - interval '18 years 6 months', 'Male', 'Germany', 'Germany', 'T0000105', now(), now());
-- ERROR: violates check constraint "ck_passengers_citizenship_age"
