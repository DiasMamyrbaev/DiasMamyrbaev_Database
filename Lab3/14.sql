--  14. Return all rows where booking_id is between 200 and 300 inclusive and check_result <> 'Checked'.

select * from Baggage_check
where booking_id between 200 and 300 and check_result <> 'Checked';

