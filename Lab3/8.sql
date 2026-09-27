-- 8.Reduce the cost of booking price by 10% created before ’11-01-2023’.

update Booking set ticket_price = ticket_price * 0.90
where created_at < '11-01-2023';
