/* 7.Create a view in which you can display the full name and country of origin of
passengers who made bookings on Leffler-Thompson platform. Then show the
list of that passengers. */

create view v_leffler_thompson_passengers as
select distinct
    p.passenger_id,
    concat(p.first_name, ' ', p.last_name) as full_name,
    p.country_of_citizenship as country_of_origin
from passengers p
join booking b on b.passenger_id = p.passenger_id
where b.booking_platform = 'Leffler-Thompson';

select * from v_leffler_thompson_passengers order by full_name;


