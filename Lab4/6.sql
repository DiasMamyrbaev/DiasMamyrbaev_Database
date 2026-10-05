/* 6. Find flight numbers that have been delayed based on the actual arrival time. Display the flight
number, scheduled arrival time, actual arrival time, and the delay duration in minutes. */

select 
    flight_id,
    sch_arrival_time as scheduled_arrival,
    act_arrival_time as actual_arrival,
    extract(epoch from (act_arrival_time - sch_arrival_time)) / 60 as delay_minutes
from flights
where act_arrival_time > sch_arrival_time;

