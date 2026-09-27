-- 7. Find all airline names based in Kazakhstan and sort them alphabetically.

select airline_name from airline
where airline_country = 'Kazakhstan'
order by airline_name asc;


