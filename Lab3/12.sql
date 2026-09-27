-- 12. Return airlines whose airline_code contains a digit.

select * from airline
where airline_code ~ '[0-9]';

