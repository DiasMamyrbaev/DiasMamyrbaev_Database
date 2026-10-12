-- 3. Add a CHECK constraint to accept the luggage weight between 1 and 23 kg. If
-- a passenger has no luggage, the value should be allowed to remain NULL.

alter table baggage alter column weight_in_kg drop not null;

update baggage
set weight_in_kg = round(weight_in_kg * 0.75, 2)
where weight_in_kg > 23;

alter table baggage
add constraint ck_baggage_weight
check (weight_in_kg is null or weight_in_kg between 1 and 23);

-- demonstration passenger without luggage (NULL)
insert into baggage (baggage_id, weight_in_kg, created_at, updated_at, booking_id)
values (51, null, now(), now(), 51);

-- check
select
    bg.baggage_id, bg.booking_id,
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    bg.weight_in_kg,
    case when bg.weight_in_kg is null then 'no luggage' else 'has luggage' end as luggage_status
from baggage bg
join booking b  on b.booking_id   = bg.booking_id
join passengers p on p.passenger_id = b.passenger_id
where bg.baggage_id between 301 and 310
order by bg.weight_in_kg nulls last;


-- weight 25 kg
insert into baggage (baggage_id, weight_in_kg, created_at, updated_at, booking_id)
values (101, 25.00, now(), now(), 52);
-- ERROR: violates check constraint "ck_baggage_weight"

-- weight 0.5 kgg
insert into baggage (baggage_id, weight_in_kg, created_at, updated_at, booking_id)
values (101, 0.50, now(), now(), 52);
-- ERROR: violates check constraint "ck_baggage_weight"

