/* 14. Analyze airport traffic. For each airport, calculate the number of departing flights, the number
of arriving flights, and the total number of flights. Display only airports with more than 10 total
flights and sort them by total traffic in descending order. */

select 
    ap.airport_id,
    ap.airport_name,
    count(case when f_dep.departing_airport_id is not null then 1 end) as departing_flights,
    count(case when f_arr.arriving_airport_id is not null then 1 end) as arriving_flights,
    (count(case when f_dep.departing_airport_id is not null then 1 end) + 
     count(case when f_arr.arriving_airport_id is not null then 1 end)) as total_flights
from airport ap
left join flights f_dep on ap.airport_id = f_dep.departing_airport_id
left join flights f_arr on ap.airport_id = f_arr.arriving_airport_id
group by ap.airport_id, ap.airport_name
having (count(case when f_dep.departing_airport_id is not null then 1 end) + 
        count(case when f_arr.arriving_airport_id is not null then 1 end)) > 10
order by total_flights desc;

