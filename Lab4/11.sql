/* 11. Find each airline's total number of flights and average flight delay. Display only airlines that
have at least 3 flights and an average delay greater than 10 minutes. */

select 
    a.airline_id, a.airline_name,
    count(f.flight_id) as total_flights,
    avg(
        case 
            when f.act_arrival_time > f.sch_arrival_time 
            then extract(epoch from (f.act_arrival_time - f.sch_arrival_time)) / 60 
            else 0 
        end
    ) as avg_delay_minutes
from airline a
join flights f on a.airline_id = f.airline_id
group by a.airline_id, a.airline_name
having count(f.flight_id) >= 3 
   and avg(
        case 
            when f.act_arrival_time > f.sch_arrival_time 
            then extract(epoch from (f.act_arrival_time - f.sch_arrival_time)) / 60 
            else 0 
        end
   ) > 10;

