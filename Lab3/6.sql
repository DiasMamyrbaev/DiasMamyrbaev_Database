-- 6. Show airlines from any of: ('France','Portugal','Poland') created between '2023-11-01' and '2024-03-31'.


select * from airline
where airline_country in ('France', 'Portugal', 'Poland')
and created_at between '2023-11-01' and '2024-03-31';

