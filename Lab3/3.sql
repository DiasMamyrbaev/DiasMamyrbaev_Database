-- 3. Find all male passengers born between 1990 and 2000

select * from passengers
where gender IN ('M', 'Male') and date_of_birth between '1990-01-01' and '2000-12-31';

