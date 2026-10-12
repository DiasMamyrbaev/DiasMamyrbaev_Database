-- 4. Add a CHECK constraint to ensure that all values in airport_name must have at
--least 10 characters and does not consist only of spaces.

alter table airport
add constraint ck_airport_name_valid
check (char_length(airport_name) >= 10 and trim(airport_name) <> '');


-- check
select airport_id, airport_name, char_length(airport_name) as name_length, country, city
from airport
order by name_length;


-- title is too short
insert into airport (airport_id, airport_name, country, state, city, created_at, updated_at)
values (101, 'Short', 'Kazakhstan', 'Test', 'Test', now(), now());
-- ERROR: violates check constraint "ck_airport_name_valid"

-- title is only with space
insert into airport (airport_id, airport_name, country, state, city, created_at, updated_at)
values (102, '            ', 'Kazakhstan', 'Test', 'Test', now(), now());
-- ERROR: violates check constraint "ck_airport_name_valid"

