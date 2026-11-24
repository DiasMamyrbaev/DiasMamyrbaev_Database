/* 7. Update a baggage weight. A passenger updates the declared weight of their
baggage. Ensure that the change is correctly reflected in the database.*/

--  before change
select bg.baggage_id, bg.booking_id, bg.weight_in_kg, bg.updated_at
from baggage bg
where bg.baggage_id = 5;

-- weight update
begin;

update baggage
set weight_in_kg = 18.50, updated_at = now()
where baggage_id = 5;

commit;

-- after change
select bg.baggage_id, bg.booking_id, bg.weight_in_kg, bg.updated_at
from baggage bg
where bg.baggage_id = 5;


