-- 2. Create a unique index to ensure flight_no and scheduled_departure
--combinations are unique.

create unique index uidx_flights_flight_sch_departure on flights (flight_id, sch_departure_time);


