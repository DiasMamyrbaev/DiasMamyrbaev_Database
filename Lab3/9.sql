-- 9. Find top3 overweighted baggage with more than 25kg and list in descending order.

select * from Baggage
where weight_in_kg > 25
order by weight_in_kg desc limit 3;

