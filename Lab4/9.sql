/* 9. Find number of airline names in each airline country and display only countries that have more
than one airline. */

select airline_country, count(airline_name) as total_airlines from airline
group by airline_country
having count(airline_name) > 1;

