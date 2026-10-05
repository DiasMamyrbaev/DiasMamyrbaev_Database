/* 7. Create a query that divides passengers into age groups like ‘Young’ and ‘Adult’ based on their
birth date. Young passengers age between 18 and 35, Adult passengers age between 36 and 55.
Also count how many people we have in each group. */

with passenger_groups as (
    select 
        passenger_id,
        case 
            when extract(year from age(current_date, date_of_birth)) between 18 and 35 then 'young'
            when extract(year from age(current_date, date_of_birth)) between 36 and 55 then 'adult'
            else 'other'
        end as age_group
    from passengers
)
select 
    age_group, 
    count(*) as total_passengers
from passenger_groups
where age_group in ('young', 'adult')
group by age_group;

