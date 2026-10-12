-- 5. Add UNIQUE constraint to some columns in each table in database.

alter table airline        add constraint uq_airline_code            unique (airline_code);
alter table airport        add constraint uq_airport_name            unique (airport_name);
alter table passengers     add constraint uq_passengers_passport     unique (passport_number);
alter table flights        add constraint uq_flights_airport_depart  unique (departing_airport_id, sch_departure_time);
alter table booking        add constraint uq_booking_passenger_flight unique (passenger_id, flight_id);
alter table booking_flight add constraint uq_booking_flight_pair     unique (booking_id, flight_id);
alter table baggage        add constraint uq_baggage_booking         unique (booking_id);
alter table baggage_check  add constraint uq_baggage_check_booking   unique (booking_id);
alter table boarding_pass  add constraint uq_boarding_pass_booking   unique (booking_id);
alter table security_check add constraint uq_security_passenger_time unique (passenger_id, created_at);


-- check
select 'airline.airline_code' as unique_column, count(*) as duplicate_groups
from (select airline_code from airline group by airline_code having count(*) > 1) t
union all
select 'airport.airport_name', count(*)
from (select airport_name from airport group by airport_name having count(*) > 1) t
union all
select 'passengers.passport_number', count(*)
from (select passport_number from passengers group by passport_number having count(*) > 1) t
union all
select 'flights(departing_airport_id, sch_departure_time)', count(*)
from (select departing_airport_id, sch_departure_time from flights group by 1, 2 having count(*) > 1) t
union all
select 'booking(passenger_id, flight_id)', count(*)
from (select passenger_id, flight_id from booking group by 1, 2 having count(*) > 1) t
union all
select 'booking_flight(booking_id, flight_id)', count(*)
from (select booking_id, flight_id from booking_flight group by 1, 2 having count(*) > 1) t
union all
select 'baggage.booking_id', count(*)
from (select booking_id from baggage group by booking_id having count(*) > 1) t
union all
select 'baggage_check.booking_id', count(*)
from (select booking_id from baggage_check group by booking_id having count(*) > 1) t
union all
select 'boarding_pass.booking_id', count(*)
from (select booking_id from boarding_pass group by booking_id having count(*) > 1) t
union all
select 'security_check(passenger_id, created_at)', count(*)
from (select passenger_id, created_at from security_check group by 1, 2 having count(*) > 1) t;


-- duplicate airport_code  
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
values (101, 'KC', 'Fake Airlines', 'Kazakhstan', now(), now());
-- ERROR: duplicate key value violates unique constraint "uq_airline_code"

-- duplicate passport 
insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at)
values (103, 'Dup', 'Passport', '1990-01-01', 'Male', 'Kazakhstan', 'Kazakhstan', 'N10000001', now(), now());
-- ERROR: duplicate key value violates unique constraint "uq_passengers_passport"


