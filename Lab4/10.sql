/* 10. Find flights that arrived late according to their actual arrival time compared to the scheduled
arrival time. Also calculate the percentage of delayed flights for each airline. */

select 
    a.airline_id,
    a.airline_name,
    count(case when f.act_arrival_time > f.sch_arrival_time then 1 end) as delayed_flights,
    count(f.flight_id) as total_flights,
    round(
        (count(case when f.act_arrival_time > f.sch_arrival_time then 1 end)::decimal / nullif(count(f.flight_id), 0)) * 100, 
        2
    ) as delayed_percentage
from airline a
left join flights f on a.airline_id = f.airline_id
group by a.airline_id, a.airline_name;

