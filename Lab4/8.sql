/* 8. Create a query that categorizes ticket prices based on their price as "Cheap," "Medium" or
"Expensive." */

select 
    booking_id,
    ticket_price,
    case 
        when ticket_price < 100 then 'cheap'
        when ticket_price between 100 and 300 then 'medium'
        else 'expensive'
    end as price_category
from booking;

