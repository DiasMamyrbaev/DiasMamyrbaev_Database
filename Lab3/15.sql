/* 15. Baggage checks where update_at is in the same month as created_at but
 occurs earlier than created_at.
*/ 

select * from Baggage_check
where extract(month from updated_at) = extract(month from created_at)
and extract(year from updated_at) = extract(year from created_at)
and updated_at < created_at;


