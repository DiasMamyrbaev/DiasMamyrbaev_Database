insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values
(1, 'KC',  'Air Astana',        'Kazakhstan', '2025-01-10 09:00', '2025-01-10 09:00'),
(2, 'DV',  'SCAT Airlines',     'Kazakhstan', '2025-01-10 09:00', '2025-01-10 09:00'),
(3, 'TK',  'Turkish Airlines',  'Turkey',     '2025-01-10 09:00', '2025-01-10 09:00'),
(4, 'PC',  'Pegasus Airlines',  'Turkey',     '2025-01-10 09:00', '2025-01-10 09:00'),
(5, 'LH',  'Lufthansa',         'Germany',    '2025-01-10 09:00', '2025-01-10 09:00'),
(6, 'EK',  'Emirates',          'UAE',        '2025-01-10 09:00', '2025-01-10 09:00');



insert into airport (airport_id, airport_name, country, state, city, created_at, updated_at) values
(956765, 'Almaty International Airport', 'Kazakhstan', 'Almaty Region',    'Almaty',    '2025-01-10 09:00', '2025-01-10 09:00'),
(4756, 'Shymkent Regional Airport',    'Kazakhstan', 'Turkistan Region', 'Shymkent',  '2025-01-10 09:00', '2025-01-10 09:00'),
(3075467, 'Karaganda Regional Airport',   'Kazakhstan', 'Karaganda Region', 'Karaganda', '2025-01-10 09:00', '2025-01-10 09:00'),
(40745, 'Istanbul Airport',             'Turkey',     'Istanbul',         'Istanbul',  '2025-01-10 09:00', '2025-01-10 09:00'),
(56476, 'Frankfurt Airport',            'Germany',    'Hesse',            'Frankfurt', '2025-01-10 09:00', '2025-01-10 09:00'),
(6647, 'Dubai International Airport',  'UAE',        'Dubai',            'Dubai',     '2025-01-10 09:00', '2025-01-10 09:00');



insert into passengers
(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, country_of_residence, passport_number, created_at, updated_at) values
(1,  'Dias',    'Akhmetov',     '2002-03-14', 'Male',   'Kazakhstan', 'Kazakhstan', 'N10000001', '2025-02-01 10:00', '2025-02-01 10:00'),
(2,  'Aigerim', 'Sadykova',     '1998-07-21', 'Female', 'Kazakhstan', 'Kazakhstan', 'N10000002', '2025-02-01 10:00', '2025-02-01 10:00'),
(3,  'Nurlan',  'Bekov',        '1985-11-02', 'Male',   'Kazakhstan', 'Turkey',     'N10000003', '2025-02-01 10:00', '2025-02-01 10:00'),
(4,  'Madina',  'Zhaksylykova', '1990-05-30', 'Female', 'Kazakhstan', 'Kazakhstan', 'N10000004', '2025-02-01 10:00', '2025-02-01 10:00'),
(5,  'Alexey',  'Ivanov',       '1975-01-19', 'Male',   'Russia',     'Kazakhstan', 'R20000005', '2025-02-01 10:00', '2025-02-01 10:00'),
(6,  'Elena',   'Petrova',      '1968-09-09', 'Female', 'Russia',     'Russia',     'R20000006', '2025-02-01 10:00', '2025-02-01 10:00'),
(7,  'Arman',   'Tulegenov',    '2000-12-25', 'Male',   'Kazakhstan', 'Germany',    'N10000007', '2025-02-01 10:00', '2025-02-01 10:00'),
(8,  'Saltanat','Omarova',      '1982-04-17', 'Female', 'Kazakhstan', 'Kazakhstan', 'N10000008', '2025-02-01 10:00', '2025-02-01 10:00'),
(9,  'Timur',   'Kasymov',      '1995-08-08', 'Male',   'Kazakhstan', 'UAE',        'N10000009', '2025-02-01 10:00', '2025-02-01 10:00'),
(10, 'Dana',    'Nurpeisova',   '2008-02-11', 'Female', 'Kazakhstan', 'Kazakhstan', 'N10000010', '2025-02-01 10:00', '2025-02-01 10:00'),
(11, 'John',    'Smith',        '1960-06-06', 'Male',   'USA',        'USA',        'U30000011', '2025-02-01 10:00', '2025-02-01 10:00'),
(12, 'Anna',    'Muller',       '1979-10-03', 'Female', 'Germany',    'Germany',    'G40000012', '2025-02-01 10:00', '2025-02-01 10:00'),
(13, 'Yerlan',  'Abenov',       '1993-03-03', 'Male',   'Kazakhstan', 'Kazakhstan', 'N10000013', '2025-02-01 10:00', '2025-02-01 10:00'),
(14, 'Kamila',  'Sultanova',    '2004-09-15', 'Female', 'Kazakhstan', 'Turkey',     'N10000014', '2025-02-01 10:00', '2025-02-01 10:00'),
(15, 'Ruslan',  'Dosov',        '1971-12-12', 'Male',   'Kazakhstan', 'Kazakhstan', 'N10000015', '2025-02-01 10:00', '2025-02-01 10:00');



with g as (
    select
        n,
        (n % 6) + 1 as al,
        timestamp '2026-01-01 06:00' + n * interval '9 hours' as dep
    from generate_series(1, 40) as n
)
insert into flights
(flight_id, sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id,
 departing_gate, arriving_gate, airline_id, act_departure_time, act_arrival_time, created_at, updated_at)
select
    n,
    dep,
    dep + (2 + n % 4) * interval '1 hour',
    (n % 6) + 1,
    ((n + 2) % 6) + 1,
    'A' || (n % 10 + 1),
    'B' || (n % 8 + 1),
    al,
    dep + (n % 3) * interval '5 minutes',
    dep + (2 + n % 4) * interval '1 hour' + (al * 7 - 10 + n % 5) * interval '1 minute',
    timestamp '2025-12-15 08:00',
    timestamp '2025-12-15 08:00'
from g;



insert into booking
(booking_id, flight_id, passenger_id, booking_platform, created_at, updated_at, status, ticket_price)
select
    n,
    (n % 40) + 1,
    (n % 15) + 1,
    (array['Website', 'Mobile App', 'Travel Agency', 'Call Center'])[n % 4 + 1],
    timestamp '2025-12-01 12:00' + n * interval '1 day',
    timestamp '2025-12-01 12:00' + n * interval '1 day',
    (array['Confirmed', 'Paid', 'Checked-in', 'Cancelled'])[n % 4 + 1],
    round((40 + ((n * 37) % 461) + (n % 100) / 100.0)::numeric, 2)
from generate_series(1, 60) as n;



insert into booking_flight (booking_flight_id, booking_id, flight_id, created_at, updated_at)
select
    b.booking_id,
    b.booking_id,
    b.flight_id,
    b.created_at,
    b.updated_at
from booking b;


insert into baggage (baggage_id, weight_in_kg, created_at, updated_at, booking_id)
select
    n,
    round((5 + ((n * 37) % 2500) / 100.0)::numeric, 2),
    timestamp '2026-01-01 08:00' + n * interval '1 day',
    timestamp '2026-01-01 08:00' + n * interval '1 day',
    n
from generate_series(1, 50) as n;



insert into baggage_check (baggage_check_id, check_result, created_at, updated_at, booking_id, passenger_id)
select
    b.booking_id,
    (array['Passed', 'Passed', 'Passed', 'Additional inspection', 'Failed'])[b.booking_id % 5 + 1],
    timestamp '2026-01-01 09:00' + b.booking_id * interval '1 day',
    timestamp '2026-01-01 09:00' + b.booking_id * interval '1 day',
    b.booking_id,
    b.passenger_id
from booking b
where b.booking_id <= 50;



insert into boarding_pass (boarding_pass_id, booking_id, seat, boarding_time, created_at, updated_at)
select
    b.booking_id,
    b.booking_id,
    ((b.booking_id % 30) + 1) || chr(65 + b.booking_id % 6),
    f.sch_departure_time - interval '45 minutes',
    f.sch_departure_time - interval '1 day',
    f.sch_departure_time - interval '1 day'
from booking b
join flights f on f.flight_id = b.flight_id;



insert into security_check (security_check_id, check_result, created_at, updated_at, passenger_id)
select
    n,
    (array['Passed', 'Passed', 'Passed', 'Passed', 'Failed'])[n % 5 + 1],
    timestamp '2026-01-01 07:00' + n * interval '1 day',
    timestamp '2026-01-01 07:00' + n * interval '1 day',
    (n % 15) + 1
from generate_series(1, 30) as n;



select 'airline' as tbl, count(*) from airline
union all select 'airport',        count(*) from airport
union all select 'passengers',     count(*) from passengers
union all select 'flights',        count(*) from flights
union all select 'booking',        count(*) from booking
union all select 'booking_flight', count(*) from booking_flight
union all select 'baggage',        count(*) from baggage
union all select 'baggage_check',  count(*) from baggage_check
union all select 'boarding_pass',  count(*) from boarding_pass
union all select 'security_check', count(*) from security_check;



insert into flights
(flight_id, sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id,
 departing_gate, arriving_gate, airline_id, act_departure_time, act_arrival_time, created_at, updated_at)
values
(41, '2026-02-20 10:00', '2026-02-20 13:00', 1, 3, 'A1', 'B1', 2,
     '2026-02-20 10:05', '2026-02-20 13:20', '2025-12-15 08:00', '2025-12-15 08:00'),
(42, '2026-02-21 11:00', '2026-02-21 14:00', 2, 4, 'A2', 'B2', 1,
     '2026-02-21 11:00', '2026-02-21 14:15', '2025-12-15 08:00', '2025-12-15 08:00');